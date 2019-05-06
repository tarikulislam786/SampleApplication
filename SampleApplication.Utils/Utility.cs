using System;
using System.ComponentModel;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;

namespace SampleApplication.Utils
{
    public class Utility
    {

        private static readonly Random random = new Random();
        private static readonly object syncLock = new object();


        public static string ImageToBase64(string imagePath)
        {
            try
            {
                using (Image image = Image.FromFile(imagePath))
                {
                    using (MemoryStream m = new MemoryStream())
                    {
                        image.Save(m, image.RawFormat);
                        byte[] imageBytes = m.ToArray();

                        string base64String = Convert.ToBase64String(imageBytes);
                        return base64String;
                    }
                }
            }
            catch (Exception exception)
            {
                return "";
            }
        }

        public static Image ScaleImage(Image image, int maxWidth, int maxHeight)
        {
            var ratioX = (double)maxWidth / image.Width;
            var ratioY = (double)maxHeight / image.Height;
            var ratio = Math.Min(ratioX, ratioY);

            var newWidth = (int)(image.Width * ratio);
            var newHeight = (int)(image.Height * ratio);

            var newImage = new Bitmap(newWidth, newHeight);

            using (var graphics = Graphics.FromImage(newImage))
                graphics.DrawImage(image, 0, 0, newWidth, newHeight);

            return newImage;
        }

        public static bool Base64ToImage(string base64String, string path)
        {
            try
            {
                //base64String = base64String.Replace("\r\n  ", "");
                int base64StringLength = base64String.Length;
                byte[] imageBytes = Convert.FromBase64String(base64String);
                MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
                ms.Write(imageBytes, 0, imageBytes.Length);
                Image image = Image.FromStream(ms, true);
                image = ScaleImage(image, 200, 400);
                image.Save(path);

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static string GenerateUserVerificationCode()
        {
            return new Random().Next(100000, 999999).ToString();
        }

        public static string GenerateMerchantSecurityKey()
        {
            int length = 9;
            Random random = new Random();
            string characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            string specialCharacters = "!@#$%*_+?:";
            StringBuilder result = new StringBuilder(length);
            for (int i = 0; i < length; i++)
            {
                result.Append(characters[random.Next(characters.Length)]);
            }

            result.Insert(random.Next(9), specialCharacters[random.Next(specialCharacters.Length)]);
            return result.ToString();
        }

        public static string GenerateInstitutionUserSecurityKey()
        {
            int length = 7;
            Random random = new Random();
            string characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            string specialCharacters = "!@#$%*_+?:";
            StringBuilder result = new StringBuilder(length);
            for (int i = 0; i < length; i++)
            {
                result.Append(characters[random.Next(characters.Length)]);
            }

            result.Insert(random.Next(7), specialCharacters[random.Next(specialCharacters.Length)]);
            return result.ToString();
        }

        public static string GenerateMerchantCategoryCode()
        {
            lock (syncLock)
            {
                var randomPINResult = random.Next(0, 9999).ToString();
                return randomPINResult.PadLeft(4, '0');
            }
        }
        public static string GenerateMerchantCode()
        {
            lock (syncLock)
            {
                var randomPINResult = random.Next(0, 9999).ToString();
                return randomPINResult.PadLeft(4, '0');
            }
        }

        public static string GenerateTransactionId(string transactionType, string stan)
        {
            lock (syncLock)
            {
                char padLeft = Convert.ToChar(random.Next(1, 8).ToString());
                return transactionType + stan + random.Next(1, 99999999).ToString().PadLeft(8, padLeft);
            }
        }

        public static string GetRetrievalReferenceNumber(DateTime transactionDateTime, string stan)
        {
            var sbTransactionId = new StringBuilder();
            sbTransactionId.AppendFormat("{0}{1}{2}", transactionDateTime.ToString("yy").Last(), transactionDateTime.DayOfYear, transactionDateTime.ToString("HH"));
            sbTransactionId.Append(stan);
            return sbTransactionId.ToString();
        }

        //public static string GenerateEmailVerificationCode()
        //{
        //    lock (syncLock)
        //    {
        //        var randomPINResult = random.Next(0, 999999).ToString();
        //        return randomPINResult.PadLeft(6, '0');
        //    }
        //}

        //public static string GenerateReferralCode()
        //{
        //    lock (syncLock)
        //    {
        //        var randomPINResult = random.Next(0, 999999).ToString();
        //        return randomPINResult.PadLeft(6, '0');
        //    }
        //}

        //public static string GenerateMobileNumberVerificationCode()
        //{
        //    lock (syncLock)
        //    {
        //        var randomPINResult = random.Next(0, 999999).ToString();
        //        return randomPINResult.PadLeft(6, '0');
        //    }
        //}

        public static string GenerateOTP(int length)
        {
            lock (syncLock)
            {
                string _numbers = "0123456789";
                Random random = new Random();
                StringBuilder builder = new StringBuilder(6);

                for (var i = 0; i < length; i++)
                {
                    builder.Append(_numbers[random.Next(0, _numbers.Length)]);
                }
                return builder.ToString();

                //var randomPINResult = random.Next(0, 9999).ToString();
                //return randomPINResult.PadLeft(4, '0');
            }
        }

        public static string GenerateCardNumber()
        {
            int length = 12;
            Random random = new Random();
            string characters = "0123456789";
            StringBuilder result = new StringBuilder(length);
            for (int i = 0; i < length; i++)
            {
                result.Append(characters[random.Next(characters.Length)]);
            }
            return result.ToString();
        }

        public static DateTime PasswordChangeVerificationCodeExpiryDate()
        {
            return DateTime.UtcNow.AddMinutes(30);
        }

        public static string GenerateDNCPassword()
        {
            return "123456";
        }

        public static string GenerateETHPassword(string account)
        {
            return "123456";
        }
    }
    public static class EnumHelper
    {
        /// <summary>
        /// Retrieve the description on the enum, e.g.
        /// [Description("Bright Pink")]
        /// BrightPink = 2,
        /// Then when you pass in the enum, it will retrieve the description
        /// </summary>
        /// <param name="en">The Enumeration</param>
        /// <returns>A string representing the friendly name</returns>
        public static string GetDescription(Enum en)
        {
            Type type = en.GetType();

            MemberInfo[] memInfo = type.GetMember(en.ToString());

            if (memInfo.Length > 0)
            {
                object[] attrs = memInfo[0].GetCustomAttributes(typeof(DescriptionAttribute), false);

                if (attrs.Length > 0)
                {
                    return ((DescriptionAttribute)attrs[0]).Description;
                }
            }

            return en.ToString();
        }

    }
}
