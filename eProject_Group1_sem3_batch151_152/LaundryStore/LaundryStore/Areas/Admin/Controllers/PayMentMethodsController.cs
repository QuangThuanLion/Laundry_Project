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
    public class PayMentMethodsController : Controller
    {
        private LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();

        // GET: Admin/PayMentMethods
        public ActionResult Index()
        {
            return View(db.PayMentMethods.ToList());
        }

        // GET: Admin/PayMentMethods/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayMentMethod payMentMethod = db.PayMentMethods.Find(id);
            if (payMentMethod == null)
            {
                return HttpNotFound();
            }
            return View(payMentMethod);
        }

        // GET: Admin/PayMentMethods/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/PayMentMethods/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,paymentName")] PayMentMethod payMentMethod)
        {
            if (ModelState.IsValid)
            {
                db.PayMentMethods.Add(payMentMethod);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(payMentMethod);
        }

        // GET: Admin/PayMentMethods/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayMentMethod payMentMethod = db.PayMentMethods.Find(id);
            if (payMentMethod == null)
            {
                return HttpNotFound();
            }
            return View(payMentMethod);
        }

        // POST: Admin/PayMentMethods/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,paymentName")] PayMentMethod payMentMethod)
        {
            if (ModelState.IsValid)
            {
                db.Entry(payMentMethod).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(payMentMethod);
        }

        // GET: Admin/PayMentMethods/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayMentMethod payMentMethod = db.PayMentMethods.Find(id);
            if (payMentMethod == null)
            {
                return HttpNotFound();
            }
            return View(payMentMethod);
        }

        // POST: Admin/PayMentMethods/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PayMentMethod payMentMethod = db.PayMentMethods.Find(id);
            db.PayMentMethods.Remove(payMentMethod);
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
