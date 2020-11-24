using LaundryStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace LaundryStore.Common
{
    public class ManagementProvider : RoleProvider
    {
        public override string ApplicationName { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public override string[] GetRolesForUser(string username)
        {
            using (LAUNDRY_PROJECTEntities db = new LAUNDRY_PROJECTEntities())
            {
                var user = db.Employees.Where(x => x.email.ToString().Equals(username)).SingleOrDefault();
                if (user != null)
                {
                    List<AccountRole> listAccount = db.AccountRoles.Where(a => a.employeeId == user.id).ToList();
                    string[] arrayRole = new string[listAccount.Count];
                    for (int i = 0; i < listAccount.Count; i++)
                    {
                        arrayRole[i] = listAccount[i].Role.name;
                    }
                    return arrayRole;
                }
                else
                {
                    return new string[] { };
                }
            }
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            throw new NotImplementedException();
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}