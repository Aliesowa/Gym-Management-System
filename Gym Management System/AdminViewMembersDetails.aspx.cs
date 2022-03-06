using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gym_Management_System
{
    public partial class AdminViewMembersDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);

        SqlCommand cmd = null;

        SqlDataAdapter da = null;

        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null || Session["User"].ToString() != "Admin")
            {
                Response.Redirect("LogIn.aspx");
            }

            if (!IsPostBack)
            {
                try
                {
                    loadData();
                }
                catch(Exception ex) 
                {

                    Response.Write(ex.Message.ToString());

                }

            }
        }

        public void loadData()
        {

            if (Request.QueryString["id"] != null)
            {

                con.Open();

                cmd = new SqlCommand("select * from Members where Memberid = @id", con);



                cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();


                da.Fill(dt);

                if (dt.Rows.Count == 1)
                {
                    foreach (DataRow dr in dt.Rows)
                    {

                        txtFirstName.Text = dr["FirstName"].ToString();
                        txtTitle.Text = dr["title"].ToString();
                        txtotherName.Text = dr["OtherName"].ToString();
                        txtLastName.Text = dr["LastName"].ToString();
                        txtGender.Text = dr["Gender"].ToString();
                        ID.Text = dr["Memberid"].ToString();
                        ApplicationPic.ImageUrl = dr["PassportPic"].ToString();

                        txtOccupation.Text = dr["Occupation"].ToString();
                        txtMobile.Text = dr["contactno"].ToString();
                        txtMobile2.Text = dr["contactno2"].ToString();
                        txtEmergencyName.Text = dr["EmergencyName"].ToString();
                        txtEmergencyNumber.Text = dr["EmergencyContact"].ToString();
                        txtDoctorName.Text = dr["DoctorName"].ToString();
                        txtDoctorContact.Text = dr["DoctorContact"].ToString();
                        txtCompany.Text = dr["Company"].ToString();
                        txtAddress.Text = dr["Address"].ToString();
                        txtCity.Text = dr["city"].ToString();
           
                        txtDOB.Text = Convert.ToDateTime(dr["Dob"]).ToString("yyyy-MM-dd");

                        txtEmail.Text = dr["email"].ToString();
                        lstInjury.Items.Add(dr["Injury"].ToString());
                        txtPregnant.Text = dr["Pregnant"].ToString();
                        txtPregnantWeeks.Text = dr["PregnantWeeks"].ToString();
                        lstDisease.Items.Add(dr["medicalcondition"].ToString());
                        txtPhysical.Text = (dr["PhysicalActivity"].ToString());
                        txtPhysicalType.Text = (dr["PhysicalactivityType"].ToString());
                        txtPhysicalActivityWeeks.Text = (dr["PhysicalactivityWeeks"].ToString());
                        txtSurgery.Text = (dr["Surgery"].ToString());
                        txtWhatSurgery.Text = (dr["WhatSurgery"].ToString());
                        txtWhenSurgery.Text = (dr["SurgeryWhen"].ToString());
                        txtSmoke.Text = (dr["smoke"].ToString());
                        txtSmokeMany.Text = (dr["SmokeMany"].ToString());
                        txtSmokeLong.Text = (dr["SmokeLong"].ToString());
                        txtWhenMedication.Text = (dr["MedicationWhen"].ToString());
                        txtWhatMedication.Text = (dr["MedicationWhat"].ToString());
                        txtMedication.Text = (dr["Medication"].ToString());
                        txtAnything.Text = (dr["Anythingelse"].ToString());
                        txtAnythingWrite.Text = (dr["AnythingWrite"].ToString());
                        txtParentGuardian.Text = (dr["ParentGuardian"].ToString());
                        txtRegDate.Text = Convert.ToDateTime(dr["RegDate"]).ToString("yyyy/MM/dd");
                        TxtMemberType.Text = (dr["MembershipType"].ToString());
                        txtStatus.Text = (dr["Status"].ToString());

                    }
                }


                con.Close();
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

protected void btnAdd_Command(object sender, CommandEventArgs e)
{
            try
            {


                if (e.CommandName == "Edit")
                {
                    txtAddress.ReadOnly = false;
                    txtParentGuardian.ReadOnly = false;
                    txtCity.ReadOnly = false;
                    txtPassword.ReadOnly = false;
                    txtDOB.ReadOnly = false;
                    txtEmail.ReadOnly = false;
                    txtDoctorName.ReadOnly = false;
                    txtDoctorContact.ReadOnly = false;
                    txtEmergencyName.ReadOnly = false;
                    txtEmergencyNumber.ReadOnly = false;
                    txtFirstName.ReadOnly = false;
                    txtotherName.ReadOnly = false;
                    txtLastName.ReadOnly = false;
                    txtOccupation.ReadOnly = false;
                    txtGender.ReadOnly = false;
                    txtMobile.ReadOnly = false;
                    txtMobile2.ReadOnly = false;
                    txtTitle.ReadOnly = false;
                    txtCompany.ReadOnly = false;
                    TxtMemberType.ReadOnly = false;
                    btnAdd.CommandName = "Update";
                    btnAdd.Text = "Update";
                }

                else if (e.CommandName == "Update")
                {
                    con.Open();

                    if (txtPassword != null)
                    {


                        cmd = new SqlCommand("Update Members set title=@title, firstname=@firstname, Othername=@othername, lastname=@lastname, adress=@address, contactno=@contactno, contactno2=@contactno2, gender=@gender, dob=@dob, email=@email, city=@city, occupation=@occupation, company=@company, doctorname=@doctorname, doctorcontact=@doctorcontact, emergencyname=@emergencyname, emergencycontact=@emergencycontact, passportpic=@passportpic, status=@status, medicalcondition=@medicalcondition, injury=@injury, pregnant=@pregnant, pregnantweeks=@pregnantweeks, physicalactivity=@physicalactivity, physicalactivitytype=@physicalactivitytype, physicalactivityweeks=@physicalactivityweeks, surgery=@surgery, whatsurgery=@whatsurgery, surgerywhen=@surgerywhen, smoke=@smoke, smokelong=@smokelong, smokemany=@smokemany, medication=@medication, medicationwhen=@medicationwhen, medicationwhat=@medicationwhat, anythingelse=@anythingelse, anythingwrite=@anythingwrite, parentgurdian=@parentgurdian, regdate=@regdate, password=@password where Memberid = @id", con);
                        cmd.Parameters.AddWithValue("@id", ID.Text);
                        cmd.Parameters.AddWithValue("@title", txtTitle);
                        cmd.Parameters.AddWithValue("@firstname", txtFirstName.Text);
                        cmd.Parameters.AddWithValue("@Othername", txtotherName.Text);
                        cmd.Parameters.AddWithValue("@lastname", txtLastName.Text);
                        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@contactno", txtMobile.Text);
                        cmd.Parameters.AddWithValue("@contactno2", txtMobile2.Text);
                        cmd.Parameters.AddWithValue("@gender", txtGender.Text);
                        cmd.Parameters.AddWithValue("@dob", txtDOB.Text);
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@city", txtCity.Text);
                        cmd.Parameters.AddWithValue("@occupation", txtOccupation.Text);
                        cmd.Parameters.AddWithValue("@inqury", lstInjury.Text);
                        cmd.Parameters.AddWithValue("@company", txtCompany.Text);
                        cmd.Parameters.AddWithValue("@doctorname", txtDoctorName.Text);
                        cmd.Parameters.AddWithValue("@doctorcontact", txtDoctorContact.Text);
                        cmd.Parameters.AddWithValue("@emergencyname", txtEmergencyName.Text);
                        cmd.Parameters.AddWithValue("@pregnant", txtPregnant.Text);
                        cmd.Parameters.AddWithValue("@emergencycontact", txtEmergencyNumber.Text);
                        cmd.Parameters.AddWithValue("@medicalcondition", lstDisease.Text);
                        cmd.Parameters.AddWithValue("@pregnantweeks", txtPregnantWeeks.Text);
                        cmd.Parameters.AddWithValue("@physicalactivity", txtPhysical.Text);
                        cmd.Parameters.AddWithValue("@physicalactivitytype", txtPhysicalType.Text);
                        cmd.Parameters.AddWithValue("@physicalactivityweeks", txtPhysicalActivityWeeks.Text);
                        cmd.Parameters.AddWithValue("@surgery", txtSurgery.Text);
                        cmd.Parameters.AddWithValue("@whatsurgery", txtWhatSurgery.Text);
                        cmd.Parameters.AddWithValue("@surgerywhen", txtWhenSurgery.Text);
                        cmd.Parameters.AddWithValue("@smoke", txtSmoke.Text);
                        cmd.Parameters.AddWithValue("@smokelong", txtSmokeLong.Text);
                        cmd.Parameters.AddWithValue("@smokemany", txtSmokeMany.Text);
                        cmd.Parameters.AddWithValue("@medication", txtMedication.Text);
                        cmd.Parameters.AddWithValue("@medicationwhen", txtWhenMedication.Text);
                        cmd.Parameters.AddWithValue("@medicationwhat", txtWhatMedication.Text);
                        cmd.Parameters.AddWithValue("@anythingelse", txtAnything.Text);
                        cmd.Parameters.AddWithValue("@anythingwrite", txtAnythingWrite.Text);
                        cmd.Parameters.AddWithValue("@parentgurdian", txtParentGuardian.Text);
                        cmd.Parameters.AddWithValue("@password", encryption(txtPassword.Text));
                        cmd.Parameters.AddWithValue("@status", txtStatus.Text);
                        cmd.Parameters.AddWithValue("@regdate", txtRegDate.Text);

                        var result = cmd.ExecuteNonQuery();
                        if (result != 0)
                        {
                            Response.Write("<script>alert('Details Updated Successfully')</script>");
                        }

                    }
                    else
                    {
                        cmd = new SqlCommand("Update Members set title=@title, firstname=@firstname, Othername=@othername, lastname=@lastname, adress=@address, contactno=@contactno, contactno2=@contactno2, gender=@gender, dob=@dob, email=@email, city=@city, occupation=@occupation, company=@company, doctorname=@doctorname, doctorcontact=@doctorcontact, emergencyname=@emergencyname, emergencycontact=@emergencycontact, passportpic=@passportpic, status=@status, medicalcondition=@medicalcondition, injury=@injury, pregnant=@pregnant, pregnantweeks=@pregnantweeks, physicalactivity=@physicalactivity, physicalactivitytype=@physicalactivitytype, physicalactivityweeks=@physicalactivityweeks, surgery=@surgery, whatsurgery=@whatsurgery, surgerywhen=@surgerywhen, smoke=@smoke, smokelong=@smokelong, smokemany=@smokemany, medication=@medication, medicationwhen=@medicationwhen, medicationwhat=@medicationwhat, anythingelse=@anythingelse, anythingwrite=@anythingwrite, parentgurdian=@parentgurdian, regdate=@regdate where Memberid = @id", con);
                        cmd.Parameters.AddWithValue("@id", ID.Text);
                        cmd.Parameters.AddWithValue("@title", txtTitle);
                        cmd.Parameters.AddWithValue("@firstname", txtFirstName.Text);
                        cmd.Parameters.AddWithValue("@Othername", txtotherName.Text);
                        cmd.Parameters.AddWithValue("@lastname", txtLastName.Text);
                        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@contactno", txtMobile.Text);
                        cmd.Parameters.AddWithValue("@contactno2", txtMobile2.Text);
                        cmd.Parameters.AddWithValue("@gender", txtGender.Text);
                        cmd.Parameters.AddWithValue("@dob", txtDOB.Text);
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@city", txtCity.Text);
                        cmd.Parameters.AddWithValue("@occupation", txtOccupation.Text);
                        cmd.Parameters.AddWithValue("@inqury", lstInjury.Text);
                        cmd.Parameters.AddWithValue("@company", txtCompany.Text);
                        cmd.Parameters.AddWithValue("@doctorname", txtDoctorName.Text);
                        cmd.Parameters.AddWithValue("@doctorcontact", txtDoctorContact.Text);
                        cmd.Parameters.AddWithValue("@emergencyname", txtEmergencyName.Text);
                        cmd.Parameters.AddWithValue("@pregnant", txtPregnant.Text);
                        cmd.Parameters.AddWithValue("@emergencycontact", txtEmergencyNumber.Text);
                        cmd.Parameters.AddWithValue("@medicalcondition", lstDisease.Text);
                        cmd.Parameters.AddWithValue("@pregnantweeks", txtPregnantWeeks.Text);
                        cmd.Parameters.AddWithValue("@physicalactivity", txtPhysical.Text);
                        cmd.Parameters.AddWithValue("@physicalactivitytype", txtPhysicalType.Text);
                        cmd.Parameters.AddWithValue("@physicalactivityweeks", txtPhysicalActivityWeeks.Text);
                        cmd.Parameters.AddWithValue("@surgery", txtSurgery.Text);
                        cmd.Parameters.AddWithValue("@whatsurgery", txtWhatSurgery.Text);
                        cmd.Parameters.AddWithValue("@surgerywhen", txtWhenSurgery.Text);
                        cmd.Parameters.AddWithValue("@smoke", txtSmoke.Text);
                        cmd.Parameters.AddWithValue("@smokelong", txtSmokeLong.Text);
                        cmd.Parameters.AddWithValue("@smokemany", txtSmokeMany.Text);
                        cmd.Parameters.AddWithValue("@medication", txtMedication.Text);
                        cmd.Parameters.AddWithValue("@medicationwhen", txtWhenMedication.Text);
                        cmd.Parameters.AddWithValue("@medicationwhat", txtWhatMedication.Text);
                        cmd.Parameters.AddWithValue("@anythingelse", txtAnything.Text);
                        cmd.Parameters.AddWithValue("@anythingwrite", txtAnythingWrite.Text);
                        cmd.Parameters.AddWithValue("@parentgurdian", txtParentGuardian.Text);

                        cmd.Parameters.AddWithValue("@status", txtStatus.Text);
                        cmd.Parameters.AddWithValue("@regdate", txtRegDate.Text);

                        var result = cmd.ExecuteNonQuery();
                        if (result != 0)
                        {
                            Response.Write("<script>alert('Details Updated Successfully')</script>");
                        }
                    }
                    con.Close();

                    Response.Write("<script>alert('Details Updated Successfully')</script>");

                    Server.Transfer("AdminViewMembers.aspx");
                }
                else if (e.CommandName == "Delete")
                {
                    Image1.ImageUrl = ApplicationPic.ImageUrl;
                    string fullname = txtFirstName.Text + " " + txtotherName.Text + " " + txtLastName.Text;
                    Label1.Text = fullname;
                    Page.ClientScript.RegisterStartupScript(GetType(), "modelBox", "$('#DeleteModel').modal('show');", true);

                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }
}


protected void ImgLinkButton_Click(object sender, EventArgs e)
{
    img1.ImageUrl = ApplicationPic.ImageUrl;
    string fullname = txtFirstName.Text + " " + txtotherName.Text + " " + txtLastName.Text;
    myModalLabel.Text = fullname;
    Page.ClientScript.RegisterStartupScript(GetType(), "modelBox", "$('#ImgModal').modal('show');", true);

}

        protected void Delete_Click(object sender, EventArgs e)
        {

        }

        protected void CancelDelete_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "modelBox", "$('#DeleteModel').modal('close');", true);

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Server.Transfer("AdminViewMembers.aspx");
             
        }
    }
}

