using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gym_Management_System
{
    public partial class MembershipForm2 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);

        SqlCommand cmd = null;
        public static string ImageUpload;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Form.Enctype = "multipart/form-data";
               
                lblMessage.Visible = false;
            }

            if (IsPostBack)
            {
                lblMessage.Visible = false;
                if (chkSmoke.SelectedIndex == 0)
                {
                    txtLongSmoke.Visible = true;
                    txtManySmoke.Visible = true;
                }
                if (chkPregnant.SelectedIndex == 0)
                {
                    txtPregnantWeeks.Visible = true;

                }

                if (chkPhysical.SelectedIndex == 0)
                {
                    txtWhatPhysicalActivity.Visible = true;
                    txtPhysicalActivityWeeks.Visible = true;
                }

                if (chkSurgery.SelectedIndex == 0)
                {
                    txtSurgeryWhen.Visible = true;
                    txtWhatSurgery.Visible = true;

                }
                if (chkMedication.SelectedIndex == 0)
                {
                    txtMedicationWhat.Visible = true;
                    txtMedicationWhen.Visible = true;

                }
                if (chkAnything.SelectedIndex == 0)
                {
                    txtAnything.Visible = true;


                }
                if (ChkDieases.SelectedValue == "Other")
                {
                    txtOtherDiseases.Visible = true;
                }

            }
        }

        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            try
            {
 Save();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }
           

        }

        public void Save()
        {
           
            HttpPostedFile postedFile = ImageFile.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            int fileSize = postedFile.ContentLength;
            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif"
               || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".jpeg")
            {

               string PassportPis  = "~/MemberPhotos/" + filename;
            ImageUpload = PassportPis;


            con.Open();


            cmd = new SqlCommand("select * from MembershipApplication where Email = @email", con);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            var result = cmd.ExecuteReader();

            if (result.HasRows)
            {
                Response.Write("<script>alert('Email Address is already in use..')</script>");
                lblMessage.Text = "Email Address is already in use";
                lblMessage.Visible = true;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                result.Close();
            }
            else
            {
                result.Close(); 
                cmd = new SqlCommand("insert into MembershipApplication(title,firstname,othername,lastname,address,contactno,contactno2,gender,dob,email,city,occupation,company,doctorname,doctorcontact,emergencyname,emergencycontact,passportpic,status,medicalcondition,injury,pregnant,pregnantweeks,physicalactivity,physicalactivitytype,physicalactivityweeks,surgery,whatsurgery,surgerywhen,smoke,smokelong,smokemany,medication,medicationwhen,medicationwhat,anythingelse,anythingwrite,parentguardian,regdate) VALUES (@title, @firstname,@othername,@lastname, @address, @contactno, @contactno2, @gender, @dob, @email,@city,@occupation,@company,@doctorname,@doctorcontact,@emergencyname,@emergencycontact,@passportpic,@status,@medicalcondition,@Injury,@pregnant,@pregnantweeks,@physicalactivity,@physicalactivitytype,@physicalactivityweeks,@surgery,@surgerywhen,@whatsurgery,@smoke,@smokelong,@smokemany,@medication,@medicationwhen,@medicationwhat,@anythingelse,@anythingwrite,@parentguardian,@regdate)", con);
                // cmd = new SqlCommand("insert into MembershipApplication(title,firstname,othername,lastname,address,contactno,contactno2,gender,dob,email,city,occupation,company,doctorname,doctorcontact,emergencyname,emergencycontact,passportpic,status,medicalcondition1,medicalcondition2,medicalcondition3,medicalcondition4,medicalcondition5,medicalcondition6,medicalcondition7,medicalcondition8,medicalcondition9,medicalcondition10,medicalcondition11,medicalcondition12,medicalcondition13,injury1,injury2,injury3,injury4,injury5,injury6,pregnant,pregnantweeks,physicalactivity,physicalactivitytype,physicalactivityweeks,surgery,whatsurgery,surgerywhen,smoke,smokelong,smokemany,medication,medicationwhen,medicationwhat,anythingelse,anythingwrite,parentguardian,regdate) VALUES (@title, @firstname,@othername,@lastname, @address, @contactno, @contactno2, @gender, @dob, @email,@city,@occupation,@company,@doctorname,@doctorcontact,@emergencyname,@emergencycontact,@passportpic,@status,@medicalcondition1,@medicalcondition2,@medicalcondition3,@medicalcondition4,@medicalcondition5,@medicalcondition6,@medicalcondition7,@medicalcondition8,@medicalcondition9,@medicalcondition10,@medicalcondition11,@medicalcondition12,@medicalcondition13,@Injury1,@Injury2,@Injury3,@Injury4,@Injury5,@Injury6,@pregnant,@pregnantweeks,@physicalactivity,@physicalactivityweeks,@physicalactivitytype,@surgery,@surgerywhen,@whatsurgery,@smoke,@smokelong,@smokemany,@medication,@medicationwhat,@medicationwhen,@anythingelse,@anythingwrite,@parentguardian,@regdate)", con);

                //   cmd = new SqlCommand("insert into TblMembers(name, address, contactno, gender, email, city, state, height, weight, month, onemonthfee, totalfee, receivedfee, password, fromtime, totime) VALUES (@name, @address, @contactno, @gender, @email, @city, @state, @height, @weight, @month, @onemonthfee, @totalfee, @receivedfee, @password, @fromtime, @totime)", con);


                cmd.Parameters.AddWithValue("@title", drpTitle.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@firstname", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@othername", txtotherName.Text);
                cmd.Parameters.AddWithValue("@lastname", txtLastName.Text);
                cmd.Parameters.AddWithValue("@contactno", txtMobile2.Text);
                cmd.Parameters.AddWithValue("@contactno2", txtMobile2.Text);
                cmd.Parameters.AddWithValue("@gender", drpGender.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@dob", Convert.ToDateTime(txtDOB.Text));
                //cmd.Parameters.AddWithValue("@dob", Convert.ToDateTime(txtDOB.Text).ToShortDateString());
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@city", txtCity.Text);
                cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@occupation", txtOccupation.Text);
                cmd.Parameters.AddWithValue("@company", txtCompany.Text);
                cmd.Parameters.AddWithValue("@doctorname", txtDoctorName.Text);
                cmd.Parameters.AddWithValue("@doctorcontact", txtDoctorContact.Text);
                cmd.Parameters.AddWithValue("@emergencyname", txtEmergencyName.Text);
                cmd.Parameters.AddWithValue("@emergencycontact", txtEmergencyNumber.Text);
                cmd.Parameters.AddWithValue("@passportpic", ImageUpload);
                cmd.Parameters.AddWithValue("@status", "PENDING");

                if (ChkDieases.SelectedIndex >= 0)
                {
                    string state1 = "";
                    foreach (ListItem s in ChkDieases.Items)
                    {
                        if (s.Selected)
                        {

                            state1 += s + ",";

                        }
                    }
                    state1 = state1.Substring(0, state1.Length - 1);


                    cmd.Parameters.AddWithValue("@medicalcondition", state1);


                }
                else
                {
                    cmd.Parameters.AddWithValue("@medicalcondition", "");
                }



                if (chkInjury.SelectedIndex >= 0)
                {
                    string state1 = "";
                    foreach (ListItem s in chkInjury.Items)
                    {
                        if (s.Selected)
                        {

                            state1 += s + ",";

                        }
                    }
                    state1 = state1.Substring(0, state1.Length - 1);


                    cmd.Parameters.AddWithValue("@injury", state1);


                }
                else
                {
                    cmd.Parameters.AddWithValue("@injury", "");
                }


                cmd.Parameters.AddWithValue("@pregnant", chkPregnant.Text);
                cmd.Parameters.AddWithValue("@pregnantweeks", txtPregnantWeeks.Text);
                cmd.Parameters.AddWithValue("@physicalactivity", chkPhysical.Text);
                cmd.Parameters.AddWithValue("@physicalactivityweeks", txtPhysicalActivityWeeks.Text);
                cmd.Parameters.AddWithValue("@physicalactivitytype", txtWhatPhysicalActivity.Text);
                cmd.Parameters.AddWithValue("@surgery", chkSurgery.Text);
                cmd.Parameters.AddWithValue("@whatsurgery", txtWhatSurgery.Text);
                cmd.Parameters.AddWithValue("@surgerywhen", txtSurgeryWhen.Text);
                cmd.Parameters.AddWithValue("@smoke", chkSmoke.Text);
                cmd.Parameters.AddWithValue("@smokelong", txtLongSmoke.Text);
                cmd.Parameters.AddWithValue("@smokemany", txtManySmoke.Text);
                cmd.Parameters.AddWithValue("@medication", chkMedication.Text);
                cmd.Parameters.AddWithValue("@medicationwhen", txtMedicationWhen.Text);
                cmd.Parameters.AddWithValue("@medicationwhat", txtMedicationWhat.Text);
                cmd.Parameters.AddWithValue("@anythingelse", chkAnything.Text);
                cmd.Parameters.AddWithValue("@anythingwrite", txtAnything.Text);

                cmd.Parameters.AddWithValue("@parentguardian", txtParentGuardian.Text);
                cmd.Parameters.AddWithValue("@regdate", DateTime.Now.Date);
                //cmd.Parameters.AddWithValue("@expiredate", DateTime.Now.Date.AddMonths(Convert.ToInt32(txtMonth.Text)).ToShortDateString());
                //cmd.Parameters.AddWithValue("@password", encryption(txtPass.Text));

                cmd.ExecuteNonQuery();

                    //Save the Image File in Folder.
                    ImageFile.PostedFile.SaveAs(Server.MapPath(PassportPis));

                    con.Close();

                Response.Write("<script>alert('Application Submitted Successfully..')</script>");

                Server.Transfer("MembershipConfirmation.aspx");

          }

            }
            else
            {
                lblMessage.Text = "upload only jpeg /jpg";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
                Response.Write("<script>alert('Upload only jpeg /jpg')</script>");
            }

            //}

            //else
            //{
            //    lblMessage.Visible = true;
            //    lblMessage.ForeColor = System.Drawing.Color.Red;
            //    lblMessage.Text = "Only images (.jpg, .png, .gif and .bmp) can be uploaded";

            //}
            //}


            //catch (Exception ex)
            //{

            //string path = Server.MapPath(ImageUpload);
            //FileInfo file = new FileInfo(path);
            //if (file.Exists)//check file exsit or not  
            //{
            //    file.Delete();
               
            //}
           
        }
    

       
        public void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
           
          }

        protected void customValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (drpTitle.Text == "Select Title")
            {
                customValidator1.ErrorMessage = "* Select a Title.";
                args.IsValid = false;
            }
          
        }

        protected void customValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (drpGender.Text == "Select Gender")
            {
                customValidator2.ErrorMessage = "* Select Gender";
                args.IsValid = false;
            }
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = terms.Checked;
            CustomValidator3.ForeColor = System.Drawing.Color.Red;
        }
    }

       
    
}