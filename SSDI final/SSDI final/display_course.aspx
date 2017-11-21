<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="display_course.aspx.cs" Inherits="WebApplication1.display_course" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Course Display</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
      
      tr:nth-child(even){
        background-color:floralwhite;
        color:black
      }
      tr:nth-child(odd){
        background-color:darkgray;
        color:white
      }
      tr:nth-child(1){
         background-color:#006400;
        color:white;
        font-family:serif;
      }

      #student_search, #date_search {
        border:1px solid black;
        border-radius:10px;
        padding:10px;
      }
      #label{
        margin-top:70px;
        background-color:#006400;
        color:white;
        font-family:serif;
        font-size:30px;
      }

       .btn{
        border-radius: 7px;
        border: solid 1px #fff;
        font-family: Arial,Helvetica,sans-serif;
        color: #ffffff;
        background: #00703c;
        padding: 10px 20px 10px 20px;
        text-decoration: none;
      }
      
    </style>
</head>
<body>
    <div class="container">

        <div class="row">
          <div id="label" class="col-md-offset-3 col-md-6 alert alert-success">
             <div class="col-md-offset-2">
                 <asp:Label ID="Label1" runat="server"></asp:Label>
             </div>
          </div>
        </div>

        <div class="row" style="margin-top:20px">

          <form id="form1" runat="server">
             
              <div class="col-md-4" id="student_search">
                 <div class="form-group">
                  <label for="TextBox1">Student ID:</label>
                   <asp:TextBox class="form-control" ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True" ></asp:TextBox>
                </div>


                <div class="form-group">
                  <label for="TextBox2">Student Name:</label>
                   <asp:TextBox class="form-control" ID="TextBox2" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="col-md-offset-1 col-md-1">
                <asp:Button class="btn btn-default" ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
            </div>

            <div class="col-md-offset-1 col-md-4" id="date_search">
                <div class="form-group">
                  <label for="TextBox3">Date:</label>
                    <asp:TextBox ID="TextBox3" runat="server" type="date"></asp:TextBox>
                </div>
            </div>

           <div style="margin-top:70px">
              <asp:GridView class="table table-hover" ID="GridView1" runat="server"></asp:GridView>
           </div>

           </form>
            
        </div>
    </div>
</body>
</html>
