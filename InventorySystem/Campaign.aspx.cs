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
    public partial class Campaign : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //GO Button/load data
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if (CheckPID())
            {
                FillOrgPrice();
                if(CheckProductExist())
                {
                    FetchCamData();
                }
            }
            else
            {
                Response.Write("<script>alert('A Product with This ID does Not Exist.');</script>");
            }

        }
        void FetchCamData()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if(conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("select Cam_Name,Cam_Price,StartDate,EndDate from Campaign Where CID='" + ProductID.Text.Trim() + "'", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                foreach(DataRow dr in dt.Rows)
                {
                    TextBox2.Text = dr["Cam_Name"].ToString();
                    TextBox9.Text = dr["Cam_Price"].ToString();
                    TextBox10.Text = dr["StartDate"].ToString();
                    TextBox11.Text = dr["EndDate"].ToString();
                }
                conn.Close();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void FillOrgPrice()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("Select Price from Product_with_details where PID='" + ProductID.Text.Trim() + "'", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                foreach (DataRow dr in dt.Rows)
                {
                    Org_Price.Text = dr["Price"].ToString();
                }
                conn.Close();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" +ex.Message+ "');</script>");
            }
        }

        //Add Campaign
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!CheckPID())
            {
                Response.Write("<script>alert('Please Enter A Valid Product ID');</script>");
            }
            else {
                if (CheckProductExist())
                {
                    Response.Write("<script>alert('This Product Already Exist In A Campaign.');</script>");
                }
                else if (CheckTextBox()) Response.Write("<script>alert('Please Provide All Credientials For Adding A Product in Campaign');</script>");
                else
                {
                    AddCampaign();
                }

            }

        }
        void AddCampaign()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into Campaign(CID,Cam_Name,Cam_Price,StartDate,EndDate) " +
                                                "values(@CID, @Cam_Name, @Price, @StartDate, @EndDate)", conn);


                // Disable Availabity
                SqlCommand cmd2 = new SqlCommand("Update Product_with_details Set Availability = 'No' Where PID=@CID", conn);
                //Insert Product ID in Sales AS Well..
                cmd.Parameters.AddWithValue("@CID", ProductID.Text.Trim());
                cmd.Parameters.AddWithValue("@Cam_Name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Price", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@StartDate", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@EndDate", TextBox11.Text.Trim());

                cmd2.Parameters.AddWithValue("@CID", ProductID.Text.Trim());
                cmd.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                GridView1.DataBind();
                TextBox2.Text = "";
                TextBox9.Text = "";
                TextBox10.Text = "";
                TextBox11.Text = "";
                Response.Write("<script>alert('The Product Is Added In The Campaign Successfully');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool CheckProductExist()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from Campaign where CID = '" + ProductID.Text.Trim() + "'", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count >= 1) return true;
                else return false;

            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + e.Message + "');</script>");
                return false;

            }
        }
        bool CheckPID()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from Product_with_details where PID = '" + ProductID.Text.Trim() + "'", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count >= 1) return true;
                else return false;

            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + e.Message + "');</script>");
                return false;

            }
        }
        bool CheckTextBox()
        {
            if (ProductID.Text == "" || TextBox2.Text == "" || TextBox9.Text == "" || TextBox10.Text == "" || TextBox11.Text == "")
                return true;
            else return false;
        }


        //Delete Campaign
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CheckProductExist())
            {
                DeleteProducts();
            }
            else
            {
                Response.Write("<script>alert('Please Provide A Valid Product ID Along Campaign.');</script>");
            }
        }
        void DeleteProducts()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if(conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("Delete From Campaign where CID= @CID", conn);
                cmd.Parameters.AddWithValue("@CID", ProductID.Text.Trim());
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Product is Deleted Succussfully from Campaign. :D');</script>");
                GridView1.DataBind();
                conn.Close();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message+ "')</script>");
            }
        }

    }
}