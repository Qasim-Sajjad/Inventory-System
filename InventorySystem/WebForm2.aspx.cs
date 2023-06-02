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
    public partial class WebForm2 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CheckStocks())
            {
                Response.Write("<script>alert('Some Products Are Low On Stock Either Add Stock or Make it Unavailable')</script>");
            }

        }

        bool CheckStocks()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from Product_with_details where Stock < 10", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                conn.Close();
                if (dt.Rows.Count >= 1) return true;
                else return false;

            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + e.Message + "');</script>");
                return false;

            }
        }
    }
}