﻿using LaundryStore.Constant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaundryStore.Utils
{
    public class MessageUtil
    {
        public static Dictionary<string, string> getMessage(string message)
        {
            Dictionary<string, string> result = new Dictionary<string, string>();
            if (message.Equals("insert_success"))
            {
                result.Add("message", SystemConstant.INSERT_SUCCESS);
                result.Add("alert", SystemConstant.ALERT_SUCCESS);
            }
            else if (message.Equals("insert_error"))
            {
                result.Add("message", SystemConstant.INSERT_ERROR);
                result.Add("alert", SystemConstant.ALERT_ERROR);
            }
            else if (message.Equals("update_success"))
            {
                result.Add("message", SystemConstant.UPDATE_SUCCESS);
                result.Add("alert", SystemConstant.ALERT_SUCCESS);
            }
            else if (message.Equals("update_error"))
            {
                result.Add("message", SystemConstant.UPDATE_ERROR);
                result.Add("alert", SystemConstant.ALERT_ERROR);
            }
            else if (message.Equals("delete_success"))
            {
                result.Add("message", SystemConstant.DELETE_SUCCESS);
                result.Add("alert", SystemConstant.ALERT_SUCCESS);
            }
            return result;
        }
    }
}