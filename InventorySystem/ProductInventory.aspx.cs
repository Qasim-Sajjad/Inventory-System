using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

using System.Web.UI.WebControls;
using System.IO;

namespace InventorySystem
{
    public partial class ProductInventory : System.Web.UI.Page
    {
          string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
            
        }

        //Add Button Of Products
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckProductExists())
            {
                Response.Write("<script>alert('A Product With Same ID OR Product Name Exists Exists.');</script>");
            }
            else if (CheckTextBox()) Response.Write("<script>alert('Please Provide All Credientials For Adding A Product');</script>");
            else
            {
                AddProduct();
            }

        }
        void AddProduct() {

            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into Product_with_details(PID,PName,Price,Stock,Availability,Weight,Dateadded,Volume,Fragile,Product_img_link,Description) " +
                                                "values(@PID, @PName, @Price, @Stock, @Availability, @Weight, @Dateadded, @Volume, @Fragile, @Product_img_link,@Description)", conn);

                //Insert Product ID in Sales AS Well..
                SqlCommand cmd1 = new SqlCommand("insert into Sales(ID,UnitsSold,Revenue,NetProfit) values(@PID,0,0,0)", conn);
                cmd.Parameters.AddWithValue("@PID", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@PName", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Price", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Stock", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Availability", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Weight", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@Dateadded", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@Volume", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@Fragile", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Description", TextBox6.Text.Trim());

                cmd1.Parameters.AddWithValue("@PID", TextBox1.Text.Trim());
                // For File
                if (fileUploadControl.HasFile)
                {
                    string filepath = Path.GetFileName(fileUploadControl.FileName);
                    fileUploadControl.SaveAs(Server.MapPath("~/Images/" + filepath));

                    // Set the src attribute of the <img> tag to the URL of the uploaded image file
                    string FileName = "~/Images/" + filepath;

                    cmd.Parameters.AddWithValue("@Product_img_link", FileName);
                    cmd.ExecuteNonQuery();
                    cmd1.ExecuteNonQuery();
                    Response.Write("<script>alert('Product Added Successfully');</script>");
                }
                else if (uploadedImage.Src != "")
                {
                    cmd.Parameters.AddWithValue("@Product_img_link", uploadedImage.Src);
                    cmd.ExecuteNonQuery();
                    cmd1.ExecuteNonQuery();
                    Response.Write("<script>alert('Product Added Successfully');</script>");
                }
                else
                    Response.Write("<script>alert('PLease Provide a Image Link For Upload');</script>");

                GridView1.DataBind();

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        bool CheckTextBox()
        {
            if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox4.Text == "" || TextBox5.Text == "" || TextBox8.Text == "" || TextBox12.Text == "" || TextBox13.Text == "")
                return true;
            else return false;
        }
        bool CheckProductExists()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from Product_with_details where PID = '"+TextBox1.Text.Trim()+ "' OR PName ='"+TextBox2.Text.Trim()+"'", conn);
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

//-------------------------------------------------------------------
        //Update Products
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheckProductExists())
            {
                UpdateProduct();
            }
            else
            {
                Response.Write("<script>alert('A Product With This ID Does Not Exist.');</script>");
            }
        }
        void UpdateProduct()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("update Product_with_details set PName = @PName, Price = @Price, Stock = @Stock, Availability = @Availability, " +
                                                "Weight = @Weight, Dateadded = @Dateadded, Volume = @Volume, Fragile = @Fragile, " +
                                                "Product_img_link = @Product_img_link,Description=@Description where PID = @PID", conn);

                cmd.Parameters.AddWithValue("@PID", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@PName", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Price", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Stock", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Availability", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Weight", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@Dateadded", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@Volume", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@Fragile", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Description", TextBox6.Text.Trim());

                // For File
                if (fileUploadControl.HasFile)
                {
                    string filepath = Path.GetFileName(fileUploadControl.FileName);
                    fileUploadControl.SaveAs(Server.MapPath("~/Images/" + filepath));

                    // Set the src attribute of the <img> tag to the URL of the uploaded image file
                    string FileName = "~/Images/" + filepath;

                    cmd.Parameters.AddWithValue("@Product_img_link", FileName);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Product Updated Successfully');</script>");
                }
                else if (uploadedImage.Src != "")
                {
                    cmd.Parameters.AddWithValue("@Product_img_link", uploadedImage.Src);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Product Updated Successfully');</script>");
                }
                else
                    Response.Write("<script>alert('PLease Provide a Image Link For Upload');</script>");

                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
//----------------------------------------------------------------------

        //Delete Products

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CheckProductExists())
            {
                DeleteProducts();
            }
            else
            {
                Response.Write("<script>alert('A Product With This ID Does Not Exist.');</script>");
            }

        }
        void DeleteProducts()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("delete from Product_with_details " +
                                                "where PID = @PID", conn);

                cmd.Parameters.AddWithValue("@PID", TextBox1.Text.Trim());
                cmd.ExecuteNonQuery();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

//-------------------------------------------------------------------------

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void FileUpload1_Load(object sender, EventArgs e)
        { 

        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
                if (fileUploadControl.HasFile)
                {
                    try
                    {
                        string fileName = Path.GetFileName(fileUploadControl.FileName);
                        fileUploadControl.SaveAs(Server.MapPath("~/Images/" + fileName));
                        //   statusLabel.Text = "Upload status: File uploaded!";

                        // Set the src attribute of the <img> tag to the URL of the uploaded image file
                        uploadedImage.Src = "~/Images/" + fileName;
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                        //  statusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                    }
                }
                else
                {
                  //  statusLabel.Text = "Upload status: Please select a file to upload.";
                }
        }

        //Load Data for Update
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if(CheckID() && CheckProductExists())
            {
                try
                {
                    SqlConnection conn = new SqlConnection(strcon);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    SqlCommand cmd = new SqlCommand("select * from Product_with_details where PID='" + TextBox1.Text.Trim() + "'", conn);
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);


                    foreach(DataRow dr in dt.Rows)
                    {
                        TextBox2.Text = dr["PName"].ToString();  //Product Name Column for Each Row
                        TextBox5.Text = dr["Price"].ToString();  //Product Price Column for Each Row
                        TextBox4.Text = dr["Stock"].ToString();  //Product Stock column For Each Row
                        DropDownList2.SelectedItem.Value = dr["Availability"].ToString();  //  Product Availabilty For Each Row
                        TextBox8.Text = dr["Weight"].ToString();   //Weight
                        TextBox12.Text = dr["Dateadded"].ToString();  //Date
                        TextBox13.Text = dr["Volume"].ToString();     //Volume
                        DropDownList1.SelectedItem.Value = dr["Fragile"].ToString();  //Fragile
                        TextBox6.Text = dr["Description"].ToString();   //Description
                        //Read File path And Name From ImageUploadSRC


                        uploadedImage.Src = dr["Product_img_link"].ToString();

                    }

                    conn.Close();
                    
                }
                catch(Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('No Product With with Given ID Exist');</script>");
            }
        }

        bool CheckID()
        {
            if(TextBox1.Text != "") return true;
            return false;
        }


    } 


}
