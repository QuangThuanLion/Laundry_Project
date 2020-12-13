using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaundryStore.Constant
{
    public class SystemConstant
    {
        public static readonly string INSERT_SUCCESS = "Create Successfully !";
        public static readonly string INSERT_ERROR = "Create Failure !";
        public static readonly string UPDATE_SUCCESS = "Update Successfully !";
        public static readonly string UPDATE_ERROR = "Update Failure !";
        public static readonly string DELETE_SUCCESS = "Delete Sucessfully !";
        public static readonly string ALERT_SUCCESS = "primary ";
        public static readonly string ALERT_ERROR = "danger";
        public static readonly string ALERT_WARNING = "warning";
        public static readonly string INVALID_USERNAME = "Account does't exist. Please check again !";
        public static readonly string INVALID_PASSWORD = "Incorrect password. Please check again !";
        public static readonly string EMAIL_CONFIRM = "Verification code just sent to your inbox, please check it now !";
        public static readonly string EMAIL_EXISTS = "Email already exists !, please enter another email";

        //Client
        public static readonly string AUTHEN_EMAIL = "Tài khoản của bạn chưa xác thực, vui lòng kiểm tra email !";
        public static readonly string LOGIN_SUCCESS = "Đăng nhập thành công !";
        public static readonly string COMMENT_CUSTOMER = "Cảm ơn góp ý của bạn !";
        public static readonly string CONTACT_SUCCESS = "Liên hệ thành công !";
    }
}