using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

namespace dersprogrami
{
    public partial class fakulteler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            userControl();
            if (!IsPostBack)
            {
                AddStore();
            }
        }

        protected void btn_Save_Click(object sender, DirectEventArgs e)
        {
            int dekanKod = Convert.ToInt32(txt_dekanKod.Text);
            int dekanYardKod = 123;
            int dekanYard2Kod = 123;
            SyllabusDbEntities db;
            using (db = new SyllabusDbEntities())
            {
                Fakulte fakulte = new Fakulte();
                fakulte.fakulte_Kodu = txt_kod.Text;
                fakulte.fakulte_Adi = txt_fakulteAdi.Text;
                fakulte.fakulte_Kisa_Adi = txt_kisaAdi.Text;
                fakulte.fakulte_Dekani_ID = dekanKod;
                fakulte.fakulte_Dekan_Yard_ID = dekanYardKod;
                fakulte.fakulte_Dekan_Yard2_ID = dekanYard2Kod;

                db.AddToFakultes(fakulte);
                db.SaveChanges();
            }
            AddStore();
            ClearText();
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
                var fakulteler = db.Fakultes.ToList();
                source_fakulte.DataSource = fakulteler;
                source_fakulte.DataBind();
            }
        }

        [DirectMethod]
        public void commandProcess(string command, string fakulte_ID)
        {
            int deleteFakulteId = Convert.ToInt32(fakulte_ID);
            SyllabusDbEntities db;
            using (db = new SyllabusDbEntities())
            {
                Fakulte hocam = db.Fakultes.FirstOrDefault(f => f.fakulte_ID == deleteFakulteId);
                db.DeleteObject(hocam);
                db.SaveChanges();
            }
            AddStore();
        }

        private void ClearText()
        {
            txt_fakulteAdi.Clear();
            txt_kisaAdi.Clear();
            txt_kod.Clear();
            txt_dekanKod.Clear();
        }
    }
}
