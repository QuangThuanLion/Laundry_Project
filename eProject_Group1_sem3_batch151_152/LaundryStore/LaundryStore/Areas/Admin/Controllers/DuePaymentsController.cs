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
    public class DuePaymentsController : Controller
    {
        private LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();

        // GET: Admin/DuePayments
        public ActionResult Index()
        {
            var duePayments = db.DuePayments.Include(d => d.Customer).Include(d => d.Order);
            return View(duePayments.ToList());
        }

        // GET: Admin/DuePayments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DuePayment duePayment = db.DuePayments.Find(id);
            if (duePayment == null)
            {
                return HttpNotFound();
            }
            return View(duePayment);
        }

        // GET: Admin/DuePayments/Create
        public ActionResult Create()
        {
            ViewBag.customerId = new SelectList(db.Customers, "id", "email");
            ViewBag.orderId = new SelectList(db.Orders, "id", "address");
            return View();
        }

        // POST: Admin/DuePayments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,customerId,orderId,totalDebt,fromDate,toDate,description,status")] DuePayment duePayment)
        {
            if (ModelState.IsValid)
            {
                db.DuePayments.Add(duePayment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.customerId = new SelectList(db.Customers, "id", "email", duePayment.customerId);
            ViewBag.orderId = new SelectList(db.Orders, "id", "address", duePayment.orderId);
            return View(duePayment);
        }

        // GET: Admin/DuePayments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DuePayment duePayment = db.DuePayments.Find(id);
            if (duePayment == null)
            {
                return HttpNotFound();
            }
            ViewBag.customerId = new SelectList(db.Customers, "id", "email", duePayment.customerId);
            ViewBag.orderId = new SelectList(db.Orders, "id", "address", duePayment.orderId);
            return View(duePayment);
        }

        // POST: Admin/DuePayments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,customerId,orderId,totalDebt,fromDate,toDate,description,status")] DuePayment duePayment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(duePayment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.customerId = new SelectList(db.Customers, "id", "email", duePayment.customerId);
            ViewBag.orderId = new SelectList(db.Orders, "id", "address", duePayment.orderId);
            return View(duePayment);
        }

        // GET: Admin/DuePayments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DuePayment duePayment = db.DuePayments.Find(id);
            if (duePayment == null)
            {
                return HttpNotFound();
            }
            return View(duePayment);
        }

        // POST: Admin/DuePayments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DuePayment duePayment = db.DuePayments.Find(id);
            db.DuePayments.Remove(duePayment);
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
