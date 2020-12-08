﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class LAUNDRY_PROJECTEntities : DbContext
    {
        public LAUNDRY_PROJECTEntities()
            : base("name=LAUNDRY_PROJECTEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AccountRole> AccountRoles { get; set; }
        public virtual DbSet<Barcode> Barcodes { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Comment> Comments { get; set; }
        public virtual DbSet<County> Counties { get; set; }
        public virtual DbSet<DuePayment> DuePayments { get; set; }
        public virtual DbSet<Material> Materials { get; set; }
        public virtual DbSet<News> News { get; set; }
        public virtual DbSet<PayMentMethod> PayMentMethods { get; set; }
        public virtual DbSet<PayRollsEmployee> PayRollsEmployees { get; set; }
        public virtual DbSet<PayRollsWorker> PayRollsWorkers { get; set; }
        public virtual DbSet<PostCategory> PostCategories { get; set; }
        public virtual DbSet<Provider> Providers { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<ShippingAdress> ShippingAdresses { get; set; }
        public virtual DbSet<Status> Status { get; set; }
        public virtual DbSet<Worker> Workers { get; set; }
        public virtual DbSet<Work> Works { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
    }
}
