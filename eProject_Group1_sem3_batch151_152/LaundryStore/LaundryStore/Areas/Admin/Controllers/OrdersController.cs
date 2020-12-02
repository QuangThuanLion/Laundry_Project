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
            var orders = db.Orders.Include(o => o.Customer).Include(o => o.PayMentMethod).Include(o => o.ShippingAdress).Include(o => o.Status1).Include(o => o.Employee).Include(o => o.Employee1);
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
            List<OrderDetail> orderDetail = db.OrderDetails.Where(o => o.orderId == id).ToList();
            ViewBag.ListOrderDetail = orderDetail;
            ViewBag.OrderId = order.id;
            return View(order);
        }

        // GET: Admin/Orders/Create
        public ActionResult Create()
        {
            ViewBag.customerId = new SelectList(db.Customers, "id", "fullname");
            ViewBag.paymentMethodId = new SelectList(db.PayMentMethods, "id", "paymentName");
            ViewBag.shippingId = new SelectList(db.ShippingAdresses, "id", "addressName");
            ViewBag.statusId = new SelectList(db.Status, "id", "statusName");
            ViewBag.employeeIdConfirm = new SelectList(db.Employees, "id", "fullname");
            ViewBag.employeeIdShipping = new SelectList(db.Employees, "id", "fullname");
            return View();
        }

        // POST: Admin/Orders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,customerId,orderDate,endDate,address,paymentMethodId,paymentStatus,amount,description,statusId,createdBy,shippingId,employeeIdConfirm,employeeIdShipping,totalDebt,type,status")]
                                    Order order, string package)
        {
            if (ModelState.IsValid)
            {
                order.orderDate = DateTime.Now;
                if (order.paymentStatus == "done")
                {
                    order.endDate = DateTime.Now;
                }
                order.createdBy = Session["username_Employee"].ToString();
                order.employeeIdConfirm = Int32.Parse(Session["id_Employee"].ToString());
                order.status = true;
                order.type = package;
                db.Orders.Add(order);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.customerId = new SelectList(db.Customers, "id", "name", order.customerId);
            ViewBag.paymentMethodId = new SelectList(db.PayMentMethods, "id", "paymentName", order.paymentMethodId);
            ViewBag.shippingId = new SelectList(db.ShippingAdresses, "id", "addressName", order.shippingId);
            ViewBag.statusId = new SelectList(db.Status, "id", "statusName", order.statusId);
            ViewBag.employeeIdConfirm = new SelectList(db.Employees, "id", "email", order.employeeIdConfirm);
            ViewBag.employeeIdShipping = new SelectList(db.Employees, "id", "email", order.employeeIdShipping);
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
            ViewBag.customerId = new SelectList(db.Customers, "id", "fullname", order.customerId);
            ViewBag.paymentMethodId = new SelectList(db.PayMentMethods, "id", "paymentName", order.paymentMethodId);
            ViewBag.shippingId = new SelectList(db.ShippingAdresses, "id", "addressName", order.shippingId);
            ViewBag.statusId = new SelectList(db.Status, "id", "statusName", order.statusId);
            ViewBag.employeeIdConfirm = new SelectList(db.Employees, "id", "fullname", order.employeeIdConfirm);
            ViewBag.employeeIdShipping = new SelectList(db.Employees, "id", "fullname", order.employeeIdShipping);
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
                if (order.paymentStatus == "done")
                {
                    order.endDate = DateTime.Now;
                }
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.customerId = new SelectList(db.Customers, "id", "email", order.customerId);
            ViewBag.paymentMethodId = new SelectList(db.PayMentMethods, "id", "paymentName", order.paymentMethodId);
            ViewBag.shippingId = new SelectList(db.ShippingAdresses, "id", "addressName", order.shippingId);
            ViewBag.statusId = new SelectList(db.Status, "id", "statusName", order.statusId);
            ViewBag.employeeIdConfirm = new SelectList(db.Employees, "id", "email", order.employeeIdConfirm);
            ViewBag.employeeIdShipping = new SelectList(db.Employees, "id", "email", order.employeeIdShipping);
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
