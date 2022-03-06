<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminViewMembersDetails.aspx.cs" Inherits="Gym_Management_System.AdminViewMembersDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




 <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="Dashboard/assets/img/apple-icon.png"/>
  <link rel="icon" type="image/png" href="Dashboard/assets/img/favicon.png"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
 
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"/>
  <!-- CSS Files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" /> 
   <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   
  <link href="Dashboard/assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="Dashboard/assets/demo/demo.css" rel="stylesheet" />

  <div class="wrapper ">
    
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="#pablo">Member Section</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
         
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">

            <%--<div class="container-fluid px-1 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">--%>

              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title">Membership Application</h4>
                  <p class="card-category">Details</p>
                </div>
                
                         <div class="container-fluid px-1 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
            <asp:LinkButton runat="server" ID="ImgLinkButton" data-target="#ImgModal" UseSubmitBehavior="false" OnClick="ImgLinkButton_Click">     
                <span class="login100-form-logo">
                       <asp:Image runat="server" style="border-radius:25px; width: 200px;" height="200" ID="ApplicationPic"  />
                       
					</span>
</asp:LinkButton>
            </div>
        </div>
                             </div>
                   <%--<div class="col-md-4">
              <div class="card card-profile">
                <div class="card-avatar">
                 
                </div>
                  </div>
                       </div>--%>

                <div class="card-body">

                    
                    <h4>Personnal Details</h4>

                    <div class="row">
                        
                        <div class="col-md-2">
                            <div class="form-group">
                                <label runat="server" class="control-label"> Title</label>
                                
       <asp:TextBox runat="server" ID="txtTitle" ReadOnly="true"  class="form-control" />
            
                    
                                          
                        </div>

                    </div>

                  
                        <div class="col-md-3">
                            <div class="form-group">
                                <label runat="server" asp-for="txtFirstName" class="control-label">First Name</label>
                                <asp:TextBox runat="server" ReadOnly="true" ID="txtFirstName"  class="form-control" />
                     
                            </div>
                        </div>

                        
                        <div class="col-md-3">
                            <div class="form-group">
                                <label asp-for="txtotherName" class="control-label">Other Names</label>
                                <asp:TextBox runat="server" ReadOnly="true" ID="txtotherName" class="form-control"  />
                              
                            </div>

                        </div>
                   
                        <div class="col-md-3">

                            <div class="form-group">
                                <label  class="control-label"> Last Name (Surname)</label>
                               <asp:TextBox runat="server" ReadOnly="true" ID="txtLastName"  class="form-control" />
                        
                           
                            </div>
                        </div>

                          </div>
                     <br />
                       <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label asp-for="Email" class="control-label">Email</label>
                                <asp:TextBox TextMode="Email" ReadOnly="true" runat="server" ID="txtEmail"  class="form-control" />
                    
                              
                            </div>

                        </div>

                            <div class="col-md-4">
                            <div class="form-group">
                                <label asp-for="lblAddress" class="control-label">Address</label>
                                <asp:TextBox runat="server" ID="txtAddress" ReadOnly="true"  class="form-control"  placeholder="Home Address" />
                    
                               
                            </div>

                        </div>

                           <div class="col-md-3">
                            <div class="form-group">
                                <label asp-for="txtCity" class="control-label">City</label>
                                <asp:TextBox runat="server" ID="txtCity" ReadOnly="true" class="form-control"  placeholder="City" />
                    
                            </div>

                        </div>
                          
                             <div class="col-md-2">
                            <div class="form-group">
                                <label asp-for="drpGender" class="control-label">Gender</label>
                              <asp:TextBox runat="server" ReadOnly="true" ID="txtGender"  class="form-control" />
            
                             
                            </div>

                        </div>

                           </div>
        <br />
                <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label asp-for="txtDOB" class="control-label">Date of Birth</label>
                              <asp:TextBox ReadOnly="true"  TextMode="Date" runat="server" ID="txtDOB" class="form-control" />
                   
                            </div>
                        </div>

                           
                        <div class="col-md-2">
                            <div class="form-group">
                                <label asp-for="txtMobile" class="control-label">Mobile Number</label>
                               <asp:TextBox TextMode="Phone" ReadOnly="true"  runat="server" ID="txtMobile" class="form-control" />
                   
                                 
                            </div>
                        </div>

                       <div class="col-md-2">
                            <div class="form-group">
                                <label asp-for="txtMobile2" class="control-label">Mobile Number 2</label>
                               <asp:TextBox TextMode="Phone" ReadOnly="true"  runat="server" ID="txtMobile2" class="form-control" />
                   
                               
                            </div>
                        </div>

                        <div class="col-md-3">

                            <div class="form-group">
                                <label asp-for="txtOccupation" class="control-label"> Occupation</label>
                                
                                <asp:TextBox  runat="server" ReadOnly="true" ID="txtOccupation" class="form-control" />
                   
                            </div>
                        </div>

                         <div class="col-md-3">

                            <div class="form-group">
                                <label asp-for="txtCompany" class="control-label">Company</label>
                                <asp:TextBox  runat="server" ID="txtCompany" class="form-control" ReadOnly="true" />
                     
                            </div>
                        </div>

                        </div>
                     <br />

                        <div class="row">
                        <div class="col-md-3">

                            <div class="form-group">
                                <label asp-for="lblDoctorName" class="control-label"> Doctor's Name</label>
                                <asp:TextBox  runat="server" ID="txtDoctorName" class="form-control" ReadOnly="true"/>
                
                            </div>
                        </div>

                         <div class="col-md-3">

                            <div class="form-group">
                                <label asp-for="lblDoctorContact" class="control-label">Doctor's Contact</label>
                                <asp:TextBox  runat="server" ID="txtDoctorContact" class="form-control" ReadOnly="true"/>
                     
                            </div>
                        </div>

                       
                        <div class="col-md-3">

                            <div class="form-group">
                                <label asp-for="lblEmergencyName" class="control-label"> Emergency Contact Name</label>
                                <asp:TextBox  runat="server" ID="txtEmergencyName" class="form-control" ReadOnly="true" />
         
                            </div>
                        </div>

                         <div class="col-md-3">

                            <div class="form-group">
                                <label asp-for="lblEmergencyNumber" class="control-label">Emergency Contact Number</label>
                                <asp:TextBox  runat="server" ID="txtEmergencyNumber" class="form-control" ReadOnly="true" />
                     
                            </div>
                        </div>

                        </div>
                     <br />
                     <h4>Medical Details</h4>
                    <hr />
                     <br />
                    <div class="row">
                        <div class="col-md-6">
                             <label class="control-label">Medical Condition</label>
                             
                            <asp:ListBox ID="lstDisease" runat="server" class="form-control" ReadOnly="true" ></asp:ListBox>
                        </div>

                        <div class="col-md-6">
                             <label class="control-label">Injury</label>
                            
                            <asp:listbox ID="lstInjury" runat="server" class="form-control" ReadOnly="true" ></asp:listbox>
                        </div>
  
                   
                   </div>
                     <br />
                    <div class="row">
                        <div class="col-md-1">
                             <label class="control-label">Pregnant</label>
                             
                            <asp:TextBox ID="txtPregnant" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                             <label class="control-label">How many Weeks?</label>
                             
                            <asp:TextBox  ID="txtPregnantWeeks" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                             <label class="control-label">Physcial Activity</label>
                             
                            <asp:TextBox ID="txtPhysical" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                             <label class="control-label">Type of Physical Activity</label>
                             
                            <asp:TextBox  ID="txtPhysicalType" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                             <label class="control-label">How many times per Week</label>
                             
                            <asp:TextBox  ID="txtPhysicalActivityWeeks" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>
  <div class="col-md-1">
                             <label class="control-label">Medication</label>
                             
                            <asp:TextBox ID="txtMedication" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>

                           <div class="col-md-2">
                             <label class="control-label">When was Medication?</label>
                             
                            <asp:TextBox ID="txtWhenMedication" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>

                        
                   
                   </div>
                     <br />
                     <div class="row">

                         <div class="col-md-2">
                             <label class="control-label">What Medication?</label>
                             
                            <asp:TextBox  ID="txtWhatMedication" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>

                        <div class="col-md-1">
                             <label class="control-label">Surgery</label>
                             
                            <asp:TextBox ID="txtSurgery" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                             <label class="control-label">What Surgery</label>
                             
                            <asp:TextBox  ID="txtWhatSurgery" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                             <label class="control-label">When was the Surgery</label>
                             
                            <asp:TextBox ID="txtWhenSurgery" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>

                        <div class="col-md-1">
                             <label class="control-label">Smoke</label>
                             
                            <asp:TextBox  ID="txtSmoke" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                             <label class="control-label">How many per day</label>
                             
                            <asp:TextBox  ID="txtSmokeMany" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>

                          <div class="col-md-2">
                             <label class="control-label">How long per day</label>
                             
                            <asp:TextBox  ID="txtSmokeLong" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>
  
                   
                   </div>
                    <br />
                    <div class="row">
                        

                        <div class="col-md-2">
                             <label class="control-label">Anything Else</label>
                             
                            <asp:TextBox  ID="txtAnything" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>

                        <div class="col-md-5">
                             <label class="control-label">More Info</label>
                             
                            <asp:TextBox  ID="txtAnythingWrite" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>
                        
                        <div class="col-md-3">
                             <label class="control-label">Name of Parent/Guardian</label>
                             
                            <asp:TextBox  ID="txtParentGuardian" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
                        </div>

                         <div class="col-md-2">
                             <label class="control-label">Acceptance Date</label>
                             
                            <asp:textbox ID="txtRegDate" class="form-control" runat="server" ReadOnly="true" ></asp:textbox>
                        </div>
  
                   
                   </div>

                    <div class="row">
                        <div class="col-md-3">
                              <label class="control-label">Membership Type</label>
                             
                            <asp:textbox ID="TxtMemberType" class="form-control" runat="server" ReadOnly="true" ></asp:textbox>
                       
                        </div>

                         <div class="col-md-2">
                              <label class="control-label">Status</label>
                             
                            <asp:textbox ID="txtStatus" class="form-control" runat="server" ReadOnly="true"  ></asp:textbox>
                       
                        </div>

                        <div class="col-md-4">
                              <label class="control-label">Password</label>
                             
                            <asp:textbox ID="txtPassword" class="form-control" runat="server" ReadOnly="true"  ></asp:textbox>
                       
                        </div>
                    </div>

                   <br />
                    <asp:TextBox  ID="ID" class="form-control" runat="server" Visible="false" ></asp:TextBox>
                     
                 <asp:Button ID="btnAdd" runat="server" Text="Edit" class="btn btn-primary" OnCommand="btnAdd_Command" CommandName="Edit" /> &nbsp; &nbsp;
                 <asp:Button ID="btnReject" runat="server" Text="Delete" class="btn btn-danger offset-6" OnCommand="btnAdd_Command" CommandName="Delete"  />
                 <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-btn-outline-secondary col-md-offset-6" OnClick="btnCancel_Click" />
                    
                    <div class="clearfix"></div>
                
                </div>
              </div>
            </div>
            <!--<div class="col-md-4">
              <div class="card card-profile">
                <div class="card-avatar">
                  <a href="#pablo">
                    <img class="img" src="Dashboard/assets/img/faces/marc.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="card-category text-gray">CEO / Co-Founder</h6>
                  <h4 class="card-title">Alec Thompson</h4>
                  <p class="card-description">
                    Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is...
                  </p>
                  <a href="#pablo" class="btn btn-primary btn-round">Follow</a>
                </div>
              </div>
            </div>-->
          </div>
        </div>
      </div>
      
    </div>
  </div>

  <!--   Core JS Files   -->
  <script src="Dashboard/assets/js/core/jquery.min.js"></script>
  <script src="Dashboard/assets/js/core/popper.min.js"></script>
  <script src="Dashboard/assets/js/core/bootstrap-material-design.min.js"></script>
  <script src="Dashboard/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Plugin for the momentJs  -->
  <script src="Dashboard/assets/js/plugins/moment.min.js"></script>
  <!--  Plugin for Sweet Alert -->
  <script src="Dashboard/assets/js/plugins/sweetalert2.js"></script>
  <!-- Forms Validations Plugin -->
  <script src="Dashboard/assets/js/plugins/jquery.validate.min.js"></script>
  <!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
  <script src="Dashboard/assets/js/plugins/jquery.bootstrap-wizard.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="Dashboard/assets/js/plugins/bootstrap-selectpicker.js"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="Dashboard/assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
  <!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
  <script src="Dashboard/assets/js/plugins/jquery.dataTables.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="Dashboard/assets/js/plugins/bootstrap-tagsinput.js"></script>
  <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
  <script src="Dashboard/assets/js/plugins/jasny-bootstrap.min.js"></script>
  <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
  <script src="Dashboard/assets/js/plugins/fullcalendar.min.js"></script>
  <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
  <script src="Dashboard/assets/js/plugins/jquery-jvectormap.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="Dashboard/assets/js/plugins/nouislider.min.js"></script>
  <!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
  <!-- Library for adding dinamically elements -->
  <script src="Dashboard/assets/js/plugins/arrive.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chartist JS -->
  <script src="Dashboard/assets/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="Dashboard/assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="Dashboard/assets/js/material-dashboard.js?v=2.1.1" type="text/javascript"></script>
  <!-- Material Dashboard DEMO methods, don't include it in your project! -->
  <script src="Dashboard/assets/demo/demo.js"></script>
  <script>
      $(document).ready(function () {
          $().ready(function () {
              $sidebar = $('.sidebar');

              $sidebar_img_container = $sidebar.find('.sidebar-background');

              $full_page = $('.full-page');

              $sidebar_responsive = $('body > .navbar-collapse');

              window_width = $(window).width();

              fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

              if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
                  if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
                      $('.fixed-plugin .dropdown').addClass('open');
                  }

              }

              $('.fixed-plugin a').click(function (event) {
                  // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
                  if ($(this).hasClass('switch-trigger')) {
                      if (event.stopPropagation) {
                          event.stopPropagation();
                      } else if (window.event) {
                          window.event.cancelBubble = true;
                      }
                  }
              });

              $('.fixed-plugin .active-color span').click(function () {
                  $full_page_background = $('.full-page-background');

                  $(this).siblings().removeClass('active');
                  $(this).addClass('active');

                  var new_color = $(this).data('color');

                  if ($sidebar.length != 0) {
                      $sidebar.attr('data-color', new_color);
                  }

                  if ($full_page.length != 0) {
                      $full_page.attr('filter-color', new_color);
                  }

                  if ($sidebar_responsive.length != 0) {
                      $sidebar_responsive.attr('data-color', new_color);
                  }
              });

              $('.fixed-plugin .background-color .badge').click(function () {
                  $(this).siblings().removeClass('active');
                  $(this).addClass('active');

                  var new_color = $(this).data('background-color');

                  if ($sidebar.length != 0) {
                      $sidebar.attr('data-background-color', new_color);
                  }
              });

              $('.fixed-plugin .img-holder').click(function () {
                  $full_page_background = $('.full-page-background');

                  $(this).parent('li').siblings().removeClass('active');
                  $(this).parent('li').addClass('active');


                  var new_image = $(this).find("img").attr('src');

                  if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                      $sidebar_img_container.fadeOut('fast', function () {
                          $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                          $sidebar_img_container.fadeIn('fast');
                      });
                  }

                  if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                      var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                      $full_page_background.fadeOut('fast', function () {
                          $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                          $full_page_background.fadeIn('fast');
                      });
                  }

                  if ($('.switch-sidebar-image input:checked').length == 0) {
                      var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
                      var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                      $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                      $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                  }

                  if ($sidebar_responsive.length != 0) {
                      $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
                  }
              });

              $('.switch-sidebar-image input').change(function () {
                  $full_page_background = $('.full-page-background');

                  $input = $(this);

                  if ($input.is(':checked')) {
                      if ($sidebar_img_container.length != 0) {
                          $sidebar_img_container.fadeIn('fast');
                          $sidebar.attr('data-image', '#');
                      }

                      if ($full_page_background.length != 0) {
                          $full_page_background.fadeIn('fast');
                          $full_page.attr('data-image', '#');
                      }

                      background_image = true;
                  } else {
                      if ($sidebar_img_container.length != 0) {
                          $sidebar.removeAttr('data-image');
                          $sidebar_img_container.fadeOut('fast');
                      }

                      if ($full_page_background.length != 0) {
                          $full_page.removeAttr('data-image', '#');
                          $full_page_background.fadeOut('fast');
                      }

                      background_image = false;
                  }
              });

              $('.switch-sidebar-mini input').change(function () {
                  $body = $('body');

                  $input = $(this);

                  if (md.misc.sidebar_mini_active == true) {
                      $('body').removeClass('sidebar-mini');
                      md.misc.sidebar_mini_active = false;

                      $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

                  } else {

                      $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

                      setTimeout(function () {
                          $('body').addClass('sidebar-mini');

                          md.misc.sidebar_mini_active = true;
                      }, 300);
                  }

                  // we simulate the window Resize so the charts will get updated in realtime.
                  var simulateWindowResize = setInterval(function () {
                      window.dispatchEvent(new Event('resize'));
                  }, 180);

                  // we stop the simulation of Window Resize after the animations are completed
                  setTimeout(function () {
                      clearInterval(simulateWindowResize);
                  }, 1000);

              });
          });
      });
  </script>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="modal" id="ImgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                         <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                           
                        </div>
                         <div class="modal-body">
 <asp:Label CssClass="modal-title" runat="server" id="myModalLabel" align="center" ></asp:Label>
                        <asp:Image id="img1" runat="server" CssClass="img-fluid" />
                        </div>
                        </div>
                    </div>
        </div>



    <div class="modal" id="DeleteModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                         <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                           
                        </div>
                         <div class="modal-body">
                             <h4 style="color:red"> <strong> Are you sure you want to Delete?</strong></h4>
 <asp:Label CssClass="modal-title" runat="server" id="Label1" align="center" ></asp:Label>
                        <asp:Image id="Image1" runat="server" CssClass="img-fluid" />
                        </div>
                        <div> &nbsp; &nbsp;
                            <asp:Button runat="server" CssClass="btn btn-danger" Text="Delete" OnClick="Delete_Click" />
                            <asp:Button runat="server" CssClass="btn btn-btn-outline-secondary" Text="Cancel" OnClick="CancelDelete_Click"  />
                       
                           </div>
                        </div>
                    </div>
        </div>

</asp:Content>
