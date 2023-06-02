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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void productRepeater_ItemCommand(object sender,EventArgs e)
        {

        }



        protected void productRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Buy")
            {
                if (CheckLabelValue(e))
                {
                    UpdateCredientials(e);
                }
                else
                    Response.Write("<script>alert('Current Item Is Out Of Stock');</script>");
            }
            else if(e.CommandName == "BuyCam")
            {
                UpdateCredientials_Campaign(e);
            }
        }
        void UpdateCredientials_Campaign(RepeaterCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument);
            SqlConnection connection = new SqlConnection(strcon);
            connection.Open();

            string query = "UPDATE Sales SET UnitsSold = UnitsSold + 1 WHERE ID = @ProductID";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@ProductID", productId);
                command.ExecuteNonQuery();
            }

            string query1 = "UPDATE Sales SET Revenue = UnitsSold * (Select C.Cam_Price from Campaign as C where C.CID=@ProductID) WHERE ID = @ProductID";
            using (SqlCommand command1 = new SqlCommand(query1, connection))
            {
                command1.Parameters.AddWithValue("@ProductID", productId);
                command1.ExecuteNonQuery();
            }

            string query2 = "UPDATE Sales SET NetProfit=(0.40)* Revenue WHERE ID = @ProductID";
            using (SqlCommand command2 = new SqlCommand(query2, connection))
            {
                command2.Parameters.AddWithValue("@ProductID", productId);
                command2.ExecuteNonQuery();
            }

            connection.Close();
            Response.Write("<script>alert('Successfully Bought Product From Campaign');</script>");

        }
        void UpdateCredientials(RepeaterCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument);
            SqlConnection connection = new SqlConnection(strcon);
            connection.Open();

            string query = "UPDATE Sales SET UnitsSold = UnitsSold + 1 WHERE ID = @ProductID";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@ProductID", productId);
                command.ExecuteNonQuery();
            }

            string query1 = "UPDATE Sales SET Revenue = UnitsSold * (Select PD.Price from Product_with_details as PD where PD.PID=@ProductID) WHERE ID = @ProductID";
            using (SqlCommand command1 = new SqlCommand(query1, connection))
            {
                command1.Parameters.AddWithValue("@ProductID", productId);
                command1.ExecuteNonQuery();
            }

            string query2 = "UPDATE Sales SET NetProfit=(0.40)* Revenue WHERE ID = @ProductID";
            using (SqlCommand command2 = new SqlCommand(query2, connection))
            {
                command2.Parameters.AddWithValue("@ProductID", productId);
                command2.ExecuteNonQuery();
            }
            //Update Stocks
            string query3 = "UPDATE Product_with_details SET Stock=Stock-1 WHERE PID = @ProductID";
            
            using (SqlCommand command3 = new SqlCommand(query3, connection))
            {
                command3.Parameters.AddWithValue("@ProductID", productId);
                command3.ExecuteNonQuery();
            }
            Label productLabel = (Label)e.Item.FindControl("Label2");
            string productText = productLabel.Text;
            int LBL = Convert.ToInt32(productText);
            LBL--;
            productLabel.Text = Convert.ToString(LBL);
            connection.Close();
            Response.Write("<script>alert('Successfull');</script>");
        }
        bool CheckLabelValue(RepeaterCommandEventArgs e)
        {
            Label productLabel = (Label)e.Item.FindControl("Label2");
            string productText = productLabel.Text;
            int LBL = Convert.ToInt32(productText);

            if (LBL > 0)
            {
               return true;

            }
            else
            {
                return false;
            }
        }


        protected void productRepeater_ItemCommand2(object source,RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Buy")
            {
                UpdateBundleInfo(e);
            }
        }
        void UpdateBundleInfo(RepeaterCommandEventArgs e)
        {
            string BPrice = Convert.ToString(e.CommandArgument);
            SqlConnection connection = new SqlConnection(strcon);
            connection.Open();

            string query = "UPDATE Sales SET Revenue = Revenue + @BundlePrice WHERE ID = 2";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@BundlePrice", BPrice);
                command.ExecuteNonQuery();
            }

            string query1 = "UPDATE Sales SET Revenue = Revenue + @BundlePrice WHERE ID = 5";
            using (SqlCommand command = new SqlCommand(query1, connection))
            {
                command.Parameters.AddWithValue("@BundlePrice", BPrice);
                command.ExecuteNonQuery();
            }
            string query2 = "UPDATE Sales SET Revenue = Revenue + @BundlePrice WHERE ID = 6";
            using (SqlCommand command = new SqlCommand(query2, connection))
            {
                command.Parameters.AddWithValue("@BundlePrice", BPrice);
                command.ExecuteNonQuery();
            }
            Response.Write("<script>alert('Successful')</script>");
        }
        public DataTable GetProducts(object bundleName)
        {

            DataTable productsTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(strcon))
            {
                SqlCommand command = new SqlCommand("SELECT p.PName,p.Product_img_link, p.Price, b.Quantity,b.BundlePrice FROM Product_with_details as p INNER JOIN Bundles as b ON p.PID = b.ProductID WHERE b.BName = @BName ", connection);
                command.Parameters.AddWithValue("@BName", bundleName);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(productsTable);
                //if (productsTable.Rows.Count > 0) Response.Write("<script>alert('YES')</script>");
                //else Response.Write("<script>alert('NO')</script>");
                
                
            }
            return productsTable;
        }


        //Camapigns

        public DataTable GetProductsCam(object Cam_Name)
        {
            DataTable productsTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(strcon))
            {
                SqlCommand command = new SqlCommand("Select PD.PID,PD.PName,PD.Price,PD.Product_img_link,C.Cam_Name,C.Cam_Price,C.StartDate,C.EndDate from Campaign as C join Product_with_details as PD on C.CID = PD.PID where C.Cam_Name = @Cam_Name", connection);
                command.Parameters.AddWithValue("@Cam_Name", Cam_Name);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(productsTable);
            }
            return productsTable;
        }
    }
}