using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration.Install;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Gym_Management_System
{
    public partial class AdminViewMembers : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);

        SqlCommand cmd = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null || Session["User"] != "Admin")
            {
                Response.Redirect("LogIn.aspx");
            }

            getUser("select * from ViewMembers");

           //if (Request.QueryString["type"] == "remaining")
           //{
           //    getUser("select *,CONVERT(VARCHAR(10), dob, 105) as d,(totalfee - receivedfee) as remainingfee from TblMembers where (totalfee - receivedfee) != 0");
           //}
           //else if(Request.QueryString["type"] == "expired")
           //{
           //    getUser("select *,CONVERT(VARCHAR(10), dob, 105) as d,(totalfee - receivedfee) as remainingfee from TblMembers where DATEDIFF(day,CONVERT(date, CONVERT(VARCHAR(10), getdate(), 103), 103),CONVERT(date, expiredate, 103)) <= 0");
           //}
           //else
           //{
           //    getUser("select *,CONVERT(VARCHAR(10), dob, 105) as d,(totalfee - receivedfee) as remainingfee from TblMembers");
           //}


          
        }

        public void getUser(string query)
        {
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            RepeatersDB.DataSource = dt;

            RepeatersDB.DataBind();

            con.Close();
        }
    }
}