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


                }
               

            }

        }
    }
}