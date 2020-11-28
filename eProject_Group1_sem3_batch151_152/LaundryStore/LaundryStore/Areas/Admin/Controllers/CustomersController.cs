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
    [Authorize(Roles = "ROLE_ADMIN, ROLE_EMPLOYEE")]
    public class CustomersController : Controller
    {
        private LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();

        // GET: Admin/Customers
        public ActionResult Index(string message = null)
        {
            if (message != null)
            {
                Dictionary<string, string> viewData = MessageUtil.getMessage(message);
                ViewData["message"] = viewData["message"];
                ViewData["alert"] = viewData["alert"];
            }
            var customers = db.Customers.Include(c => c.County).Include(c => c.Role).Where(c => c.status==true);
            return View(customers.ToList());
        }

        // GET: Admin/Customers/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // GET: Admin/Customers/Create
        public ActionResult Create()
        {
            ViewBag.idCounty = new SelectList(db.Counties, "id", "name");
            ViewBag.roleId = new SelectList(db.Roles, "id", "name");
            return View();
        }

        // POST: Admin/Customers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,email,password,fullname,phone,gender,dayOfBirth,address,avatar,idCounty,activated,status,createdDate,modifyDate,modifyBy,roleId")] Customer customer,
                                    HttpPostedFileBase avatar)
        {
            if (ModelState.IsValid)
            {
                string path = Server.MapPath("/Assets/Admin/resources/customer");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                if (customer.avatar != null)
                {
                    avatar.SaveAs(path + "/" + avatar.FileName);
                    customer.avatar = "Assets/Admin/resources/customer/" + avatar.FileName;
                }
                else
                {
                    customer.avatar = "Assets/Admin/resources/customer/" + "customerDefault.jpg";
                }

                customer.createdDate = DateTime.Now;
                db.Customers.Add(customer);
                db.SaveChanges();
                return new RedirectResult(url: "/Admin/Customers/Index?message=insert_success");
            }

            ViewBag.idCounty = new SelectList(db.Counties, "id", "name", customer.idCounty);
            ViewBag.roleId = new SelectList(db.Roles, "id", "name", customer.roleId);
            return View(customer);
        }

        // GET: Admin/Customers/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            ViewBag.idCounty = new SelectList(db.Counties, "id", "name", customer.idCounty);
            ViewBag.roleId = new SelectList(db.Roles, "id", "name", customer.roleId);
            return View(customer);
        }

        // POST: Admin/Customers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,email,password,fullname,phone,gender,dayOfBirth,address,avatar,idCounty,activated,status,createdDate,modifyDate,modifyBy,roleId")] Customer customer,
                                HttpPostedFileBase avatar)
        {
            if (ModelState.IsValid)
            {
                string path = Server.MapPath("/Assets/Admin/resources/customer");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                if (customer.avatar != null)
                {
                    avatar.SaveAs(path + "/" + avatar.FileName);
                    customer.avatar = "Assets/Admin/resources/customer/" + avatar.FileName;
                }
                else
                {
                    customer.avatar = "Assets/Admin/resources/customer/" + "customerDefault.jpg";
                }

                customer.modifyDate = DateTime.Now;
                customer.modifyBy = Session["username"].ToString();
                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return new RedirectResult(url: "/Admin/Customers/Index?message=update_success");
            }
            ViewBag.idCounty = new SelectList(db.Counties, "id", "name", customer.idCounty);
            ViewBag.roleId = new SelectList(db.Roles, "id", "name", customer.roleId);
            return View(customer);
        }

        // GET: Admin/Customers/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // POST: Admin/Customers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Customer customer = db.Customers.Find(id);
            customer.status = false;
            db.SaveChanges();
            return new RedirectResult(url: "/Admin/Customers/Index?message=delete_success");
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
