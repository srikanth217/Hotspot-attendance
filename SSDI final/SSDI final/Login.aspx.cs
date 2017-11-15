using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String password, password_match,user_name;
            password = TextBoxPassword.Text.ToString();
            user_name = TextBoxUserName.Text.ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["as"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_fetchpassword";
            cmd.Parameters.AddWithValue("@user_name",user_name);
            cmd.Connection = con;
            con.Open();
            password_match = (string)cmd.ExecuteScalar();
            if (password == password_match)
                {
                    Session["Faculty_uname"]=user_name;
                    Response.Redirect("Course.aspx");
                }
             else
                    Label3.Visible = true;
        }

  }
}