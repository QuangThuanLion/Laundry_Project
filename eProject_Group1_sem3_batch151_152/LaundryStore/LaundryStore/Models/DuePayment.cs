//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LaundryStore.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DuePayment
    {
        public int id { get; set; }
        public Nullable<long> customerId { get; set; }
        public Nullable<long> orderId { get; set; }
        public Nullable<long> totalDebt { get; set; }
        public Nullable<System.DateTime> fromDate { get; set; }
        public Nullable<System.DateTime> toDate { get; set; }
        public string description { get; set; }
        public string status { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Order Order { get; set; }
    }
}
