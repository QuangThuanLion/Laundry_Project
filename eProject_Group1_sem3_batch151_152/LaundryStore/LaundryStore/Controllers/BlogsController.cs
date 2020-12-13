using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using LaundryStore.Common;
using LaundryStore.Models;
using LaundryStore.Utils;

namespace LaundryStore.Controllers
{
    public class BlogsController : Controller
    {
        private LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();

        // GET: Blogs
        public ActionResult Index()
        {
            var news = db.News.Include(n => n.PostCategory).OrderByDescending(n => n.createdDate);
            return View(news.ToList());
        }

        //nhung bai viet moi nhat
        public ActionResult RenderBlog()
        {
            var news = db.News.Include(n => n.PostCategory).OrderByDescending(n => n.createdDate);
            return PartialView("_RenderBlog", news.ToList());
        }
        
        //danh muc bai viet
        public ActionResult PostCategories()
        {
            List<PostCategory> listPostCategories = db.PostCategories.ToList();
            return PartialView("_RenderPostCategories", listPostCategories);
        }

        //danh muc bai bai viet noi bat - lay 5 bai viet noi bat nhat
        //bai viet noi bat la bai viet co so luot comment nhieu nhat sap xep theo thu tu giam dan
        /*public ActionResult PostPopular()
        {
            List<>
        }*/

        // GET: Blogs/Details/5
        [HttpGet]
        public ActionResult Details(int? id, string message = null)
        {
            //check dieu kien de tra ve thong bao
            if (message != null)
            {
                Dictionary<string, string> viewData = MessageUtil.getMessage(message);
                ViewData["message"] = viewData["message"];
                ViewData["alert"] = viewData["alert"];
            }

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            List<Comment> listComment = db.Comments.Where(c => c.newId == id).ToList();
            ViewBag.listComment = listComment;
            return View(news);
        }

        //POST: Login from checkout form
        [HttpPost]
        public ActionResult LoginToComment(string email, string password)
        {
            string idPost = Request.Form["idPost"];
            if (email != null && password != null)
            {
                using (LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities())
                {
                    var account = db.Customers.Where(x => x.email.Equals(email)).FirstOrDefault();
                    if (account != null)
                    {
                        if (account.activated == true)
                        {
                            var passwordCheck = account.password.Equals(EncryptPassword.EncryptForPassword(password));
                            if (passwordCheck)
                            {
                                Session["username_Customer"] = account.fullname;
                                Session["email_Customer"] = account.email;
                                Session["password_Customer"] = account.password;
                                Session["id_Customer"] = account.id;
                                Session["image_Customer"] = account.avatar;
                                FormsAuthentication.SetAuthCookie(email, false);
                                return new RedirectResult(url: "/Blogs/Details/"+ idPost + "?message=login_sucess");
                            }
                            else
                            {
                                return new RedirectResult(url: "/Blogs/Details/" + idPost + "?message=invalid_password");
                            }
                        }
                        else
                        {
                            return new RedirectResult(url: "/Blogs/Details/" + idPost + "?message=authentication_email");
                        }

                    }
                    else
                    {
                        return new RedirectResult(url: "/Blogs/Details/" + idPost + "?message=invalid_email");
                    }
                }
            }
            return new RedirectResult(url: "/Blogs/Details/"+ idPost);
        }

        // GET: Blogs/Create
        public ActionResult Create()
        {
            ViewBag.categoryPostId = new SelectList(db.PostCategories, "id", "categoryNamePost");
            return View();
        }

        // GET: y kien cua khach hang
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateMessage(FormCollection form)
        {
            string name = Request.Form["name"];
            string email = Request.Form["email"];
            string message = Request.Form["message"];
            string idPost = Request.Form["idPost"];
            string passwordDefault = "laundry1234";

            //khach hang khong dang nhap. tao tai khoan cho khach hang nhu email va ten ma khach hang nhap vao
            Customer customer = new Customer();
            if (Session["id_Customer"] == null)
            {
                var account = db.Customers.Where(x => x.email.Equals(email)).FirstOrDefault();
                if (account != null)
                {
                    return new RedirectResult(url: "/Blogs/Details/" + idPost + "?message=invalid_email");
                }
                customer.email = email;
                customer.password = EncryptPassword.EncryptForPassword(passwordDefault);
                customer.fullname = name;
                customer.avatar = "Assets/Admin/resources/image/" + "customerDefault.jpg";
                customer.activated = true;
                customer.status = true;
                customer.createdDate = DateTime.Now;
                customer.roleId = 3;

                db.Customers.Add(customer);
                db.SaveChanges();

                string password = EncryptPassword.DecryptPassword(customer.password);

                SendEmail.SendMail("Gửi từ Laundry Store, Xác nhận người dùng ! ", customer.email, " Bạn vừa đăng kí thành công tài khoản tại Laundry Store !" +
                       " Với tên đăng nhập : " + customer.email + 
                       " Bạn có thể sử dụng email trên để đăng nhập vào cửa hàng của chúng tôi với mật khẩu là : "+ password + " " +
                       " Vui lòng truy cập vào đường dẫn dưới đây để cập nhật thông tin tài khoản " + "https://localhost:44335/Account/infoProfile/"+customer.id);
            }
            //khach hang co dang nhap tai khoan
            else
            {
                var customerId = int.Parse(Session["id_Customer"].ToString());
                customer = db.Customers.Find(customerId);
                if (customer != null)
                {
                    customer.email = Session["email_Customer"].ToString();
                    customer.fullname = Session["username_Customer"].ToString();
                    customer.modifyDate = DateTime.Now;
                    customer.modifyBy = Session["username_Customer"].ToString();
                    db.SaveChanges();
                }
            }

            Comment comment = new Comment();
            comment.content = message;
            comment.customerId = customer.id;
            comment.newId = Convert.ToInt32(idPost);
            comment.createdDate = DateTime.Now;
            comment.createdBy = customer.fullname;
            comment.modifyDate = DateTime.Now;
            comment.modifyBy = customer.fullname;
            comment.status = true;
            db.Comments.Add(comment);
            db.SaveChanges();
            return new RedirectResult(url: "/Blogs/Details/" + idPost + "?message=comment");
        }

        // POST: Blogs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,title,thumbnail,shortDescription,content,categoryPostId,createdDate,createdBy,modifyDate,modifyBy,status")] News news)
        {
            if (ModelState.IsValid)
            {
                db.News.Add(news);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.categoryPostId = new SelectList(db.PostCategories, "id", "categoryNamePost", news.categoryPostId);
            return View(news);
        }

        // GET: Blogs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            ViewBag.categoryPostId = new SelectList(db.PostCategories, "id", "categoryNamePost", news.categoryPostId);
            return View(news);
        }

        // POST: Blogs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,title,thumbnail,shortDescription,content,categoryPostId,createdDate,createdBy,modifyDate,modifyBy,status")] News news)
        {
            if (ModelState.IsValid)
            {
                db.Entry(news).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.categoryPostId = new SelectList(db.PostCategories, "id", "categoryNamePost", news.categoryPostId);
            return View(news);
        }

        // GET: Blogs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // POST: Blogs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            News news = db.News.Find(id);
            db.News.Remove(news);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
