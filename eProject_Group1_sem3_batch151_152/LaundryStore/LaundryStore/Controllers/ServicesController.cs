using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaundryStore.Controllers
{
    public class ServicesController : Controller
    {
        // GET: Services
        public ActionResult Index()
        {
            ViewBag.Title = "Index Page";
            return View();
        }

        // GET: Services
        public ActionResult Detail()
        {
            ViewBag.Title = "Detail Page";
            return View();
        }
    }
}