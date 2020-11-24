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
    public class ProductsController : Controller
    {
        private LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();

        // GET: Admin/Products
        public ActionResult Index(string message = null)
        {
            if (message != null)
            {
                Dictionary<string, string> viewData = MessageUtil.getMessage(message);
                ViewData["message"] = viewData["message"];
                ViewData["alert"] = viewData["alert"];
            }
            var products = db.Products.Include(p => p.Category).Where(e => e.status == true);
            return View(products.ToList());
        }

        // GET: Admin/Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Admin/Products/Create
        public ActionResult Create()
        {
            ViewBag.categoryId = new SelectList(db.Categories, "id", "categoryName");
            return View();
        }

        // POST: Admin/Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,productName,categoryId,description,image,viewCount,discount,createdDate,createdBy,modifyDate,modifyBy,pieceType,pricePiece,kgType,priceKg,status")] Product product,
                                    HttpPostedFileBase image, string pieceType, string kgType)
        {
            if (ModelState.IsValid)
            {
                string path = Server.MapPath("/Assets/Admin/resources/product");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                if (product.image != null)
                {
                    image.SaveAs(path + "/" + image.FileName);
                    product.image = "Assets/Admin/resources/product/" + image.FileName;
                }
                else
                {
                    product.image = "Assets/Admin/resources/product/" + "defaultProduct.jpg";
                }
                product.pieceType = pieceType;
                product.kgType = kgType;
                db.Products.Add(product);
                db.SaveChanges();
                return new RedirectResult(url: "/Admin/Products/Index?message=insert_success");
            }

            ViewBag.categoryId = new SelectList(db.Categories, "id", "categoryName", product.categoryId);
            return View(product);
        }

        // GET: Admin/Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.categoryId = new SelectList(db.Categories, "id", "categoryName", product.categoryId);
            return View(product);
        }

        // POST: Admin/Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,productName,categoryId,description,image,viewCount,discount,createdDate,createdBy,modifyDate,modifyBy,pieceType,pricePiece,kgType,priceKg,status")] Product product,
                                  HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
                string path = Server.MapPath("/Assets/Admin/resources/product");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                if (product.image != null)
                {
                    image.SaveAs(path + "/" + image.FileName);
                    product.image = "Assets/Admin/resources/product/" + image.FileName;
                }
                else
                {
                    product.image = "Assets/Admin/resources/product/" + "defaultProduct.jpg";
                }

                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return new RedirectResult(url: "/Admin/Products/Index?message=update_success");
            }
            ViewBag.categoryId = new SelectList(db.Categories, "id", "categoryName", product.categoryId);
            return View(product);
        }

        // GET: Admin/Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Admin/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            product.status = false;
            db.SaveChanges();
            return new RedirectResult(url: "/Admin/Products/Index?message=delete_success");
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
