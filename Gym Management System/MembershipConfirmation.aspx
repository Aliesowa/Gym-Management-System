<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MembershipConfirmation.aspx.cs" Inherits="Gym_Management_System.MembershipForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Membership Form</title>
     <meta charset="utf-8" />
    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" /> 
   <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  
  
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
    </style>
</head>
<body>
      <div class="container-fluid px-1 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
         <div class="text-danger"></div>
            <div class="card">
    <form id="form1" runat="server">
                   <div>

                   <h3>Yans GYM</h3>
                     <h4>Membership Form</h4>
                      <span class="login100-form-logo">
                        <img src="LoginStyle/images/130830622_106550114655462_565542333308303623_n.jpg" style="border-radius:25px; width: 134px;" height="100"  />
					</span>
        </div> 
        <hr />
        <div>
            <h3> Your Membership Application has been Submitted Successfully</h3>
            <h5>We will respond to you soon via email</h5>
        </div>
       
      

    </form>
                 </div>
            </div>
        </div>

          </div>
</body>
</html>
