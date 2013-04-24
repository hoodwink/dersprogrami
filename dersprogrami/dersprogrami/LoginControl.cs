using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
namespace dersprogrami
{
    public class LoginControl
    {
        public LoginControl()
        {
        }

        public string doLogin(string userName, string password)
        {
            try
            {
                SyllabusDbEntities db;
                using (db = new SyllabusDbEntities())
                {
                    var user =
                        (from kullanici in db.Kullanicis
                         where kullanici.KULLANICI_ID == userName
                         select kullanici).FirstOrDefault();
                    if (user != null)
                    {
                        if (user.KULLANICI_PAROLA == convertToMD5(password))
                        {
                            return "1";
                        }
                        else
                        {
                            return "Parola hatalı";
                        }
                    }
                    else
                    {
                        return "Kullanıcı adı hatalı";
                    }

                }
            }
            catch (Exception e)
            {
                //log errors
                return "Sistemde bir hata oluştu";
            }
        }
        public string doControl(string userName, string sessionId)
        {
            try
            {
                if (userName != null || sessionId != null)
                {
                    SyllabusDbEntities db;
                    using (db = new SyllabusDbEntities())
                    {
                        var user =
                            (from kullanici in db.Kullanicis
                             where kullanici.KULLANICI_ID == userName
                             select kullanici).FirstOrDefault();
                        if (user != null)
                        {
                            if (user.KULLANICI_OTURUM_ID == sessionId)
                            {
                                return "1";
                            }
                            else
                            {
                                return "Oturumunuz geçerli değil, lütfen giriş yapın";
                            }
                        }
                        else
                        {
                            return "Oturum bilgileriniz hatalı, lütfen giriş yapın";
                        }

                    }
                }
                else
                {
                    //session not found
                    return "Kayıtlı oturum bulunamadı, lütfen giriş yapın";
                }
            }
            catch (Exception e)
            {
                //log errors
                return "Sistemde bir hata oluştu";
            }
        }

        private string convertToMD5(string text)
        {
            try { 
            // MD5CryptoServiceProvider nesnenin yeni bir instance'sını oluşturalım.
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();

            //Girilen veriyi bir byte dizisine dönüştürelim ve hash hesaplamasını yapalım.
            byte[] btr = Encoding.UTF8.GetBytes(text);
            btr = md5.ComputeHash(btr);

            //byte'ları biriktirmek için yeni bir StringBuilder ve string oluşturalım.
            StringBuilder sb = new StringBuilder();


            //hash yapılmış her bir byte'ı dizi içinden alalım ve her birini hexadecimal string olarak formatlayalım.
            foreach (byte ba in btr)
            {
                sb.Append(ba.ToString("x2").ToLower());
            }

            //hexadecimal(onaltılık) stringi geri döndürelim.
            return sb.ToString();
            }
            catch (Exception e) 
            {
                throw e;
            }
        }
    }
}