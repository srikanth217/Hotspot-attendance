<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>

<!DOCTYPE html>
<script runat="server">

  protected void Button2_Click(object sender, EventArgs e)
  {
   try
{
    new SmtpClient
    {
        Host = "Smtp.Gmail.com",
        Port = 587,
        EnableSsl = true,
        Timeout = 10000,
        DeliveryMethod = SmtpDeliveryMethod.Network,
        UseDefaultCredentials = false,
        Credentials = new NetworkCredential("srikanth.kkf9@gmail.com", "a1a2a3a4a5a6a7a8")
    }.Send(new MailMessage {From = new MailAddress("saikalyan2703@gmail.com", "UNCC Management"), To = {"syeturu1@uncc.edu"}, Subject = "Password in database", Body = "Password is: ", BodyEncoding = Encoding.UTF8});
    
}
catch (Exception ex)
{
    
}
  }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style type="text/css">
      #login_container {
        margin-left:150px;
        margin-top:80px;
        height:570px;
       outline-style: solid;
       outline-color: black;
       outline-width:1px;
      }

      #form1 {
        margin-top:40px;
        margin-left:35px;
      }
    </style>

    <script>
      $(document).ready(function () {

        $("#show_password").hide();

        $("#password_box").click(function () {
          $("#show_password").slideToggle("fast");
          $("#show_password").val($("#TextBoxPassword").val());
        });

        $("#TextBoxPassword").on("input",function () {
          $("#show_password").val($("#TextBoxPassword").val());
        })
      })
    </script>
</head>
<body>
    <div class="container">

     <div class="row" id="login_container">

       <div style="height:70px;background-color:#006400">
         <p style="color:white;font-size:30px;padding-left:350px;padding-top:15px;font-family:serif">Web Authentication</p>
       </div>

        <div class="col-md-6">
          <img class="img-rounded" style="margin-left:-15px" src="Images/uncc_entrance.jpg" alt="UNCC Entrance" width="490px" height="499px"> 
        </div>

      <div class="col-md-5" id="x">
          <form id="form1" runat="server">
        
            <div class="form-group">
              <label for="TextBoxUserName">NinerNet User Name:</label>
              <asp:TextBox class="form-control" ID="TextBoxUserName" runat="server"></asp:TextBox>
            </div>

             <div class="form-group">
              <label for="TextBoxPassword">Password:</label>
               <span class="col-md-offset-5">
                 <a id="password_box"> Toggle Password</a>
               </span>
               <asp:TextBox class="form-control" ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
               <input type="text" class="form-control" rows="1" id="show_password" disabled/>
            </div>

            <div class="col-md-offset-5">
              <asp:Button ID="Button1" class="btn btn-default" runat="server" OnClick="Button1_Click" Text="Log In" />
            </div><br>

            <div class="col-md-offset-4">
              <asp:Button ID="Button2" class="btn btn-default" runat="server" OnClick="Button2_Click" Text="Forgot your password?" />
            </div>
         

           <asp:Label ID="Label3" runat="server" Text="*Please enter valid credentials" Visible="False"></asp:Label>
        </form>
      </div>
     </div>

    </div>
</body>
</html>
