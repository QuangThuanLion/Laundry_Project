using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaundryStore.Controllers
{
    public class BlogController : Controller
    {
        // GET: Blog
        public ActionResult Index()
        {
            ViewBag.Title = "Blog Page";
            return View();
        }

        // GET: Blog Detail Id
        public ActionResult Detail()
        {
            ViewBag.Title = "Detail Blog Page";
            return View();
        }
    }
}