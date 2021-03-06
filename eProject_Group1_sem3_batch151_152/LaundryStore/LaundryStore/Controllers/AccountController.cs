﻿using LaundryStore.Common;
using LaundryStore.Models;
using LaundryStore.Utils;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace LaundryStore.Controllers
{
    public class AccountController : Controller
    {
        // GET: Login
        public ActionResult Login(string message = null)
        {    
            if (message != null)
            {
                Dictionary<string, string> viewData = MessageUtil.getMessage(message);
                ViewData["message"] = viewData["message"];
                ViewData["alert"] = viewData["alert"];
            }
            ViewBag.Title = "Login";
            return View();
        }

        [HttpPost]
        public ActionResult Login(string email, string password)
        {
            if (email != null && password != null)
            {
                using (LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities())
                {
                    var account = db.Customers.Where(x => x.email.Equals(email) && x.status == true && x.activated == true).FirstOrDefault();
                    if (account != null)
                    {
                        if(account.activated == true)
                        {
                            var passwordCheck = account.password.Equals(EncryptPassword.EncryptForPassword(password));
                            if (passwordCheck)
                            {
                                Session["username_Customer"] = account.fullname;
                                Session["email_Customer"] = account.email;
                                Session["password_Customer"] = EncryptPassword.DecryptPassword(account.password);
                                Session["id_Customer"] =  account.id;
                                Session["image_Customer"] = account.avatar;
                                FormsAuthentication.SetAuthCookie(email, false);
                                return RedirectToAction("Index", "Home");
                            }
                            else
                            {
                                return new RedirectResult(url: "/Account/Login?message=invalid_password");
                            }
                        } else
                        {
                            return new RedirectResult(url: "/Account/Login?message=authentication_email");
                        }
                        
                    }
                    else
                    {
                        return new RedirectResult(url: "/Account/Login?message=invalid_email");
                    }
                }
            }
            return View();
        }

        // GET: RegisterAccount
        public ActionResult RegisterAccount(string message = null)
        {
            if (message != null)
            {
                Dictionary<string, string> viewData = MessageUtil.getMessage(message);
                ViewData["message"] = viewData["message"];
                ViewData["alert"] = viewData["alert"];
            }
            ViewBag.Title = "RegisterAccount";
            return View();
        }    

        [HttpPost]
        public ActionResult RegisterAccount(FormCollection form)
        {
            LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();
            string email = Request.Form["email"];
            string password = Request.Form["password"];
            string confirmPassword = Request.Form["confirmPassword"];

            var checkEmail = db.Customers.Where(c => c.email.Equals(email)).FirstOrDefault();
            if (checkEmail != null)
            {
                return new RedirectResult(url: "/Account/RegisterAccount?message=email_exists");
            }
            else
            {
                if (!password.Equals(confirmPassword))
                {
                    return new RedirectResult(url: "/Account/RegisterAccount?message=invalid_password");
                }
                else
                {
                    Customer customer = new Customer();
                    customer.email = email;
                    customer.password = EncryptPassword.EncryptForPassword(password);
                    customer.fullname = "";
                    customer.address = "";
                    customer.idCounty = 1;
                    customer.avatar = "Assets/Client/resources/image/" + "customerDefault.jpg";
                    customer.activated = false;
                    customer.status = true;
                    customer.createdDate = DateTime.Now;
                    customer.modifyDate = DateTime.Now;
                    customer.dayOfBirth = DateTime.Now;
                    customer.modifyBy = "";
                    customer.roleId = 3;             

                    db.Customers.Add(customer);
                    db.SaveChanges();

                    SendEmail.SendMail("Gửi từ Laundry Store, Xác nhận người dùng ! ", customer.email, " Bạn vừa đăng kí thành công tài khoản tại Laundry Store !" +
                       " Với tên đăng nhập : " + customer.email +
                       " Để kích hoạt tài khoản vừa đăng kí, vui lòng xác nhận tại đường dẫn tại đây: " + "https://localhost:44335/Account/ActiveEmail/?username=" + customer.email);

                    return new RedirectResult(url: "/Account/RegisterAccount?message=confirm_email");
                }
            }

        }

        // nhận xác nhân email
        public ActionResult ActiveEmail(string username)
        {
            LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();
            Customer customer = db.Customers.Where(c => c.email.Equals(username)).SingleOrDefault();
            if (customer != null)
            {
                customer.activated = true;
                db.SaveChanges();
                return new RedirectResult(url: "/Account/Login?message=insert_success");
            }
            return View(customer);
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
            Customer customer = db.Customers.Where(c => c.email.Equals(email)).FirstOrDefault();
            if (customer == null)
            {
                return new RedirectResult(url: "/Account/forgotPassword?message=invalid_email");
            }
            else
            {
                string password = EncryptPassword.DecryptPassword(customer.password);
                SendEmail.SendMail("Gửi từ Laundry Store, Xác nhận người dùng ! ", customer.email, " lấy lại mật khẩu !" +
                       " Với tên đăng nhập : " + customer.email +
                       " Mật khẩu của bạn là: " + password + ", click đường dẫn dưới đây để quay về trang đăng nhập " + "https://localhost:44335/Account/Login");
                return new RedirectResult(url: "/Account/forgotPassword?message=confirm_email");
            }
        }

        [HttpPost]
        public JsonResult changePassword(long id, string newPass)
        {
            LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();
            Customer customer = db.Customers.Where(x => x.id == id).FirstOrDefault();
            customer.password = EncryptPassword.EncryptForPassword(newPass);
            db.SaveChanges();
            return Json(1, JsonRequestBehavior.AllowGet);
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
            Customer customer = db.Customers.Where(x => x.id == id).SingleOrDefault();
            ViewBag.idCounty = new SelectList(db.Counties, "id", "name");
            return View(customer);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditProfile([Bind(Include = "id,email,password,fullname,phone,gender,dayOfBirth,address,avatar,idCounty,activated,status,createdDate,modifyDate,modifyBy,roleId")] Customer customer,
                        HttpPostedFileBase avatar)
        {
            LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();
            if (ModelState.IsValid)
            {
                string path = Server.MapPath("/Assets/Client/resources/image");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                if (customer.avatar != null)
                {
                    avatar.SaveAs(path + "/" + avatar.FileName);
                    customer.avatar = "Assets/Client/resources/image/" + avatar.FileName;
                }
                else
                {
                    customer.avatar = "Assets/Client/resources/image/" + "customerDefault.jpg";
                }

                customer.modifyDate = DateTime.Now;
                customer.modifyBy = Session["username_Customer"].ToString();
                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return new RedirectResult(url: "/Account/infoProfile/"+customer.id+"?message=update_success");
            }
            ViewBag.idCounty = new SelectList(db.Counties, "id", "name", customer.idCounty);
            return View(customer);
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session["username_Customer"] = null;
            Session["email_Customer"] = null;
            Session["password_Customer"] = null;
            Session["id_Customer"] = null;
            Session["image_Customer"] = null;
            return RedirectToAction("Login");
        }

    }
}