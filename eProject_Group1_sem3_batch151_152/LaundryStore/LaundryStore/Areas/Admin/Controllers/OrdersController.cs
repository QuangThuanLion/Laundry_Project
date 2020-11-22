using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using LaundryStore.Models;

namespace LaundryStore.Areas.Admin.Controllers
{
    public class OrdersController : Controller
    {
        private LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();

        // GET: Admin/Orders
        public ActionResult Index()
        {
            var orders = db.Orders.Include(o => o.Customer).Include(o => o.PayMentMethod).Include(o => o.ShippingAdress).Include(o => o.Status1);
            return View(orders.ToList());
        }

        // GET: Admin/Orders/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // GET: Admin/Orders/Create
        public ActionResult Create()
        {
            ViewBag.customerId = new SelectList(db.Customers, "id", "email");
            ViewBag.paymentMethodId = new SelectList(db.PayMentMethods, "id", "paymentName");
            ViewBag.shippingId = new SelectList(db.ShippingAdresses, "id", "addressName");
            ViewBag.statusId = new SelectList(db.Status, "id", "statusName");
            return View();
        }

        // POST: Admin/Orders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,customerId,orderDate,endDate,address,paymentMethodId,paymentStatus,amount,description,statusId,createdBy,shippingId,employeeIdConfirm,employeeIdShipping,totalDebt,type,status")] Order order)
        {
            if (ModelState.IsValid)
            {
                db.Orders.Add(order);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.customerId = new SelectList(db.Customers, "id", "email", order.customerId);
            ViewBag.paymentMethodId = new SelectList(db.PayMentMethods, "id", "paymentName", order.paymentMethodId);
            ViewBag.shippingId = new SelectList(db.ShippingAdresses, "id", "addressName", order.shippingId);
            ViewBag.statusId = new SelectList(db.Status, "id", "statusName", order.statusId);
            return View(order);
        }

        // GET: Admin/Orders/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            ViewBag.customerId = new SelectList(db.Customers, "id", "email", order.customerId);
            ViewBag.paymentMethodId = new SelectList(db.PayMentMethods, "id", "paymentName", order.paymentMethodId);
            ViewBag.shippingId = new SelectList(db.ShippingAdresses, "id", "addressName", order.shippingId);
            ViewBag.statusId = new SelectList(db.Status, "id", "statusName", order.statusId);
            return View(order);
        }

        // POST: Admin/Orders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,customerId,orderDate,endDate,address,paymentMethodId,paymentStatus,amount,description,statusId,createdBy,shippingId,employeeIdConfirm,employeeIdShipping,totalDebt,type,status")] Order order)
        {
            if (ModelState.IsValid)
            {
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.customerId = new SelectList(db.Customers, "id", "email", order.customerId);
            ViewBag.paymentMethodId = new SelectList(db.PayMentMethods, "id", "paymentName", order.paymentMethodId);
            ViewBag.shippingId = new SelectList(db.ShippingAdresses, "id", "addressName", order.shippingId);
            ViewBag.statusId = new SelectList(db.Status, "id", "statusName", order.statusId);
            return View(order);
        }

        // GET: Admin/Orders/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // POST: Admin/Orders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Order order = db.Orders.Find(id);
            db.Orders.Remove(order);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
