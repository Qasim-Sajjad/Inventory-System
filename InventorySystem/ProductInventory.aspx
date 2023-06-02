<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductInventory.aspx.cs" Inherits="InventorySystem.ProductInventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <!-- basic -->
    
        
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1" />
    <!-- site metas -->
    <title>lion</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!-- bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.css" />
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />--%>

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link href="datatables/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="datatables/js/jquery.dataTables.min.js"></script>
    <!-- style css -->
    <link rel="stylesheet" href="css/style.css" />
    <!-- Responsive-->
    <link rel="stylesheet" href="css/responsive.css" />
    <!-- fevicon -->
    <link rel="icon" href="images/fevicon.png" type="image/gif" />
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css" />
    <!-- Tweaks for older IEs-->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen" />

     <script type="text/javascript">
                        $(document).ready(function () {
                            $(".table").prepend($("<thead></thead>").append($(this).find
                                ("tr:first"))).dataTable();
                        });
                    </script>
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

<script type="text/javascript">
    function confirmUpdate() {
        var Pname = document.getElementById('<%= TextBox2.ClientID %>').value;
        var Weight = document.getElementById('<%= TextBox8.ClientID %>').value;

        var Date = document.getElementById('<%= TextBox12.ClientID %>').value;
        var Volume = document.getElementById('<%= TextBox13.ClientID %>').value;

        var Stock = document.getElementById('<%= TextBox4.ClientID %>').value;
        var Price = document.getElementById('<%= TextBox5.ClientID %>').value;
        var des = document.getElementById('<%= TextBox6.ClientID %>').value;

        if (Pname === '' || Weight === '' || Date === '' || Volume === '' || Stock === '' || Price === '' || des === '') {
            return confirm('Some textbox values are empty. Are you sure you want to update?');
        }
        return true;
    }
    function confirmDelete() {
        return confirm('Are You Sure You want To Delete This Product.');
    }
</script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
  <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Product Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img id="uploadedImage" runat="server" height="100" width="100" src="~/images/product.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:FileUpload ID="fileUploadControl" runat="server" />
                        <asp:Button ID="uploadButton" runat="server" Text="Upload Image" OnClick="UploadButton_Click" />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label>Product ID</label>
                        <div class="form-group">
                            <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary" Text="Go"  ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"></asp:LinkButton>
                            </div>
                        <!-->      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="ID Required" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator> <!-->
                        </div>
                     </div>
                     <div class="col-md-9">
                        <label>Product Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Name" required></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Weight</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control"  ID="TextBox8" runat="server"></asp:TextBox>
                        </div>
                        <label>Product Entry Date</label>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox12" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Volume</label>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox13" runat="server" TextMode="Number" CssClass="'form-control"></asp:TextBox>
                        </div>
                        <label>Fragile</label>
                        <div class="form-group">
                            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                              <asp:ListItem Text="Yes" Value="Yes" />
                              <asp:ListItem Text="No" Value="No" />
                            </asp:DropDownList>
                        </div>
                     </div>
                     
                  </div>

                  <div class="row">
                     <div class="col-md-4">
                        <label>Add Stock</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Add Stock" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Set Price</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Price" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-4">
                        <label>Availabilty</label>
                        <div class="form-group">
                            <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server">
                              <asp:ListItem Text="Yes" Value="Yes" />
                              <asp:ListItem Text="No" Value="No" />
                            </asp:DropDownList>
                        </div>
                      </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label>Product Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Product Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button1_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" OnClientClick="return confirmUpdate();" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button2_Click" OnClientClick="return confirmDelete();" />
                     </div>
                  </div>
               </div>
            </div>
            <a href="Signin.aspx"><< LOGOUT</a><br />
            <br />
             <a href="Finance.aspx">Finance</a><br />
             <br />
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Product Inventory List<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDB3ConnectionString %>" SelectCommand="SELECT * FROM [Product_with_details]"></asp:SqlDataSource>
                            </h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="PID" HeaderText="PID" ReadOnly="True" SortExpression="PID" />

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-10">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("PName") %>' Font-Bold="True" Font-Size="Large" ForeColor="Black"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">

                                                            Weight -
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Weight") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp;| Volume -
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Volume") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp;| Entry Date -
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Dateadded") %>' Font-Bold="True"></asp:Label>

                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">

                                                            Stock -
                                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("Stock") %>'></asp:Label>
                                                            &nbsp;| Fragile -
                                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("Fragile") %>'></asp:Label>
                                                            &nbsp;| Price -
                                                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("Price") %>'></asp:Label>
                                                            &nbsp;| Availability -
                                                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("Availability") %>'></asp:Label>

                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                           <i>Description :</i>  <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("Description") %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <asp:Image CssClass="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("Product_img_link") %>' />
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                         </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
        </div>
    </form>
</body>
</html>
