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
    public partial class display_course : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Faculty_uname"] != null)
            {
                if (!IsPostBack)
                {
                    String course_id = Session["course_id"].ToString();
                    String sub_id = Session["sub_id"].ToString();
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["as"].ConnectionString);
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_fetchCourseName";
                    cmd.Parameters.AddWithValue("@course_id", course_id);
                    cmd.Parameters.AddWithValue("@sub_id", sub_id);
                    cmd.Connection = con;
                    con.Open();
                    Label1.Text = (String)cmd.ExecuteScalar();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String course_id = Session["course_id"].ToString();
            String sub_id = Session["sub_id"].ToString();
            String student_id = TextBox1.Text.ToString();
            String faculty_uname = Session["Faculty_uname"].ToString();
            String date;
            SqlDataAdapter adapter;
            DataSet ds = new DataSet();
            date = TextBox3.Text;
            if(TextBox3.Text=="")
            {
                date = null;
            }
            if (TextBox1.Text == "")
            {
                student_id = null;
            }
            SqlCommand cmd = new SqlCommand();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["as"].ConnectionString);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_fetchStudentAttendence";
            cmd.Parameters.AddWithValue("@course_id", course_id);
            cmd.Parameters.AddWithValue("@sub_id", sub_id);
            cmd.Parameters.AddWithValue("@faculty_uname", faculty_uname);
            cmd.Parameters.AddWithValue("@date", date ?? (object)DBNull.Value);
            cmd.Parameters.AddWithValue("@student_id", student_id ?? (object)DBNull.Value);
            cmd.Connection = con;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(ds);
            con.Close();
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            GridView1.Visible = true;
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
                if (dr.Read())
                {
                    TextBox2.Text = dr.GetValue(0).ToString();
                }
                else
                {
                    TextBox2.Text = null;
                }

            }
        }
    }
