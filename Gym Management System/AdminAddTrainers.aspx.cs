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
    public partial class AdminAddTrainer : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);

        SqlCommand cmd = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null || Session["User"] != "Admin")
            {
                Response.Redirect("LogIn.aspx");
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


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();

                SqlCommand cmd1 = new SqlCommand("select * from Members where email = @email", con);

                 cmd1.Parameters.AddWithValue("@email", txtEmail.Text);

                SqlDataAdapter da = new SqlDataAdapter(cmd1);

                DataTable dt = new DataTable();

                da.Fill(dt);

                SqlCommand cmd2 = new SqlCommand("select * from Trainers where email = @email", con);

                cmd2.Parameters.AddWithValue("@email", txtEmail.Text);

                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);

                DataTable dt2 = new DataTable();

                da2.Fill(dt2);

                SqlCommand cmd3 = new SqlCommand("select * from TblAdmin where email = @email", con);

                cmd3.Parameters.AddWithValue("@email", txtEmail.Text);

                SqlDataAdapter da3 = new SqlDataAdapter(cmd3);

                DataTable dt3 = new DataTable();

                da3.Fill(dt3);

                if (dt.Rows.Count >= 1 || dt2.Rows.Count >= 1 || dt3.Rows.Count >= 1)
                {
                    Response.Write("<script>alert('Email Address Already Used..')</script>");
                }
                else
                {
                    string Genid = null;

                    string sqlQuery = "SELECT TOP 1 Trainerid from Trainers order by Trainerid desc";
                    SqlCommand cmds = new SqlCommand(sqlQuery, con);
                    SqlDataAdapter das = new SqlDataAdapter(cmds);

                    DataTable dts = new DataTable();

                    da.Fill(dts);

                    if (dt.Rows.Count != 1)
                    {
                        Genid = "YANSTR00001";
                    }
                    else 
                    { 
                        foreach (DataRow dr in dt.Rows)
                        {
                            string input = dr["Trainerid"].ToString();
                            string angka = input.Substring(input.Length - Math.Min(3, input.Length));
                            int number = Convert.ToInt32(angka);
                            number += 1;
                            string str = number.ToString("D3");

                            Genid = "YANSTR" + str;

                        }
                }
                    cmd = new SqlCommand("insert into Trainers (trainerid,title, firstname,othername, lastname, address, contactno, gender, dob, email, city, salary,password,doj) VALUES (@id,@title,@firstname,@othername,@lastname, @address, @contactno, @gender, @dob, @email, @city, @salary, @password, @doj)", con);

                    cmd.Parameters.AddWithValue("@id", Genid);
                    cmd.Parameters.AddWithValue("@title", drpTitle.Text);
                    cmd.Parameters.AddWithValue("@firstname", txtFirstName.Text);
                    cmd.Parameters.AddWithValue("@othername", txtOtherName.Text);
                    cmd.Parameters.AddWithValue("@lastname", txtLastName.Text);
                    cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@contactno", txtContact.Text);
                    cmd.Parameters.AddWithValue("@gender", rbtGender.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@dob", Convert.ToDateTime(txtDob.Text));
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@city", txtCity.Text);
                    cmd.Parameters.AddWithValue("@doj", DateTime.Now.ToShortDateString());
                    cmd.Parameters.AddWithValue("@salary", Convert.ToInt32(txtSalary.Text));
                    cmd.Parameters.AddWithValue("@password",encryption(txtPass.Text));
                    cmd.ExecuteNonQuery();

                   

                    Response.Write("<script>alert('Trainer Inserted Successfully..')</script>");

                    Server.Transfer("AdminViewTrainers.aspx");
                }
            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('Please Enter Right Information..)</script>");
                //Response.Write("<script>alert('ex.Message.ToString()')</script>");
               lblmessage.Text = ex.Message.ToString();
                Visible = true;
            }
            con.Close();
        }

        protected void customValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (drpTitle.Text == "Select Title")
            {
                customValidator1.ErrorMessage = "* Select a Title.";
                args.IsValid = false;
            }

        }
    }
}