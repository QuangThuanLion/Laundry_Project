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
    public class PayRollsEmployeesController : Controller
    {
        private LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();

        // GET: Admin/PayRollsEmployees
        public ActionResult Index()
        {
            var payRollsEmployees = db.PayRollsEmployees.Include(p => p.Employee);
            return View(payRollsEmployees.ToList());
        }

        // GET: Admin/PayRollsEmployees/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayRollsEmployee payRollsEmployee = db.PayRollsEmployees.Find(id);
            if (payRollsEmployee == null)
            {
                return HttpNotFound();
            }
            return View(payRollsEmployee);
        }

        // GET: Admin/PayRollsEmployees/Create
        public ActionResult Create()
        {
            ViewBag.employeeId = new SelectList(db.Employees, "id", "email");
            return View();
        }

        // POST: Admin/PayRollsEmployees/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,month,employeeId,dayOff,dayWork,hourOfDay,salaryToMonth,unitSalary,fromDate,toDate,standardWorkDay,totalWorkDay,baseSalary,mainSalary,subsidySalary,totalOverTime,overtimePay,totalSalary,description")] PayRollsEmployee payRollsEmployee)
        {
            if (ModelState.IsValid)
            {
                db.PayRollsEmployees.Add(payRollsEmployee);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.employeeId = new SelectList(db.Employees, "id", "email", payRollsEmployee.employeeId);
            return View(payRollsEmployee);
        }

        // GET: Admin/PayRollsEmployees/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayRollsEmployee payRollsEmployee = db.PayRollsEmployees.Find(id);
            if (payRollsEmployee == null)
            {
                return HttpNotFound();
            }
            ViewBag.employeeId = new SelectList(db.Employees, "id", "email", payRollsEmployee.employeeId);
            return View(payRollsEmployee);
        }

        // POST: Admin/PayRollsEmployees/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,month,employeeId,dayOff,dayWork,hourOfDay,salaryToMonth,unitSalary,fromDate,toDate,standardWorkDay,totalWorkDay,baseSalary,mainSalary,subsidySalary,totalOverTime,overtimePay,totalSalary,description")] PayRollsEmployee payRollsEmployee)
        {
            if (ModelState.IsValid)
            {
                db.Entry(payRollsEmployee).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.employeeId = new SelectList(db.Employees, "id", "email", payRollsEmployee.employeeId);
            return View(payRollsEmployee);
        }

        // GET: Admin/PayRollsEmployees/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayRollsEmployee payRollsEmployee = db.PayRollsEmployees.Find(id);
            if (payRollsEmployee == null)
            {
                return HttpNotFound();
            }
            return View(payRollsEmployee);
        }

        // POST: Admin/PayRollsEmployees/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PayRollsEmployee payRollsEmployee = db.PayRollsEmployees.Find(id);
            db.PayRollsEmployees.Remove(payRollsEmployee);
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
