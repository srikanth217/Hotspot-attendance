using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class course : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Faculty_uname"]!=null)
            {
                String faculty_uname = Session["Faculty_uname"].ToString();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["as"].ConnectionString);
                SqlCommand cmd = new SqlCommand();  
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_fetchFacultyName";
                cmd.Parameters.AddWithValue("@user_name", faculty_uname);
                cmd.Connection = con;
                con.Open();
                Label1.Text = "Welcome "+(String)cmd.ExecuteScalar();
                SqlCommand cmd2 = new SqlCommand("sp_fetchcourse",con);
                cmd2.Parameters.AddWithValue("@faculty_uname", faculty_uname);
                cmd2.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd2;
                DataSet ds = new DataSet();
                da.Fill(ds);
                foreach(DataRow dr in ds.Tables[0].Rows)
                {
                    Button button = new Button();
          button.Text= dr["CourseName"].ToString();
                    button.Click += new EventHandler(button_Click);
                    button.Attributes["CourseID"] = dr["CourseID"].ToString();
                    button.Attributes["SubID"] = dr["SubID"].ToString();
          
                    Panel2.Controls.Add(button);
                    
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        void button_Click(object sender, System.EventArgs e)
        {
            Button button = sender as Button;
            Session["course_id"] = button.Attributes["CourseID"];
            Session["sub_id"] = button.Attributes["SubID"];
            Response.Redirect("display_course.aspx");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}