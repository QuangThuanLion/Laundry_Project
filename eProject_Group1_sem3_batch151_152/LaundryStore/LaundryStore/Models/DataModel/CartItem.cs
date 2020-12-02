using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaundryStore.Models.DataModel
{
    public class CartItem
    {
        public string image { get; set; }
        public long productId { get; set; }
        public string productName { get; set; }
        public string description { get; set; }
        public int quantity { get; set; }
        public int? price { get; set; }
        public double? total { get; set; }
        public double? discount { get; set; }
        public string type { get; set; }

        public CartItem (long productId)
        {
            using (LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities())
            {
                this.productId = productId;
                Product product = db.Products.Single(p => p.id == productId);
                this.image = product.image;
                this.productName = product.productName;
                this.description = product.description;
                this.quantity = 1;
                this.price = product.price;
                this.discount = product.discount;
                this.type = product.type;
                int? amount = price * quantity;
                this.total = amount * (100 - discount) / 100;
            }
        }
    }
}