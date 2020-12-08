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
        public static string EncryptForPassword(string password)
        {
            SHA256 sha = SHA256Managed.Create();
            byte[] data = sha.ComputeHash(Encoding.UTF8.GetBytes(password));
            return BitConverter.ToString(data).Replace("-", "").ToLower();
        }

        /*public static string EncryptForPassword(string password)
        {
            string hash = "f0xle@rn";
            byte[] data = UTF8Encoding.UTF8.GetBytes(password);
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                byte[] keys = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
                using (TripleDESCryptoServiceProvider tripDes = new TripleDESCryptoServiceProvider() { Key = keys, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7})
                {
                    ICryptoTransform transform = tripDes.CreateEncryptor();
                    byte[] result = transform.TransformFinalBlock(data, 0, data.Length);
                    return Convert.ToBase64String(result, 0, result.Length);
                }
            }
        }*/

    }
}