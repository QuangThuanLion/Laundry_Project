using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaundryStore.Controllers
{
    public class AboutController : Controller
    {
        //GET: About
        public ActionResult Index()
        {
            ViewBag.Title = "About Page";
            return View();
        }

        //GET: Detail
        public ActionResult Detail()
        {
            ViewBag.Title = "Detail Member Page";
            return View();
        }
    }
}