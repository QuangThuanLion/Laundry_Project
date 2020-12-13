using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace LaundryStore.Utils
{
    public class EncryptPassword
    {
        /**
         * ma hoa mat khau
         */
        /*public static string EncryptForPassword(string password)
        {
            SHA256 sha = SHA256Managed.Create();
            byte[] data = sha.ComputeHash(Encoding.UTF8.GetBytes(password));
            return BitConverter.ToString(data).Replace("-", "").ToLower();
        }*/

        /*public static string DecryptPassword(string password)
        {
            UTF8Encoding encoder = new UTF8Encoding();
            SHA256Managed sha = new SHA256Managed();
            byte[] rs = sha.ComputeHash(encoder.GetBytes(password));
            return Convert.ToBase64String(rs);
        }*/

        public static string DecryptPassword(string password)
        {
            string hash = "nguyenkhacquangthuan123456789@gmail.com";
            byte[] data = Convert.FromBase64String(password); // decrypt the incrypted text
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                byte[] keys = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
                using (TripleDESCryptoServiceProvider tripDes = new TripleDESCryptoServiceProvider() { Key = keys, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7 })
                {
                    ICryptoTransform transform = tripDes.CreateDecryptor();
                    byte[] results = transform.TransformFinalBlock(data, 0, data.Length);
                    return UTF8Encoding.UTF8.GetString(results);
                }
            }
        }

        public static string EncryptForPassword(string password)
        {
            string hash = "nguyenkhacquangthuan123456789@gmail.com";
            byte[] data = UTF8Encoding.UTF8.GetBytes(password);
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                byte[] keys = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
                using (TripleDESCryptoServiceProvider tripDes = new TripleDESCryptoServiceProvider() { Key = keys, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7 })
                {
                    ICryptoTransform transform = tripDes.CreateEncryptor();
                    byte[] results = transform.TransformFinalBlock(data, 0, data.Length);
                    return Convert.ToBase64String(results, 0, results.Length);
                }
            }
        }

    }
}