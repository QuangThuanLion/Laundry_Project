using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaundryStore.Utils
{
    public class RandomBarCodes
    {
        public static string RandomBarCode()
        {
            string strString = "THUAN0123NGUYEN456APTECH789";
            Random random = new Random();
            int randomCharIndex = 0;
            char randomChar;
            string result = "";
            for (int i = 0; i < 20; i++)
            {
                randomCharIndex = random.Next(0, strString.Length);
                randomChar = strString[randomCharIndex];
                result += Convert.ToString(randomChar);
            }
            return result.ToString();
        }
    }
}