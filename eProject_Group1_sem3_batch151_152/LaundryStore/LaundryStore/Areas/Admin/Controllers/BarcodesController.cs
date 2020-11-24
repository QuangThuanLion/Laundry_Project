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
    public class BarcodesController : Controller
    {
        private LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();

        // GET: Admin/Barcodes
        public ActionResult Index()
        {
            var barcodes = db.Barcodes.Include(b => b.Order);
            return View(barcodes.ToList());
        }

        // GET: Admin/Barcodes/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Barcode barcode = db.Barcodes.Find(id);
            if (barcode == null)
            {
                return HttpNotFound();
            }
            return View(barcode);
        }

        // GET: Admin/Barcodes/Create
        public ActionResult Create()
        {
            ViewBag.orderId = new SelectList(db.Orders, "id", "address");
            return View();
        }

        // POST: Admin/Barcodes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,orderId,codeName,createdDate,createdBy")] Barcode barcode)
        {
            if (ModelState.IsValid)
            {
                db.Barcodes.Add(barcode);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.orderId = new SelectList(db.Orders, "id", "address", barcode.orderId);
            return View(barcode);
        }

        // GET: Admin/Barcodes/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Barcode barcode = db.Barcodes.Find(id);
            if (barcode == null)
            {
                return HttpNotFound();
            }
            ViewBag.orderId = new SelectList(db.Orders, "id", "address", barcode.orderId);
            return View(barcode);
        }

        // POST: Admin/Barcodes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,orderId,codeName,createdDate,createdBy")] Barcode barcode)
        {
            if (ModelState.IsValid)
            {
                db.Entry(barcode).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.orderId = new SelectList(db.Orders, "id", "address", barcode.orderId);
            return View(barcode);
        }

        // GET: Admin/Barcodes/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Barcode barcode = db.Barcodes.Find(id);
            if (barcode == null)
            {
                return HttpNotFound();
            }
            return View(barcode);
        }

        // POST: Admin/Barcodes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Barcode barcode = db.Barcodes.Find(id);
            db.Barcodes.Remove(barcode);
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
