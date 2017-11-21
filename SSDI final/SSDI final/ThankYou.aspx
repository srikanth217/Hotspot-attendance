<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="WebApplication1.ThankYou" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thank you</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        #Label1{
          font-size:35px;
          font-family:serif;
          font-style:bold;
          color:white
        }
        #form1{
           margin-top:140px;
        }
        body{
        background-image:url("Images/uncc.jpg");
        background-position: center;
        background-repeat: no-repeat;
        height: 100%; 
      }
    </style>
    <script>
      function getRandomColor() {
        var letters = '0123456789ABCDEF';
        var color = '#';
        for (var i = 0; i < 6; i++) {
          color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
      }

      $(document).ready(function () {
        setInterval(function () {
          $(".well").css("background-color", getRandomColor());
        }, 2000);
      })
    </script>
</head>
<body>
    <div class="row">
        <div class="col-md-offset-2 col-md-8">
            <form id="form1" runat="server">
                <div class="well well-lg">
                   <div class="col-md-offset-2">
                       <asp:Label ID="Label1" runat="server"></asp:Label>
                   </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
