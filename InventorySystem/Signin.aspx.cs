using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventorySystem
{
    public partial class Signin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Signin_Click(object sender, EventArgs e) {
            if(CheckAdmin())
            {
                Response.Write("<script>alert('Admin Signin Successsful');</script>");
                Response.Redirect("WebForm2.aspx");
            }
            else
            {
                Response.Write("<script>alert('UnSuccessful Sigin');</script>");
            }
        }

        bool CheckAdmin()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if(conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from Admin_TB where admin_id='"+TextBox1.Text.Trim()+"' AND admin_password='"+TextBox2.Text.Trim()+"';",conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count == 1) return true;
                else return false;

            }
            catch(Exception e)
            {
                Response.Write("<script>alert('" + e.Message + "');</script>");
                return false;

            }
        
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}