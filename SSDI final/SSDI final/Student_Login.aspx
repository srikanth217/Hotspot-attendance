<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Login.aspx.cs" Inherits="WebApplication1.Student_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Login</title>
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
</head>
<body>
   <div class="container">

     <div class="row" id="login_container">

       <div style="height:70px;background-color:#006400">
         <p style="color:white;font-size:30px;padding-left:350px;padding-top:15px;font-family:serif">Student Authentication</p>
       </div>

        <div class="col-md-6">
          <img class="img-rounded" style="margin-left:-15px" src="Images/UNC.jpg" alt="UNCC Entrance" width="490px" height="499px"> 
        </div>

      <div class="col-md-5">
          <form id="form1" runat="server">
                <div class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
                    </asp:DropDownList>
                </div><br>

                <div class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                    </asp:DropDownList>
                </div><br>

                <div class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                  <asp:TextBox class="form-control" ID="TextBox1"  runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True" placeholder="Enter student ID"></asp:TextBox>
                </div><br>

                <div class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                  <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="Enter student name"></asp:TextBox>
                </div><br>

                <asp:Button class="col-md-offset-6 btn btn-success" ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click"/>
              </form>
      </div>
     </div>

    </div>

    
</body>
</html>
