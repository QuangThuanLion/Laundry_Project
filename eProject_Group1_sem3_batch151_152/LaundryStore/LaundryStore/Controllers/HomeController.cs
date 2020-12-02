using LaundryStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;

namespace LaundryStore.Controllers
{
    public class HomeController : Controller
    {
        //GET: Home
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";
            return View();
        }

        //GET: Contact
        public ActionResult Contact()
        {
            ViewBag.Title = "Contact Page";
            return View();
        }
    }
}
