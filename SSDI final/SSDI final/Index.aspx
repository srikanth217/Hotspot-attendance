<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication1.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Choose Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
      body{
        background-image:url("Images/uncc.jpg");
        background-position: center;
        background-repeat: no-repeat;
        height: 100%; 
      }
      #login_choose {
        margin-left:120px;
        margin-top:120px;
      }
      strong {
        font-size:35px;
        font-family:serif;
        color:white;
      }
      .btn{
        border-radius: 7px;
    border: solid 1px #fff;
    font-family: Arial,Helvetica,sans-serif;
    color: #ffffff;
    background: #00703c;
    padding: 10px 20px 10px 20px;
    text-decoration: none;
    margin-top: 20px;
      }
    </style>
</head>
<body>

    <div class="container">

    <div class="row">
        <div class=" col-md-10" id="login_choose">
             <div class="col-md-offset-3">
                 <strong>Welcome to UNCC attendance system</strong>
               </div>
              
             <div class="col-md-offset-5">
                 <form id="form1" runat="server">
                    <div>
                        <br />
                        <br />
                        <asp:Button class="btn btn-default" ID="Button1" runat="server" OnClick="Button1_Click" Text="Click here if Student" />
                        <br />
                        <br />
                        <asp:Button class="btn btn-default" ID="Button2" runat="server" OnClick="Button2_Click" Text="Click here if Faculty" />
                    </div>
                </form>
             </div>
        </div>
      </div>
    </div>
</body>
</html>
