using LaundryStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaundryStore.Areas.Admin.Controllers
{
    [Authorize(Roles = "ROLE_ADMIN")]
    public class StatisticsController : Controller
    {
        private LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();

        // GET: Admin/Statistics

        //theo ngay
        public ActionResult DateStatistics()
        {
            DateTime dateTime = DateTime.Now;
            string dateCustom = dateTime.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture.DateTimeFormat);

            var strItem = dateCustom.ToString();

            IQueryable<Order> listOrder =  from p in db.Orders
                                           where p.orderDate.Value.Date.ToString("yyyy-MM-dd").Equals(strItem)
                                           select p;


            List<Order> listOrder1 = db.Orders.Where(o => o.orderDate == dateTime).ToList();
            //ViewBag.totalOrder = listOrder.Sum(o => o.totalOrder);
            ViewBag.listOrder = listOrder;
            return View();
        }

        //theo tuan
        public ActionResult WeekStatistics()
        {
            List<Order> listOrder = db.Orders.Where(o => o.orderDate.Value.DayOfWeek == DateTime.Now.DayOfWeek).ToList();
            ViewBag.totalOrder = listOrder.Sum(o => o.totalOrder);
            ViewBag.listOrder = listOrder;
            return View();
        }

        //theo thang
        public ActionResult MonthStatistics()
        {
            List<Order> listOrder = db.Orders.Where(o => o.orderDate.Value.Month == DateTime.Now.Month).ToList();
            ViewBag.totalOrder = listOrder.Sum(o => o.totalOrder);
            ViewBag.listOrder = listOrder;
            return View();
        }

        //theo nam
        public ActionResult YearStatistics()
        {
            List<Order> listOrder = db.Orders.Where(o => o.orderDate.Value.Year == DateTime.Now.Year).ToList();
            ViewBag.totalOrder = listOrder.Sum(o => o.totalOrder);
            ViewBag.listOrder = listOrder;
            return View();
        }

    }
}