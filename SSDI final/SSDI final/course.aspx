<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="course.aspx.cs" Inherits="WebApplication1.course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
      strong {
        font-size:45px;
        font-family:serif;
        color:white;
      }
      .x{
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
      <div class="row" style="margin-top:10px">
        <div class="col-md-offset-4">
            
            <form id="form1" runat="server">
              <div class="col-md-offset-10">
                  <asp:Button class="btn btn-danger" ID="Button1" runat="server" OnClick="Button1_Click" Text="Logout" />
              </div>
              <div>
                 <strong><asp:Label ID="Label1" runat="server"></asp:Label></strong>
               </div>
        <div>
            <asp:Panel ID="Panel1" runat="server">
            </asp:Panel>
        </div>
               <div class="col-md-offset-1">
                  <asp:Panel ID="Panel2" runat="server"></asp:Panel>
              </div>
        
        
    </form>
        </div>
      </div>

    </div>
    
</body>
</html>
