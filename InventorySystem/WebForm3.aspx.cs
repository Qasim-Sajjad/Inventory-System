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
    public partial class WebForm3 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Add Bundle
        protected void Button1_Click(object sender, EventArgs e)
        {
            List<int> selectedProductIDs = new List<int>();
            List<int> SelectedQuantities = new List<int>();
            int TotalItems = 0;
            foreach (GridViewRow row in productGridView.Rows)
            {
                CheckBox ProductCheckBox = (CheckBox)row.FindControl("productCheckBox");
                TextBox Quantity = (TextBox)row.FindControl("quantityTextBox");

                //Add Checked Products With There Quantites in A List.
                if (ProductCheckBox.Checked)
                {
                    selectedProductIDs.Add(Convert.ToInt32(productGridView.DataKeys[row.RowIndex]["PID"])); //--!
                    SelectedQuantities.Add(Convert.ToInt32(Quantity.Text));
                    TotalItems = TotalItems + Convert.ToInt32(Quantity.Text);
                }
            }
            // Check Quantites Are Valid.
            string BundleName = txtBundleName.Text.Trim();


            if (CheckQuantites(SelectedQuantities))
            {
                if (selectedProductIDs.Count > 0 && BundleName.Length > 0)
                {
                    //Now Check If this Bundles Already Exist While Adding
                    if (!CheckBundleExist(BundleName))
                    {
                        for(int i=0; i<selectedProductIDs.Count; i++)
                        {
                            int productID = selectedProductIDs[i];
                            int quantity = SelectedQuantities[i];

                            InsertBundleItem(productID,quantity,BundleName,TotalItems);
                        }
                        Response.Write("<script>alert('Bundle is created Succussfully')</script>");
                    }
                    else Response.Write("<script>alert('This Bundle Already Exist..')</script>");
                }
                else Response.Write("<script>alert('Select at least One Product and Correct bundle Name')</script>");
            }
            else
            {
                Response.Write("<script>alert('One or More Quantity Values of Selected Items Are Invalid')</script>");
            }
        }
        void InsertBundleItem(int PID,int Quantity,string BName,int Items)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into Bundles(BName,ProductID,Quantity,Items," +
                                                "BundlePrice) values (@BName,@ProductID,@Quantity,@Items,@Price)", conn);

                cmd.Parameters.AddWithValue("@BName",BName);
                cmd.Parameters.AddWithValue("ProductID", PID);
                cmd.Parameters.AddWithValue("@Quantity", Quantity);
                cmd.Parameters.AddWithValue("@Items", Items);
                cmd.Parameters.AddWithValue("@Price", txtBundlePrice.Text.Trim());

                cmd.ExecuteNonQuery();

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool CheckBundleExist(string BundleName)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from Bundles where BName = '" + BundleName + "'", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0) return true;
                else return false;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        bool CheckQuantites(List<int> Quantites)
        {
            for(int i=0; i<Quantites.Count; i++)
            {
                if (Quantites[i] <= 0)
                {
                    return false;
                }
            }
            return true;
        }
    }

}