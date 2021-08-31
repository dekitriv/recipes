using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;

namespace Recipes.Implementation.Helpers
{
    public static class ShaExtension
    {
        public static string ComputeSHA256Hash(this string text)
        {
            using (var sha256 = new SHA256Managed())
            {
                return BitConverter.ToString(sha256.ComputeHash(Encoding.UTF8.GetBytes(text))).Replace("-", "");
            }
        }
    }
}
