using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

namespace dersprogrami
{
    public partial class ogretimElemani : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            userControl();
            if (!IsPostBack)
            {
                AddStore();
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

        private void AddStore()
        {
            SyllabusDbEntities db;
            using (db = new SyllabusDbEntities())
            {
                var unvanlar = db.Unvans.ToList();
                source_unvan.DataSource = unvanlar;
                source_unvan.DataBind();

                var storeHoca = from hoca in db.Hocas
                                join bolum in db.Bolums on hoca.Bolum.bolum_ID equals bolum.bolum_ID
                                join fakulte in db.Fakultes on bolum.Fakulte.fakulte_ID equals fakulte.fakulte_ID
                                select new { hoca.hoca_ID, hoca.sicil_No, hoca.hoca_Adi, bolum.bolum_Adi, fakulte.fakulte_Adi };

                store_Hoca.DataSource = storeHoca;
                store_Hoca.DataBind();
            }
        }


        [DirectMethod]
        public void commandProcess(string command, string hoca_ID)
        {
            int deleteHocaId = Convert.ToInt32(hoca_ID);
            SyllabusDbEntities db;
            using (db = new SyllabusDbEntities())
            {
                Hoca hocam = db.Hocas.FirstOrDefault(h => h.hoca_ID == deleteHocaId);
                db.DeleteObject(hocam);
                db.SaveChanges();

                var storeHoca = from hoca in db.Hocas
                                join bolum in db.Bolums on hoca.Bolum.bolum_ID equals bolum.bolum_ID
                                join fakulte in db.Fakultes on bolum.Fakulte.fakulte_ID equals fakulte.fakulte_ID
                                select new { hoca.hoca_ID, hoca.sicil_No, hoca.hoca_Adi, bolum.bolum_Adi, fakulte.fakulte_Adi };

                store_Hoca.DataSource = storeHoca;
                store_Hoca.DataBind();
            }
             
        }


    }
}