<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MembershipForm.aspx.cs" Inherits="Gym_Management_System.MembershipForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
   <meta name="viewport" content="width=device-width", initial-scale=1.0">
   <%--  <link href="Memberform/css/siteCSS.css" rel="stylesheet" />--%>
  <%--      <link href="Memberform/css/AdminLTE.css" rel="stylesheet" />--%>
 <%--   <link href="Memberform/css/site.css" rel="stylesheet" />--%>
    <%--    <link href="Memberform/lib/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />--%>
    <%--    <link href="Memberform/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="Memberform/Ionicons/css/ionicons.css" rel="stylesheet" />
    <link href="Memberform/ion.rangeSlider/css/ion.rangeSlider.css" rel="stylesheet" />--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
    <script src="Dashboard/assets/js/core/jquery.min.js"></script>
    <style>
        hr {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            position: relative;
            top: 20px;
            height: 5px;
            background: black;
            margin-bottom: 50px;
            left: 0px;
            width: 468px;
        }

        section {
            /* background:black;*/
            color: black;
            border-radius: 1em;
            padding: 1em;
            position: absolute;
            left: 50%;
            margin-right: -50%;
            transform: translate(-50%)
        }
    </style>
</head>
<body>

    <div class="container-fluid px-1 py-5 mx-auto">
        <div class="row d-flex justify-content-center">
            <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
                <form runat="server" id="form1" enctype="multipart/form-data">
                      <section>
                    <div>

                        <h3>Yans GYM</h3>
                        <h4>Membership Form</h4>
                        <span class="login100-form-logo">
                            <img src="LoginStyle/images/130830622_106550114655462_565542333308303623_n.jpg" style="border-radius: 25px; width: 134px;" height="100" />
                        </span>
                    </div>
                    <hr />


                    <asp:Label runat="server" class="control-label" ID="lblMessage" Visible="false"> </asp:Label>
                  
                        <asp:ValidationSummary runat="server" ForeColor="Red" />
                        <asp:Wizard ID="Wizard1" runat="server" class="form-group" DisplaySideBar="false" ActiveStepIndex="0" OnFinishButtonClick="Wizard1_FinishButtonClick" OnNextButtonClick="Wizard1_NextButtonClick">


                            <StepNextButtonStyle BackColor="#0033CC" CssClass="btn btn-md btn-primary"></StepNextButtonStyle>
                            <StepPreviousButtonStyle BackColor="#666666" CssClass="btn btn-md btn-secondary"></StepPreviousButtonStyle>
                            <FinishCompleteButtonStyle BackColor="#009900" CssClass="btn btn-md btn-success"></FinishCompleteButtonStyle>
                            <FinishPreviousButtonStyle BackColor="#666666" CssClass="btn btn-md btn-secondary"></FinishPreviousButtonStyle>
                            <StartNextButtonStyle BackColor="#0033CC" CssClass="btn btn-md btn-primary"></StartNextButtonStyle>
                            <WizardSteps>
                                <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1">
                                    <div class="content">
                                        <h4>Personnal Details</h4>

                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label runat="server" class="control-label">Title</label>
                                                    <asp:DropDownList runat="server" ID="drpTitle" CssClass="custom-select mr-sm-2">

                                                        <asp:ListItem hidden="true" Text="Select Title"></asp:ListItem>
                                                        <asp:ListItem Value="Mr"> Mr </asp:ListItem>
                                                        <asp:ListItem Value="Mrs"> Mrs</asp:ListItem>
                                                        <asp:ListItem Value="Miss">Miss</asp:ListItem>
                                                        <asp:ListItem Value="Master">Master</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <span class="text-danger">
                                                        <asp:CustomValidator runat="server" Display="Dynamic" ID="customValidator1"
                                                            ForeColor="Red" ErrorMessage="" OnServerValidate="customValidator1_ServerValidate">  
                                                        </asp:CustomValidator>

                                                    </span>
                                                </div>

                                            </div>


                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label runat="server" asp-for="txtFirstName" class="control-label">First Name</label>
                                                    <asp:TextBox runat="server" ID="txtFirstName" class="form-control" placeholder="First Name" />
                                                    <span class="text-danger">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="* First Name is required"></asp:RequiredFieldValidator>
                                                    </span>

                                                </div>
                                            </div>

                                        </div>


                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label asp-for="txtotherName" class="control-label">Other Names</label>
                                                    <asp:TextBox runat="server" ID="txtotherName" class="form-control" placeholder="Other Names" />
                                                    <span asp-validation-for="txtotherName" class="text-danger"></span>
                                                </div>

                                            </div>

                                            <div class="col-md-6">

                                                <div class="form-group">
                                                    <label asp-for="Location" class="control-label">Last Name (Surname)</label>
                                                    <asp:TextBox runat="server" ID="txtLastName" class="form-control" placeholder="Last Name" />
                                                    <span class="text-danger">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName" ErrorMessage="* Last Name is required"></asp:RequiredFieldValidator>

                                                    </span>

                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label asp-for="Email" class="control-label">Email</label>
                                                    <asp:TextBox TextMode="Email" runat="server" ID="txtEmail" class="form-control" placeholder="Email Address" />

                                                    <span class="text-danger">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail" ErrorMessage="* Email is required"></asp:RequiredFieldValidator>

                                                    </span>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label asp-for="drpGender" class="control-label">Gender</label>
                                                    <asp:DropDownList runat="server" ID="drpGender" class="form-control">
                                                        <asp:ListItem Selected="True" hidden="true">Select Gender</asp:ListItem>
                                                        <asp:ListItem Value="Male"> Male </asp:ListItem>
                                                        <asp:ListItem Value="Female"> Female</asp:ListItem>
                                                        <asp:ListItem Value="NotSay">Rather Not Say </asp:ListItem>

                                                    </asp:DropDownList>
                                                    <span class="text-danger">
                                                        <asp:CustomValidator runat="server" Display="Dynamic" ID="customValidator2"
                                                            ErrorMessage="" OnServerValidate="customValidator2_ServerValidate"></asp:CustomValidator>
                                                    </span>
                                                </div>

                                            </div>


                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label asp-for="txtDOB" class="control-label">Date of Birth</label>
                                                    <asp:TextBox TextMode="Date" runat="server" ID="txtDOB" class="form-control" placeholder="Date of Birth " />

                                                    <span class="text-danger">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDOB" ErrorMessage="* Date of Birth is required"></asp:RequiredFieldValidator>

                                                    </span>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label asp-for="lblAddress" class="control-label">Address</label>
                                                    <asp:TextBox runat="server" ID="txtAddress" class="form-control" placeholder="Home Address" />

                                                    <span class="text-danger">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress" ErrorMessage="* Address is required"></asp:RequiredFieldValidator>

                                                    </span>
                                                </div>

                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label asp-for="txtCity" class="control-label">City</label>
                                                    <asp:TextBox runat="server" ID="txtCity" class="form-control" placeholder="City" />
                                                    <span class="text-danger">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCity" ErrorMessage="* City is required"></asp:RequiredFieldValidator>

                                                    </span>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label asp-for="txtMobile" class="control-label">Mobile Number</label>
                                                    <asp:TextBox TextMode="Phone" runat="server" ID="txtMobile" class="form-control" placeholder="Mobile" />

                                                    <span class="text-danger">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtMobile" ErrorMessage="* Mobile Number is required"></asp:RequiredFieldValidator>

                                                    </span>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label asp-for="txtMobile2" class="control-label">Mobile Number 2</label>
                                                    <asp:TextBox TextMode="Phone" runat="server" ID="txtMobile2" class="form-control" placeholder="Mobile 2" />

                                                    <span asp-validation-for="txtMobile2" class="text-danger"></span>
                                                </div>
                                            </div>


                                        </div>



                                        <div class="row">
                                            <div class="col-md-6">

                                                <div class="form-group">
                                                    <label asp-for="txtOccupation" class="control-label">Occupation</label>

                                                    <asp:TextBox runat="server" ID="txtOccupation" class="form-control" placeholder="Occupation" />
                                                    <span asp-validation-for="txtOccupation" class="text-danger"></span>
                                                </div>
                                            </div>

                                            <div class="col-md-6">

                                                <div class="form-group">
                                                    <label asp-for="txtCompany" class="control-label">Company</label>
                                                    <asp:TextBox runat="server" ID="txtCompany" class="form-control" placeholder="Company" />
                                                    <span asp-validation-for="txtCompany" class="text-danger"></span>
                                                </div>
                                            </div>

                                        </div>


                                        <div class="row">
                                            <div class="col-md-6">

                                                <div class="form-group">
                                                    <label asp-for="lblDoctorName" class="control-label">Doctor's Name</label>
                                                    <asp:TextBox runat="server" ID="txtDoctorName" class="form-control" placeholder="Doctor's Name" />
                                                    <span asp-validation-for="txtDoctorName" class="text-danger"></span>
                                                </div>
                                            </div>

                                            <div class="col-md-6">

                                                <div class="form-group">
                                                    <label asp-for="lblDoctorContact" class="control-label">Doctor's Contact</label>
                                                    <asp:TextBox runat="server" ID="txtDoctorContact" class="form-control" placeholder="Doctor's Contact" />
                                                    <span asp-validation-for="txtDoctorContact" class="text-danger"></span>
                                                </div>
                                            </div>

                                        </div>


                                        <div class="row">
                                            <div class="col-md-6">

                                                <div class="form-group">
                                                    <label asp-for="lblEmergencyName" class="control-label">Emergency Contact Name</label>
                                                    <asp:TextBox runat="server" ID="txtEmergencyName" class="form-control" placeholder="Emergency Contact Name" />
                                                    <span asp-validation-for="txtEmergencyName" class="text-danger"></span>
                                                </div>
                                            </div>

                                            <div class="col-md-6">

                                                <div class="form-group">
                                                    <label asp-for="lblEmergencyNumber" class="control-label">Emergency Contact Number</label>
                                                    <asp:TextBox runat="server" ID="txtEmergencyNumber" class="form-control" placeholder="Contact Number" />
                                                    <span asp-validation-for="txtEmergencyNumber" class="text-danger"></span>
                                                </div>
                                            </div>

                                        </div>

                                        


                                    </div>
                                </asp:WizardStep>



                                <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2">
                                    <div class="content" style="margin-left: 55px">

                                        <h3 class="control-label">Medical Details</h3>

                                        <div>


                                            <strong class="control-label">Have you ever or do you have any of the Following??</strong>

                                            <asp:CheckBoxList runat="server" RepeatColumns="2" CssClass="form-check" ID="ChkDieases">
                                                <asp:ListItem Value="Heart Disease" Text="Heart Disease"></asp:ListItem>
                                                <asp:ListItem Value="Asthma" Text="Asthma"></asp:ListItem>

                                                <asp:ListItem Value="Cardiovascular Condition" Text="Cardiovascular Condition"></asp:ListItem>
                                                <asp:ListItem Value="High/Low Blood Pressure" Text="High/Low Blood Pressure"></asp:ListItem>
                                                <asp:ListItem Value="Family Hx of Heart Disease" Text="Family Hx of Heart Disease"></asp:ListItem>

                                                <asp:ListItem Value="Dizziness"></asp:ListItem>
                                                <asp:ListItem Value="Arthritis"></asp:ListItem>
                                                <asp:ListItem Value="Infestious Diseases"></asp:ListItem>

                                                <asp:ListItem Value="Blackouts"></asp:ListItem>
                                                <asp:ListItem Value="Diabetes"></asp:ListItem>
                                                <asp:ListItem Value="Fainting"></asp:ListItem>

                                                <asp:ListItem Value="Epilepsy/Fits"></asp:ListItem>
                                                <%--<asp:ListItem Value="Other"></asp:ListItem>--%>



                                            </asp:CheckBoxList>
                                            <div class="col-md-12">
                                                <asp:TextBox runat="server" ID="txtOtherDiseases" class="form-control" placeholder="Other Please Specify" />
                                            </div>
                                        </div>

                                        <hr />
                                        <div>
                                            <strong class="form-check-label">Do you have any Problem/Injury in the following areas??</strong>
                                            <br />
                                            <asp:CheckBoxList runat="server"  RepeatColumns="2" CssClass="form-check" ID="chkInjury">
                                                <asp:ListItem Value="Knee" Text="Knee"></asp:ListItem>
                                                <asp:ListItem Value="Lower Back" Text="Lower Back"></asp:ListItem>

                                                <asp:ListItem Value="Neck / Shoulders" Text="Neck / Shoulders"></asp:ListItem>
                                                <asp:ListItem Value="Hips / Pelvis" Text="Hips / Pelvis"></asp:ListItem>
                                                <asp:ListItem Value="Flexibility" Text="Flexibility"></asp:ListItem>
                                                <%--   <asp:ListItem Value="Other" Text="Other"></asp:ListItem>--%>
                                            </asp:CheckBoxList>

                                            <div class="col-md-12">
                                                <asp:TextBox runat="server" ID="chkOtherInjury" class="form-control" placeholder="Other Please Specify" />
                                            </div>
                                        </div>
                                        <hr />
                                        <div>
                                            <strong class="control-label">Are You Pregnant?</strong>
                                            <br />




                                            <asp:RadioButtonList ID="chkPregnant" runat="server" CssClass="form-check" AutoPostBack="true">
                                                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                                                <asp:ListItem Value="No" Text="No"></asp:ListItem>

                                            </asp:RadioButtonList>
                                            <span class="text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="chkPregnant" ErrorMessage="* Are you Pregnant"></asp:RequiredFieldValidator>
                                            </span>

                                            <div class="col-md-12">
                                                <asp:TextBox Visible="false" runat="server" ID="txtPregnantWeeks" class="form-control" placeholder="How many Weeks??" />
                                            </div>

                                          
                                        </div>
                                        <hr />
                                        <div>
                                            <strong class="control-label">Are you currently doing any regular physical activity??</strong>


                                            <asp:RadioButtonList ID="chkPhysical" runat="server" Class="form-check" AutoPostBack="true">
                                                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                                                <asp:ListItem Value="No" Text="No"></asp:ListItem>

                                            </asp:RadioButtonList>

                                            <span class="text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="chkPhysical" ErrorMessage="* Any Regular Physical Activity"></asp:RequiredFieldValidator>
                                            </span>

                                            <div class="row">
                                            <div class="col-md-6">
                                                <asp:TextBox Visible="false" runat="server" ID="txtWhatPhysicalActivity" class="form-control" placeholder="What Physical Activity??" />
                                                </div>
                                            <div class="col-md-6">
                                                <asp:TextBox Visible="false" runat="server" ID="txtPhysicalActivityWeeks" class="form-control" placeholder="How many times per Week?" />
                                            </div>
                                        </div>
</div>
                                        <hr />
                                        <div>
                                            <strong class="control-label">Have you had surgery in the last 5 years??</strong>
                                            <br />
                                            <asp:RadioButtonList ID="chkSurgery" runat="server" Class="form-check" AutoPostBack="true">
                                                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                                                <asp:ListItem Value="No" Text="No"></asp:ListItem>

                                            </asp:RadioButtonList>
                                            <span class="text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="chkSurgery" ErrorMessage="* Have you Had Surgery"></asp:RequiredFieldValidator>
                                            </span>

                                            <div class="row">
                                            <div class="col-md-6">
                                                <asp:TextBox Visible="false" runat="server" ID="txtWhatSurgery" class="form-control" placeholder="What Surgery??" />
                                                </div>
                                            <div class="col-md-6">
                                                <asp:TextBox Visible="false" runat="server" ID="txtSurgeryWhen" class="form-control" placeholder="When you did the Surgery?" />
                                            </div>
                                        </div>
                                           </div>

                                        <hr />
                                        <div>
                                            <strong class="control-label">Do you smoke??</strong>
                                            <br />

                                            <asp:RadioButtonList ID="chkSmoke" runat="server" Class="form-check" AutoPostBack="True">
                                                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                                                <asp:ListItem Value="No" Text="No"></asp:ListItem>

                                            </asp:RadioButtonList>
                                            <span class="text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="chkSmoke" ErrorMessage="* Do you smoke"></asp:RequiredFieldValidator>
                                            </span>

                                            <div class="row">
                                            <div class="col-md-6">
                                                <asp:TextBox Visible="false" runat="server" ID="txtManySmoke" class="form-control" placeholder="How many per day??" />
                                                </div>
                                            <div class="col-md-6">
                                                <asp:TextBox Visible="false" runat="server" ID="txtLongSmoke" class="form-control" placeholder="How long have you smoked?" />
                                            </div>
                                        </div>
                                            </div>
                                        <hr />
                                        <div>
                                            <strong class="control-label">Are you on any medication??</strong>
                                            <br />
                                            <asp:RadioButtonList ID="chkMedication" runat="server" Class="form-check" AutoPostBack="true">
                                                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                                                <asp:ListItem Value="No" Text="No"></asp:ListItem>

                                            </asp:RadioButtonList>
                                            <span class="text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="chkMedication" ErrorMessage="* Are you on Medication"></asp:RequiredFieldValidator>
                                            </span>

                                            <div class="row">
                                            <div class="col-md-6">
                                                 <asp:TextBox Visible="false" runat="server" ID="txtMedicationWhat" class="form-control" placeholder="What Medication?" />
                                          
                                                   </div>
                                            <div class="col-md-6">
                                                <asp:TextBox Visible="false" runat="server" ID="txtMedicationWhen" class="form-control" placeholder="When?" />
                                             
                                                 </div>
                                        </div>
</div>
                                        <hr />
                                        <div>
                                            <strong class="control-label">Anything else we need to know??</strong>
                                            <br />
                                            <asp:RadioButtonList ID="chkAnything" runat="server" Class="form-check" AutoPostBack="true">
                                                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                                                <asp:ListItem Value="No" Text="No"></asp:ListItem>

                                            </asp:RadioButtonList>
                                            <span class="text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="chkAnything" ErrorMessage="* Anything Else"></asp:RequiredFieldValidator>
                                            </span>


                                            <div class="col-md-12">
                                                <asp:TextBox Visible="false" runat="server" ID="txtAnything" class="form-control" placeholder="Write it down" />
                                            </div>

                                        </div>

                                    </div>

                                </asp:WizardStep>


                                <asp:WizardStep ID="WizardStep3" runat="server" Title="Step 3">
                                    <div class="content">

                                        <div class="row">
                                            <div class="col-md-8 offset-3">
                                              <h3>  <label class="control-label">Upload a Recent Photo</label></h3>
                                                <%--  <asp:FileUpload id="Image" runat="server"/>--%>
                                                <br />
                                                <input id="ImageFile" accept="image/*" runat="server" name="ImageFile" type="file" required="required" />

                                            </div>
                                        </div>
                                        
                                        <br />
                                        <hr />

                                        
                                            <h3>Acknowledgement And Assumption of Risk</h3>
                                        <div class="col-md-8 offset-2">
                                            <label class="fancy-checkbox">

                                                <asp:CheckBox ID="terms" runat="server"  />
                                                I accept the <a href="Terms.html">Terms &amp; Agreements</a>
 </label> <br />
                                          <asp:CustomValidator ID="CustomValidator3" runat="server" 
        ErrorMessage="Please accept the terms..." 
        onservervalidate="CustomValidator3_ServerValidate"></asp:CustomValidator>
                                           
                                        </div>
                                        <hr />
                                        <h4><strong>WHERE PARTICIPANT IS UNDER 18 YEARS</strong></h4>

                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label asp-for="lblParentGuardian" class="control-label">Parents or Guardian</label>

                                                <asp:TextBox runat="server" ID="txtParentGuardian" class="form-control" placeholder="Parents or Guardian's Names" />
                                            </div>
                                        </div>
                                    </div>
                                 
                                </asp:WizardStep>

                            </WizardSteps>
                        </asp:Wizard>
                    </section>
                </form>


            </div>


        </div>
    </div>






</body>
</html>
