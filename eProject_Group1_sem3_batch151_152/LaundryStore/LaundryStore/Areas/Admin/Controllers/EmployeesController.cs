using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using LaundryStore.Common;
using LaundryStore.Models;
using LaundryStore.Utils;

namespace LaundryStore.Areas.Admin.Controllers
{
    [Authorize(Roles = "ROLE_ADMIN")]
    public class EmployeesController : Controller
    {
        private LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities();

        // GET: Admin/Employees
        public ActionResult Index(string message = null)
        {
            if (message != null)
            {
                Dictionary<string, string> viewData = MessageUtil.getMessage(message);
                ViewData["message"] = viewData["message"];
                ViewData["alert"] = viewData["alert"];
            }
            List<Employee> list = null;
            list = db.Employees.Where(e => e.status == true && e.activated == true).ToList();
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
            List<AccountRole> listAccount = db.AccountRoles.Where(x => x.employeeId == employee.id).ToList();
            string[] arrayRole = new string[listAccount.Count];
            for (int i = 0; i < listAccount.Count; i++)
            {
                arrayRole[i] = listAccount[i].Role.name;
            }
            ViewBag.RoleEmployee = arrayRole[0];
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
                var checkEmail = db.Employees.Where(x => x.email.Equals(employee.email)).FirstOrDefault();
                if (checkEmail == null)
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
                    employee.createdDate = DateTime.Now;
                    employee.dateEnd = DateTime.Now.AddYears(1);
                    employee.createdBy = Session["username_Employee"].ToString();
                    employee.status = true;
                    employee.activated = false;

                    db.AccountRoles.Add(account);
                    db.Employees.Add(employee);
                    db.SaveChanges();

                    SendEmail.SendMail("Gửi từ Laundry Store, Xác nhận người dùng ! ", employee.email, " Bạn vừa đăng kí thành công tài khoản tại Laundry Store !" +
                       " Với tên đăng nhập : " + employee.email +
                       " Để kích hoạt tài khoản vừa đăng kí, vui lòng xác nhận tại đường dẫn tại đây: " + "https://localhost:44335/Admin/Employees/ActiveEmail?username=" + employee.email);

                    return new RedirectResult(url: "/Admin/Employees/Index?message=confirm_email");
                } else
                {
                    return new RedirectResult(url: "/Admin/Employees/Index?message=email_exists");
                }                        
            }
            return View(employee);
        }

        // nhận xác nhân email
        public ActionResult ActiveEmail(string username)
        {

            Employee employee = db.Employees.Where(x => x.email.Equals(username)).SingleOrDefault();
            if (employee != null)
            {
                employee.activated = true;
                db.SaveChanges();
                return new RedirectResult(url: "/Admin/Employees/Index?message=insert_success");
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
                employee.modifyDate = DateTime.Now;
                employee.modifyBy = Session["username_Employee"].ToString();
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
