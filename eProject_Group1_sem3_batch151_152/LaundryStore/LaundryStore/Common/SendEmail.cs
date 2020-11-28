using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Net.Mail;

namespace LaundryStore.Common
{
    public class SendEmail
    {
        public static void SendMail(MailMessage mail)
        {
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["FromEmail"], ConfigurationManager.AppSettings["PassWord"]);//Tài khoản password người gửi
            try
            {
                client.Send(mail);
            } catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void SendMail(string title, string toEmail, string content)
        {
            // goi email
            MailMessage mail = new MailMessage();
            mail.To.Add(toEmail); // Địa chỉ nhận
            mail.From = new MailAddress(toEmail); // Địa chỉ gửi
            mail.Subject = title;  // tiêu đề gửi
            mail.Body = content;  // Nội dung
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com"; // host gửi của Gmail
            smtp.Port = 587;               //port của Gmail
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["FromEmail"], ConfigurationManager.AppSettings["PassWord"]);//Tài khoản password người gửi
            smtp.EnableSsl = true;//kích hoạt giao tiếp an toàn SSL
            smtp.Send(mail);   //Gửi mail đi
        }
    }
}