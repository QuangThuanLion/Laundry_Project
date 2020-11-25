using LaundryStore.Models;
using LaundryStore.Utils;
using System;
using System.Collections.Generic;
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

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}