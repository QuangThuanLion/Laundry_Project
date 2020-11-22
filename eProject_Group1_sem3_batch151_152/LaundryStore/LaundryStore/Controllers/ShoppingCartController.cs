using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaundryStore.Controllers
{
    public class ShoppingCartController : Controller
    {
        // GET: ShoppingCart
        public ActionResult ShowCart()
        {
            ViewBag.Title = "Contact Page";
            return View();
        }

        // GET: Checkout
        public ActionResult Checkout()
        {
            ViewBag.Title = "Contact Page";
            return View();
        }
    }
}