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
    public class PayRollsWorkersController : Controller
    {
        private LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();

        // GET: Admin/PayRollsWorkers
        public ActionResult Index()
        {
            var payRollsWorkers = db.PayRollsWorkers.Include(p => p.Worker);
            return View(payRollsWorkers.ToList());
        }

        // GET: Admin/PayRollsWorkers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayRollsWorker payRollsWorker = db.PayRollsWorkers.Find(id);
            if (payRollsWorker == null)
            {
                return HttpNotFound();
            }
            return View(payRollsWorker);
        }

        // GET: Admin/PayRollsWorkers/Create
        public ActionResult Create()
        {
            ViewBag.workerId = new SelectList(db.Workers, "id", "workerName");
            return View();
        }

        // POST: Admin/PayRollsWorkers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,month,workerId,dayOff,dayWork,hourOfDay,salaryToMonth,unitSalary,fromDate,toDate,standardWorkDay,totalWorkDay,baseSalary,mainSalary,subsidySalary,totalOverTime,overtimePay,totalSalary,description")] PayRollsWorker payRollsWorker)
        {
            if (ModelState.IsValid)
            {
                db.PayRollsWorkers.Add(payRollsWorker);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.workerId = new SelectList(db.Workers, "id", "workerName", payRollsWorker.workerId);
            return View(payRollsWorker);
        }

        // GET: Admin/PayRollsWorkers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayRollsWorker payRollsWorker = db.PayRollsWorkers.Find(id);
            if (payRollsWorker == null)
            {
                return HttpNotFound();
            }
            ViewBag.workerId = new SelectList(db.Workers, "id", "workerName", payRollsWorker.workerId);
            return View(payRollsWorker);
        }

        // POST: Admin/PayRollsWorkers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,month,workerId,dayOff,dayWork,hourOfDay,salaryToMonth,unitSalary,fromDate,toDate,standardWorkDay,totalWorkDay,baseSalary,mainSalary,subsidySalary,totalOverTime,overtimePay,totalSalary,description")] PayRollsWorker payRollsWorker)
        {
            if (ModelState.IsValid)
            {
                db.Entry(payRollsWorker).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.workerId = new SelectList(db.Workers, "id", "workerName", payRollsWorker.workerId);
            return View(payRollsWorker);
        }

        // GET: Admin/PayRollsWorkers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayRollsWorker payRollsWorker = db.PayRollsWorkers.Find(id);
            if (payRollsWorker == null)
            {
                return HttpNotFound();
            }
            return View(payRollsWorker);
        }

        // POST: Admin/PayRollsWorkers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PayRollsWorker payRollsWorker = db.PayRollsWorkers.Find(id);
            db.PayRollsWorkers.Remove(payRollsWorker);
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
