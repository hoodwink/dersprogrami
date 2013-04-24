using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using System.Text.RegularExpressions;

namespace dersprogrami
{
    public partial class Login : System.Web.UI.Page
    {
        private LoginControl userLoginControl;

        protected void Page_Load(object sender, EventArgs e)
        {
            userLoginControl = new LoginControl();
            string userName = (string)Session["dp_user"];
            string sessionId = (string)Session["dp_sessionid"];
            string isLoggedIn = userLoginControl.doControl(userName, sessionId);
            if (isLoggedIn == "1")
            {
                Response.Redirect("Default.aspx");
            }

        }

        protected void btnLogin_Click(object sender, DirectEventArgs e)
        {
            string userName = this.txtUserName.Text;
            string password = this.txtPassword.Text;
            Regex aNumericRgx = new Regex("^[a-zA-Z0-9]*$");
            if (aNumericRgx.IsMatch(userName) == true && aNumericRgx.IsMatch(password) == true)
            {
                string loginResponse = userLoginControl.doLogin(userName, password);
                if (loginResponse == "1")
                {
                    Guid sessionId = Guid.NewGuid();
                    Session["dp_user"] = txtUserName.Text;
                    Session["dp_sessionid"] = sessionId.ToString();
                    //db ye session id yi kaydet
                    SyllabusDbEntities db;
                    using (db = new SyllabusDbEntities())
                    {
                        var user =
                                (from kullanici in db.Kullanicis
                                 where kullanici.KULLANICI_ID == userName
                                 select kullanici).FirstOrDefault();
                        user.KULLANICI_OTURUM_ID = sessionId.ToString();
                        db.SaveChanges();
                    }
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    lblResponse.Text = loginResponse;
                }
            }
            else
            {
                lblResponse.Text = "Kullanıcı adı veya parolada özel karakter kullanılamaz";
            }

        }
    }
}