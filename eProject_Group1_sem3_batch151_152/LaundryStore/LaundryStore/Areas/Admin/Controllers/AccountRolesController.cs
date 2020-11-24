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
    [Authorize(Roles = "ROLE_ADMIN")]
    public class AccountRolesController : Controller
    {
        private LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();

        // GET: Admin/AccountRoles
        public ActionResult Index()
        {
            var accountRoles = db.AccountRoles.Include(a => a.Employee).Include(a => a.Role);
            return View(accountRoles.ToList());
        }

        // GET: Admin/AccountRoles/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AccountRole accountRole = db.AccountRoles.Find(id);
            if (accountRole == null)
            {
                return HttpNotFound();
            }
            return View(accountRole);
        }

        // GET: Admin/AccountRoles/Create
        public ActionResult Create()
        {
            ViewBag.employeeId = new SelectList(db.Employees, "id", "email");
            ViewBag.roleId = new SelectList(db.Roles, "id", "name");
            return View();
        }

        // POST: Admin/AccountRoles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,employeeId,roleId")] AccountRole accountRole)
        {
            if (ModelState.IsValid)
            {
                db.AccountRoles.Add(accountRole);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.employeeId = new SelectList(db.Employees, "id", "email", accountRole.employeeId);
            ViewBag.roleId = new SelectList(db.Roles, "id", "name", accountRole.roleId);
            return View(accountRole);
        }

        // GET: Admin/AccountRoles/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AccountRole accountRole = db.AccountRoles.Find(id);
            if (accountRole == null)
            {
                return HttpNotFound();
            }
            ViewBag.employeeId = new SelectList(db.Employees, "id", "email", accountRole.employeeId);
            ViewBag.roleId = new SelectList(db.Roles, "id", "name", accountRole.roleId);
            return View(accountRole);
        }

        // POST: Admin/AccountRoles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,employeeId,roleId")] AccountRole accountRole)
        {
            if (ModelState.IsValid)
            {
                db.Entry(accountRole).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.employeeId = new SelectList(db.Employees, "id", "email", accountRole.employeeId);
            ViewBag.roleId = new SelectList(db.Roles, "id", "name", accountRole.roleId);
            return View(accountRole);
        }

        // GET: Admin/AccountRoles/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AccountRole accountRole = db.AccountRoles.Find(id);
            if (accountRole == null)
            {
                return HttpNotFound();
            }
            return View(accountRole);
        }

        // POST: Admin/AccountRoles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            AccountRole accountRole = db.AccountRoles.Find(id);
            db.AccountRoles.Remove(accountRole);
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
