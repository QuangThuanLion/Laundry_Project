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
    public class ShippingAdressesController : Controller
    {
        private LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();

        // GET: Admin/ShippingAdresses
        public ActionResult Index()
        {
            return View(db.ShippingAdresses.ToList());
        }

        // GET: Admin/ShippingAdresses/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ShippingAdress shippingAdress = db.ShippingAdresses.Find(id);
            if (shippingAdress == null)
            {
                return HttpNotFound();
            }
            return View(shippingAdress);
        }

        // GET: Admin/ShippingAdresses/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/ShippingAdresses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,addressName,price")] ShippingAdress shippingAdress)
        {
            if (ModelState.IsValid)
            {
                db.ShippingAdresses.Add(shippingAdress);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(shippingAdress);
        }

        // GET: Admin/ShippingAdresses/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ShippingAdress shippingAdress = db.ShippingAdresses.Find(id);
            if (shippingAdress == null)
            {
                return HttpNotFound();
            }
            return View(shippingAdress);
        }

        // POST: Admin/ShippingAdresses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,addressName,price")] ShippingAdress shippingAdress)
        {
            if (ModelState.IsValid)
            {
                db.Entry(shippingAdress).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(shippingAdress);
        }

        // GET: Admin/ShippingAdresses/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ShippingAdress shippingAdress = db.ShippingAdresses.Find(id);
            if (shippingAdress == null)
            {
                return HttpNotFound();
            }
            return View(shippingAdress);
        }

        // POST: Admin/ShippingAdresses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ShippingAdress shippingAdress = db.ShippingAdresses.Find(id);
            db.ShippingAdresses.Remove(shippingAdress);
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
