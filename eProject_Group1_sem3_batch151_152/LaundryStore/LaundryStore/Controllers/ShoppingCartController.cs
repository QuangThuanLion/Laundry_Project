using LaundryStore.Models;
using LaundryStore.Models.DataModel;
using LaundryStore.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

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

        //tinh tong so luong trong gio hang
        public int totalQuantity()
        {
            List<CartItem> listCart = Session["cart"] as List<CartItem>;
            if(listCart == null)
            {
                return 0;
            }
            return listCart.Sum(i => i.quantity);
        }

        //POST: Login from checkout form
        [HttpPost]
        public ActionResult LoginToCheckOut(string email, string password)
        {
            if (email != null && password != null)
            {
                using (LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities())
                {
                    var account = db.Customers.Where(x => x.email.Equals(email)).SingleOrDefault();
                    if (account != null)
                    {
                        if (account.activated == true)
                        {
                            var passwordCheck = account.password.Equals(EncryptPassword.EncryptForPassword(password));
                            if (passwordCheck)
                            {
                                Session["username_Customer"] = account.fullname;
                                Session["email_Customer"] = account.email;
                                Session["password_Customer"] = account.password;
                                Session["id_Customer"] = account.id;
                                Session["image_Customer"] = account.avatar;
                                FormsAuthentication.SetAuthCookie(email, false);
                                return new RedirectResult(url: "/ShoppingCart/Checkout?message=login_sucess");
                            }
                            else
                            {
                                return new RedirectResult(url: "/ShoppingCart/Checkout?message=invalid_password");
                            }
                        }
                        else
                        {
                            return new RedirectResult(url: "/ShoppingCart/Checkout?message=authentication_email");
                        }

                    }
                    else
                    {
                        return new RedirectResult(url: "/ShoppingCart/Checkout?message=invalid_email");
                    }
                }
            }
            return new RedirectResult(url: "/ShoppingCart/Checkout");
        }


        // GET: Checkout
        [HttpGet]
        public ActionResult Checkout(string message = null)
        {
            //check dieu kien de tra ve thong bao
            if (message != null)
            {
                Dictionary<string, string> viewData = MessageUtil.getMessage(message);
                ViewData["message"] = viewData["message"];
                ViewData["alert"] = viewData["alert"];
            }
            //khach hang khong dang nhap
            List<CartItem> listCart = getCart();
            if (Session["id_Customer"] != null)
            {
                var customerId = int.Parse(Session["id_Customer"].ToString());
                Customer customer = db.Customers.Find(customerId);
                if (customer != null)
                {
                    ViewBag.customerName = customer.fullname != null ? customer.fullname : "";
                    ViewBag.emailCustomer = customer.email != null ? customer.email : "";
                    ViewBag.phoneCustomer = customer.phone != null ? customer.phone : null;
                    ViewBag.countyCustomer = customer.County.name != null ? customer.County.name : "";
                    ViewBag.addressCustomer = customer.address != null ? customer.address : "";
                }
            }           
            
            ViewBag.listCart = listCart;
            double? total = totalMoney();
            ViewBag.total = total;
            return View(listCart);
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
        
        /**
         * them san pham vao trong don hang
         */
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

        /**
         * cap nhat so luong cho don hang
         */
        [HttpPost]
        public JsonResult updateQuantity(long idProduct, int newQuantity)
        {
            List<CartItem> listCart = getCart();
            CartItem cartItem = listCart.Where(c => c.productId == idProduct).SingleOrDefault();
            object[] changeCart = new object[1];
            if(cartItem != null)
            {
                cartItem.quantity = newQuantity;
                int? amount = cartItem.price * newQuantity;
                cartItem.total = amount * (100 - cartItem.discount) / 100;
                double? total = totalMoney();
                changeCart[0] = total;
            }
            return Json(changeCart, JsonRequestBehavior.AllowGet);
        }

        /**
         * xoa san pham trong gio hang
         */
        [HttpPost]
        public JsonResult removeItemInCart(long productId)
        {
            Product product = db.Products.SingleOrDefault(p => p.id == productId);
            if(product == null)
            {
                return Json(1, JsonRequestBehavior.AllowGet);
            } else
            {
                List<CartItem> listCart = getCart();
                CartItem cartItem = listCart.Where(c => c.productId == productId).SingleOrDefault();
                if (cartItem == null)
                {
                    return Json(1, JsonRequestBehavior.AllowGet);
                } else {
                    object[] remoteItem = new object[2];
                    listCart.Remove(cartItem);
                    double? total = totalMoney();
                    remoteItem[0] = "successRemove";
                    remoteItem[1] = total;
                    return Json(remoteItem, JsonRequestBehavior.AllowGet);
                }
            }
        }

        /**
         * tien hanh mua hang
         */
        [HttpPost]
        public JsonResult purchase(string fullName, string email, int phone, string county, string address, string description)
        {
            //khach hang khong dang nhap
            Customer customer = new Customer();
            if (Session["id_Customer"] == null)
            {
                customer.email = email;
                customer.password = EncryptPassword.EncryptForPassword(phone.ToString());
                customer.fullname = fullName;
                customer.phone = phone;
                customer.address = address;
                customer.avatar = "Assets/Admin/resources/image/" + "customerDefault.jpg";
                customer.idCounty = Int32.Parse(county);
                customer.activated = false;
                customer.status = true;
                customer.createdDate = DateTime.Now;
                customer.roleId = 3;

                db.Customers.Add(customer);
                db.SaveChanges();

            } else
            {
                var customerId = int.Parse(Session["id_Customer"].ToString());
                customer = db.Customers.Find(customerId);
                if(customer != null)
                {
                    customer.email = email;
                    customer.fullname = fullName;
                    customer.phone = phone;
                    customer.address = address;
                    customer.idCounty = Int32.Parse(county);
                    customer.modifyDate = DateTime.Now;
                    customer.modifyBy = Session["username_Customer"].ToString();
                    db.SaveChanges();
                }
            }

            //them don hang vao trong order
            Order order = new Order();
            order.customerId = customer.id;
            order.orderDate = DateTime.Now;
            order.address = address;
            order.paymentMethodId = 1;
            order.paymentStatus = "doing";
            order.amount = totalQuantity();
            order.description = description;
            order.statusId = 2;
            order.createdBy = customer.fullname;
            order.shippingId = 1;
            order.totalDebt = 0;
            order.status = true;
            double? total = totalMoney();
            order.totalOrder = Convert.ToInt64(total);
            db.Orders.Add(order);
            db.SaveChanges();

            //them don hang vao chi tiet don hang
            List<CartItem> listCart = getCart();
            foreach (CartItem item in listCart)
            {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.orderId = order.id;
                orderDetail.productId = Convert.ToInt32(item.productId);
                orderDetail.discount = item.discount;
                orderDetail.price = item.price;
                orderDetail.type = item.type;
                orderDetail.status = true;
                orderDetail.totalPrice = Convert.ToInt64(item.total);
                db.OrderDetails.Add(orderDetail);
                db.SaveChanges();
            }
            Session["cart"] = null;
            return Json(1, JsonRequestBehavior.AllowGet);
        }

        /**
         * xoa toan bo san pham trong gio hang
         */
        [HttpPost]
        public JsonResult clearItemInCart()
        {
            List<CartItem> listCart = getCart();
            if (listCart == null)
            {
                return Json(1, JsonRequestBehavior.AllowGet);
            } else
            {
                listCart.Clear();
                return Json(2, JsonRequestBehavior.AllowGet);
            }
        }

    }
}