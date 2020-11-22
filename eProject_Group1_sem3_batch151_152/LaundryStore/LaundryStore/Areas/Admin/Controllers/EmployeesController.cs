using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using LaundryStore.Models;
using LaundryStore.Utils;

namespace LaundryStore.Areas.Admin.Controllers
{
    public class EmployeesController : Controller
    {
        private LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();

        // GET: Admin/Employees
        public ActionResult Index(string message = null)
        {
            string result = Request.QueryString["message"];
            if (message != null)
            {
                Dictionary<string, string> viewData = MessageUtil.getMessage(result);
                ViewData["message"] = viewData["message"];
                ViewData["alert"] = viewData["alert"];
            }
            List<Employee> list = null;
            list = db.Employees.Where(e => e.status == true).ToList();
            return View(list);
        }

        // GET: Admin/Employees/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employees.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            return View(employee);
        }

        // GET: Admin/Employees/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Employees/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,email,password,fullname,phone,gender,dayOfBirth,address,avatar,dateStart,dateEnd,contractSalary,unitSalary,workTime,schedule,createdDate,createdBy,modifyDate,modifyBy,status,activated")] Employee employee,
                                        HttpPostedFileBase avatar, string role)
        {
            if (ModelState.IsValid)
            {
                string path = Server.MapPath("/Assets/Admin/resources/image");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                if (employee.avatar != null)
                {
                    avatar.SaveAs(path + "/" + avatar.FileName);
                    employee.avatar = "Assets/Admin/resources/image/" + avatar.FileName;
                } else
                {
                    employee.avatar = "Assets/Admin/resources/image/" + "userDefault.jpg";
                }

                AccountRole account = new AccountRole();
                account.employeeId = employee.id;
                account.roleId = Convert.ToInt32(role);
                db.AccountRoles.Add(account);
                db.Employees.Add(employee);
                db.SaveChanges();
                return new RedirectResult(url: "/Admin/Employees/Index?message=insert_success");
                //return RedirectToAction("Index");
            }

            return View(employee);
        }

        // GET: Admin/Employees/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employees.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            return View(employee);
        }

        // POST: Admin/Employees/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "id,email,password,fullname,phone,gender,dayOfBirth,address,avatar,dateStart,dateEnd,contractSalary,unitSalary,workTime,schedule,createdDate,createdBy,modifyDate,modifyBy,status,activated")] Employee employee,
                                    HttpPostedFileBase avatar, string role)
        {
            if (ModelState.IsValid)
            {
                string path = Server.MapPath("/Assets/Admin/resources/image");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                if (employee.avatar != null)
                {
                    avatar.SaveAs(path + "/" + avatar.FileName);
                    employee.avatar = "Assets/Admin/resources/image/" + avatar.FileName;
                }
                else
                {
                    employee.avatar = "Assets/Admin/resources/image/" + "userDefault.jpg";
                }

                AccountRole account = new AccountRole();
                account.employeeId = employee.id;
                account.roleId = Convert.ToInt32(role);
                db.AccountRoles.Add(account);
                db.Entry(employee).State = EntityState.Modified;
                db.SaveChanges();
                return new RedirectResult(url: "/Admin/Employees/Index?message=update_success");
            }
            return View(employee);
        }

        // GET: Admin/Employees/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employees.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            return View(employee);
        }

        // POST: Admin/Employees/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Employee employee = db.Employees.Find(id);
            employee.status = false;
            db.SaveChanges();
            return new RedirectResult(url: "/Admin/Employees/Index?message=delete_success");
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
