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
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace Gym_Management_System
{
    public partial class AdminUpdateMember : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);

        SqlCommand cmd = null;

        SqlDataAdapter da = null;

        DataTable dt = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null || Session["User"] != "Admin")
            {
                Response.Redirect("LogIn.aspx");
            }

            if(!IsPostBack)
            {
                setData();
            }
        }

        public string encryption(String password)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();

            byte[] encrypt;

            UTF8Encoding encode = new UTF8Encoding();

            encrypt = md5.ComputeHash(encode.GetBytes(password));

            StringBuilder encryptdate = new StringBuilder();

            for (int i = 0; i < encrypt.Length; i++)
            {
                encryptdate.Append(encrypt[i].ToString());
            }

            return encryptdate.ToString();

        }


        public void setData()
        {
            if (Request.QueryString["id"] != null)
            {

                con.Open();

                cmd = new SqlCommand("select * from TblMembers where memberid = @id", con);

                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Request.QueryString["id"]));

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                if (dt.Rows.Count == 1)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        txtName.Text = dr["FirstName"].ToString();
                        txtContact.Text = dr["contactno"].ToString();
                        txtEmail.Text = dr["email"].ToString();

                        if (dr["gender"].ToString() == "Male")
                        {
                            rbtGender.SelectedValue = "Male";
                        }
                        else
                        {
                            rbtGender.SelectedValue = "Female";
                        }

                        //txtHeight.Text = dr["height"].ToString();
                        //txtWeight.Text = dr["weight"].ToString();
                        //txtDob.Text = dr["dob"].ToString();
                        //txtCity.Text = dr["city"].ToString();
                        //txtState.Text = dr["state"].ToString();
                        //txtAddress.Text = dr["address"].ToString();
                        //txtMonth.Text = dr["month"].ToString();
                        //txtOneMonthFee.Text = dr["onemonthfee"].ToString();
                        //txtTotalFee.Text = dr["totalfee"].ToString();
                        //txtReceivedFee.Text = dr["receivedfee"].ToString();
                        //txtPass.Text = dr["password"].ToString();
                        //txtFrom.Text = dr["fromtime"].ToString();
                        //txtDOJ.Text = dr["doj"].ToString();
                        //txtExpireDate.Text = dr["expiredate"].ToString();
                        //txtTo.Text = dr["totime"].ToString();
                    }
                }

                con.Close();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            con.Open();

            if (txtPass.Text == "")
            {
                cmd = new SqlCommand("update TblMembers set name=@name, address=@address, contactno=@contactno, gender=@gender, dob=@dob, email=@email, city=@city, state=@state, height=@height, weight=@weight, month=@month, onemonthfee=@onemonthfee, totalfee=@totalfee, receivedfee=@receivedfee, fromtime=@fromtime, totime=@totime, expiredate=@expiredate where memberid = @id", con);
            }
            else
            {
                cmd = new SqlCommand("update TblMembers set name=@name, address=@address, contactno=@contactno, gender=@gender, dob=@dob, email=@email, city=@city, state=@state, height=@height, weight=@weight,month=@month, onemonthfee=@onemonthfee, totalfee=@totalfee, receivedfee=@receivedfee, password=@password, fromtime=@fromtime, totime=@totime, expiredate=@expiredate where memberid = @id", con);
                cmd.Parameters.AddWithValue("@password",encryption(txtPass.Text));
            }

            //cmd.Parameters.AddWithValue("@name", txtName.Text);
            //cmd.Parameters.AddWithValue("@address", txtAddress.Text);
            //cmd.Parameters.AddWithValue("@contactno", txtContact.Text);
            //cmd.Parameters.AddWithValue("@gender", rbtGender.SelectedItem.ToString());
            //cmd.Parameters.AddWithValue("@dob", Convert.ToDateTime(txtDob.Text));
            //cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            //cmd.Parameters.AddWithValue("@city", txtCity.Text);
            //cmd.Parameters.AddWithValue("@state", txtState.Text);
            //cmd.Parameters.AddWithValue("@height", Convert.ToDecimal(txtHeight.Text));
            //cmd.Parameters.AddWithValue("@weight", Convert.ToDecimal(txtWeight.Text));
            //cmd.Parameters.AddWithValue("@month", Convert.ToInt32(txtMonth.Text));
            //cmd.Parameters.AddWithValue("@onemonthfee", Convert.ToInt32(txtOneMonthFee.Text));
            //cmd.Parameters.AddWithValue("@totalfee", Convert.ToInt32(txtTotalFee.Text));
            //cmd.Parameters.AddWithValue("@receivedfee", Convert.ToInt32(txtReceivedFee.Text));
            //cmd.Parameters.AddWithValue("@fromtime", txtFrom.Text);
            //cmd.Parameters.AddWithValue("@totime", txtTo.Text);
            //cmd.Parameters.AddWithValue("@expiredate", Convert.ToDateTime(txtDOJ.Text).AddMonths(Convert.ToInt32(txtMonth.Text)).ToShortDateString());
            //cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Request.QueryString["id"]));

            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Member Updated Successfully..')</script>");

            Server.Transfer("AdminViewMembers.aspx");

            con.Close();
        }

        protected void txtMonth_TextChanged(object sender, EventArgs e)
        {
            try
            {
            //    txtTotalFee.Text = (Convert.ToInt32(txtMonth.Text) * Convert.ToInt32(txtOneMonthFee.Text)).ToString();
            }
            catch (Exception ex)
            {

            }
        }

        protected void txtOneMonthFee_TextChanged(object sender, EventArgs e)
        {
            try
            {
            //    txtTotalFee.Text = (Convert.ToInt32(txtMonth.Text) * Convert.ToInt32(txtOneMonthFee.Text)).ToString();
           }
            catch (Exception ex)
            {

            }
        }
    }
}