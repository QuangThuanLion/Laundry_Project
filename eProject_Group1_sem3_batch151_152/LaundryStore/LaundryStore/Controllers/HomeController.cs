using LaundryStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using LaundryStore.Utils;
using LaundryStore.Common;

namespace LaundryStore.Controllers
{
    public class HomeController : Controller
    {
        private LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();

        //GET: Home
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";
            return View();
        }

        //GET: Contact
        [HttpGet]
        public ActionResult Contact(string message = null)
        {
            //check dieu kien de tra ve thong bao
            if (message != null)
            {
                Dictionary<string, string> viewData = MessageUtil.getMessage(message);
                ViewData["message"] = viewData["message"];
                ViewData["alert"] = viewData["alert"];
            }
            ViewBag.Title = "Contact Page";
            return View();
        }

        [HttpPost]
        public ActionResult Contact(FormCollection form)
        {

            string first_name = Request.Form["first_name"];
            string last_name = Request.Form["last_name"];
            string fullname = null;
            if (first_name != null && last_name != null)
            {
                fullname = first_name + last_name;
            }
            string email = Request.Form["email"];
            string phone = Request.Form["phone"];
            string service = Request.Form["service"];
            string description = Request.Form["description"];

            //khach hang khong dang nhap. tao tai khoan cho khach hang nhu email va ten ma khach hang nhap vao
            //mat khau tao mac dinh la sdt cua khach hang dang nhap vao va minh tu kich hoat tai khoan cho no luon
            Customer customer = new Customer();
            if (Session["id_Customer"] == null)
            {
                var account = db.Customers.Where(x => x.email.Equals(email)).FirstOrDefault();
                if (account != null)
                {
                    return new RedirectResult(url: "/Home/Contact?message=invalid_email");
                }
                customer.email = email;
                customer.password = EncryptPassword.EncryptForPassword(phone);
                customer.fullname = fullname.ToString();
                customer.phone = Convert.ToInt32(phone);
                customer.avatar = "Assets/Client/resources/image/" + "customerDefault.jpg";
                customer.activated = true;
                customer.status = true;
                customer.createdDate = DateTime.Now;
                customer.roleId = 3;

                db.Customers.Add(customer);
                db.SaveChanges();

                SendEmail.SendMail("Gửi từ Laundry Store, Xác nhận người dùng ! ", customer.email, " Bạn vừa đăng kí thành công tài khoản tại Laundry Store !" +
                       " Với tên đăng nhập : " + customer.email + 
                       " Bạn có thể sử dụng email trên để đăng nhập vào cửa hàng của chúng tôi với mật khẩu là số điện thoại của bạn : "+ customer.phone +" " +
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

            Order order = new Order();
            order.customerId = customer.id;
            order.orderDate = DateTime.Now;
            order.paymentStatus = "doing";
            order.description = description;
            order.statusId = 2;
            order.createdBy = customer.fullname;
            order.status = true;
            db.Orders.Add(order);
            db.SaveChanges();

            OrderDetail orderDetail = new OrderDetail();
            orderDetail.orderId = order.id;
            orderDetail.productId = Convert.ToInt32(service);
            orderDetail.status = true;

            db.OrderDetails.Add(orderDetail);
            db.SaveChanges();
            return new RedirectResult(url: "/Home/Contact?message=contactSuccess");
        }
    }
}
