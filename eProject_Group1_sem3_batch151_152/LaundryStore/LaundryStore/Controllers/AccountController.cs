using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaundryStore.Controllers
{
    public class AccountController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            ViewBag.Title = "Login";
            return View();
        }

        // GET: RegisterAccount
        public ActionResult RegisterAccount()
        {
            ViewBag.Title = "RegisterAccount";
            return View();
        }

    }
}