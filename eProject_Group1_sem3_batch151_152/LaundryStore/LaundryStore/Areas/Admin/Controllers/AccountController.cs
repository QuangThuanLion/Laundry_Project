using LaundryStore.Common;
using LaundryStore.Models;
using LaundryStore.Utils;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace LaundryStore.Areas.Admin.Controllers
{
    public class AccountController : Controller
    {
        // GET: Admin/Account
        public ActionResult Login(string message = null)
        {
            if (message != null)
            {
                Dictionary<string, string> viewData = MessageUtil.getMessage(message);
                ViewData["message"] = viewData["message"];
                ViewData["alert"] = viewData["alert"];
            }
            return View();
        }

        [HttpPost]
        public ActionResult Login(string email, string password)
        {
            if (email != null && password != null)
            {
                using (LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities())
                {
                    var account = db.Employees.Where(x => x.email.Equals(email)).SingleOrDefault();
                    if (account != null)
                    {
                        var passwordCheck = account.password.Equals(password);
                        if (passwordCheck)
                        { 
                            Session["username_Employee"] = account.fullname;
                            Session["email_Employee"] = account.email;
                            Session["password_Employee"] = account.password;
                            Session["id_Employee"] = account.id;
                            FormsAuthentication.SetAuthCookie(email, false);
                            return RedirectToAction("Index", "DashBoard");
                        } else
                        {
                            return new RedirectResult(url: "/Admin/Account/Login?message=invalid_password");
                        }
                    } else
                    {
                        return new RedirectResult(url: "/Admin/Account/Login?message=invalid_email");
                    }                   
                }
            }
            return RedirectToAction("Index", "DashBoard");
        }

        [HttpGet]
        public ActionResult infoProfile(int? id)
        {
            LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();
            string message = Request.QueryString["message"];
            if (message != null)
            {
                Dictionary<string, string> viewData = MessageUtil.getMessage(message);
                ViewData["message"] = viewData["message"];
                ViewData["alert"] = viewData["alert"];
            }
            Employee employee = db.Employees.Where(x => x.id == id).SingleOrDefault();
            List<AccountRole> listAccount = db.AccountRoles.Where(x => x.employeeId == employee.id).ToList();
            int[] arrayRole = new int[listAccount.Count];
            for (int i = 0; i < listAccount.Count; i++)
            {
                arrayRole[i] = listAccount[i].Role.id;
            }
            ViewBag.RoleEmployee = arrayRole[0];
            ViewBag.PasswordEmployee = Session["password_Employee"];
            ViewBag.IdEmployee = Session["id_Employee"];
            return View(employee);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult EditProfile([Bind(Include = "id,email,password,fullname,phone,gender,dayOfBirth,address,avatar,dateStart,dateEnd,contractSalary,unitSalary,workTime,schedule,createdDate,createdBy,modifyDate,modifyBy,status,activated")] Employee employee,
                                    HttpPostedFileBase avatar, string roleEmployee)
        {
            LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();
            if (ModelState.IsValid)
            {
                string path = Server.MapPath("/Assets/Admin/resources/image");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                if (employee.avatar != null)
                {
                    avatar.SaveAs(path + "/" + avatar.FileName);
                    employee.avatar = "Assets/Admin/resources/image/" + avatar.FileName;
                }
                else
                {
                    employee.avatar = "Assets/Admin/resources/image/" + "userDefault.jpg";
                }

                AccountRole account = new AccountRole();
                account.employeeId = employee.id;
                account.roleId = Int32.Parse(roleEmployee);
                employee.modifyDate = DateTime.Now;
                employee.modifyBy = Session["username_Employee"].ToString();
                long idEmployee = employee.id;
                db.AccountRoles.Add(account);
                db.Entry(employee).State = EntityState.Modified;
                db.SaveChanges();
                return new RedirectResult(url: "/Admin/Account/infoProfile/"+ idEmployee + "?message=update_success");
            }
            return View(employee);
        }

        [HttpPost]
        public JsonResult changePassword(long id, string newPass)
        {
            LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();
            Employee employee = db.Employees.Where(x => x.id == id).FirstOrDefault();
            employee.password = newPass;
            db.SaveChanges();
            return Json(1, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult forgotPassword(string message = null)
        {
            if (message != null)
            {
                Dictionary<string, string> viewData = MessageUtil.getMessage(message);
                ViewData["message"] = viewData["message"];
                ViewData["alert"] = viewData["alert"];
            }
            return View();
        }

        [HttpPost]
        public ActionResult forgotPassword(FormCollection form)
        {
            LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();
            string email = Request.Form["email"];
            Employee employee = db.Employees.Where(x => x.email.Equals(email)).FirstOrDefault();
            if (employee == null)
            {
                return new RedirectResult(url: "/Admin/Account/forgotPassword?message=invalid_email");
            } else
            {
                string password = employee.password;
                SendEmail.SendMail("Gửi từ Laundry Store, Xác nhận người dùng ! ", employee.email, " lấy lại mật khẩu !" +
                       " Với tên đăng nhập : " + employee.email +
                       " Mật khẩu của bạn là: "+password+", click đường dẫn dưới đây để quay về trang đăng nhập " + "https://localhost:44335/Admin/Account/Login");
                return new RedirectResult(url: "/Admin/Account/Login?message=confirm_email");
            }
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}