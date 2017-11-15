using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Student_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["as"].ConnectionString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_fetchcourses";
                cmd.Connection = con;
                con.Open();
                DropDownList1.DataSource = cmd.ExecuteReader();
                DropDownList1.DataTextField = "CourseName";
                DropDownList1.DataValueField = "course_id";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Select Course", "NA"));
                con.Close();
                DropDownList2.Items.Insert(0, new ListItem("Select Professor", "NA"));
            }
            Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
            Response.Cache.SetValidUntilExpires(false);
            Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String course_details;
            course_details = DropDownList1.SelectedValue.ToString();
            String[] course = course_details.Split(',');
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["as"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_fetchfaculty";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@course_id", course[0]);
            cmd.Parameters.AddWithValue("@sub_id", course[1]);
            con.Open();
            DropDownList2.DataSource = cmd.ExecuteReader();
            DropDownList2.DataTextField = "FName";
            DropDownList2.DataValueField = "FacultyID";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, new ListItem("Select Professor", "NA"));
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String course_details,professor_id,student_id;
            DateTime date;
            date = DateTime.Now;
            course_details = DropDownList1.SelectedValue.ToString();
            String[] course = course_details.Split(',');
            professor_id = DropDownList2.SelectedValue.ToString();
            student_id = TextBox1.Text.ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["as"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_registerAttendence";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@student_id", student_id);
            cmd.Parameters.AddWithValue("@course_id", course[0]);
            cmd.Parameters.AddWithValue("@sub_id", course[1]);
            cmd.Parameters.AddWithValue("@professor_id", professor_id);
            cmd.Parameters.AddWithValue("@date", date);
            con.Open();
            int n=cmd.ExecuteNonQuery();
            if (n>0)
            {
                Response.Redirect("ThankYou.aspx");
            }
            con.Close();

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            string student_id = TextBox1.Text.ToString();
            SqlCommand cmd = new SqlCommand();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["as"].ConnectionString);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_fetchStudentName";
            cmd.Parameters.AddWithValue("@student_id", student_id);
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if(dr.Read())
            {
                TextBox2.Text = dr.GetValue(0).ToString();
            }
            
        }
    }
}