using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;


namespace dersprogrami
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            
            //her sayfanın başında bu kontrolü yapmamız gerekiyor, kişi login olmamış ise login sayfasına yönlendiriyor
            userControl();
            if (!IsPostBack)
            {
                SyllabusDbEntities db;
                using (db = new SyllabusDbEntities())
                {

                    //var fakulteler = db.fakultes.ToList();

                    //foreach (var item in fakulteler)
                    //{
                    //    Response.Write(item.fakulte_name + "<br>");

                    //}

                    //DropDownList1.DataSource = fakulteler;
                    //DropDownList1.DataTextField = "fakulte_name";
                    //DropDownList1.DataValueField = "fakulte_id";
                    //DropDownList1.DataBind();

                    //var bolumler = db.bolums.ToList();
                    //GridView1.DataSource = bolumler;
                    //GridView1.DataBind();

                    var unvanlar = db.Unvans.ToList();
                    source_unvan.DataSource = unvanlar;
                    source_unvan.DataBind();
                }
               

            }

        }

        private void userControl()
        {
            //kisinin login olup olmadığını kontrol ediyor, eğer login olmas
            LoginControl userLoginControl = new LoginControl();
            string userName = (string)Session["dp_user"];
            string sessionId = (string)Session["dp_sessionid"];
            string isLoggedIn = userLoginControl.doControl(userName, sessionId);
            if (isLoggedIn != "1")
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}