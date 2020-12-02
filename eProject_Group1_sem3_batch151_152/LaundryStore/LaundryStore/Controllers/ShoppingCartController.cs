using LaundryStore.Models;
using LaundryStore.Models.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaundryStore.Controllers
{
    public class ShoppingCartController : Controller
    {
        LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();

        // GET: ShoppingCart
        public ActionResult ShowCart()
        {
            List<CartItem> listCart = getCart();

            double? total = totalMoney();
            ViewBag.total = total;
            ViewBag.listCart = listCart;
            return View(listCart);
        }

        //Tinh tong so tien trong gio hang cach 1
        public double? totalMoney1()
        {
            List<CartItem> listCart = getCart();
            double? total = 0;
            for (int i = 0; i < listCart.Count; i++)
            {
                double? totalDetail = listCart[i].total;
                total += totalDetail;
            }
            return total;
        }

        //Tinh tong so tien trong gio hang cach 2
        public double? totalMoney()
        {
            List<CartItem> listCart = Session["cart"] as List<CartItem>;
            if (listCart == null)
            {
                return 0;
            }
            return listCart.Sum(i => i.total);
        }

        // GET: Checkout
        public ActionResult Checkout()
        {
            ViewBag.Title = "Contact Page";
            return View();
        }

        //GET: shopping cart
        public List<CartItem> getCart()
        {
            List<CartItem> listCart = Session["cart"] as List<CartItem>;
            if (listCart == null)
            {
                listCart = new List<CartItem>();
                Session["cart"] = listCart;
            }
            return listCart;
        }
        
        [HttpPost]
        public JsonResult addToCart(long[] ids)
        {
            //kiem tra idProduct co nam trong csdl hay khong

            if (ids == null)
            {
                return Json(1, JsonRequestBehavior.AllowGet);
            }
            //lay gio hang
            List<CartItem> listCart = getCart();
            for (int i = 0; i < ids.Length; i++)
            {
                CartItem productExist = listCart.Where(p => p.productId == ids[i]).SingleOrDefault();
                //san pham da co trong gio hang
                if (productExist != null)
                {
                    return Json(2, JsonRequestBehavior.AllowGet);
                }
                //san pham khong co trong gio hang --> them san pham vao gio hang
                else
                {
                    CartItem newItem = new CartItem(ids[i]);
                    listCart.Add(newItem);
                }
            }
            return Json(3, JsonRequestBehavior.AllowGet);
        }
    }
}