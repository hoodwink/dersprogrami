using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

namespace dersprogrami
{
    public partial class bolumler : System.Web.UI.Page
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
            int fakId = Convert.ToInt32(cmbx_fakulte.Value);
            int subeSayisi = Convert.ToInt32(txt_subeSayisi.Text);
            SyllabusDbEntities db;
            using (db = new SyllabusDbEntities())
            {
                Bolum bolum = new Bolum();
                bolum.fakulte_ID = fakId;
                bolum.bolum_Kodu = txt_bolumKodu.Text;
                bolum.bolum_Adi = txt_bolumAdi.Text;
                bolum.bolum_Baskani_Kodu = txt_baskanKod.Text;
                bolum.sube_Sayisi = subeSayisi;

                db.AddToBolums(bolum);
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
                var bolumler = db.Bolums.ToList();
                source_bolum.DataSource = bolumler;
                source_bolum.DataBind();

                var fakulteler = db.Fakultes.ToList();
                source_fakulte.DataSource = fakulteler;
                source_fakulte.DataBind();
            }
        }

        [DirectMethod]
        public void commandProcess(string command, string fakulte_ID)
        {
            //int deleteFakulteId = Convert.ToInt32(fakulte_ID);
            //SyllabusDbEntities db;
            //using (db = new SyllabusDbEntities())
            //{
            //    Fakulte hocam = db.Fakultes.FirstOrDefault(f => f.fakulte_ID == deleteFakulteId);
            //    db.DeleteObject(hocam);
            //    db.SaveChanges();
            //}
            //AddStore();
        }

        private void ClearText()
        {
            txt_bolumKodu.Clear();
            txt_bolumAdi.Clear();
            txt_baskanKod.Clear();
        }


    }
}