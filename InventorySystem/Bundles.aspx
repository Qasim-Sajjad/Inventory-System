<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bundles.aspx.cs" Inherits="InventorySystem.Bundles1" %>

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
             $(".table").prepend($("<thead></thead>").append($(".table").find
                 ("tr:first"))).dataTable();
             $(".table1").prepend($("<thead></thead>").append($(".table1").find
                 ("tr:first"))).dataTable();
         });
     </script>
    <script>
        function confirmDel() {
            return confirm("Are You Sure You want to Delete This Product From Bundle");
        }
    </script>

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
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
                           <h4>Bundles</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img id="imgview" height="150" width="100" src="images/gift.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Bundle Name</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="txtBundleName" runat="server" placeholder="Name"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary" Text="Go"  ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Bundle Price</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtBundlePrice" runat="server" placeholder="Set Price"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                      
                      <div class="col-md-12">
                            <asp:GridView CssClass="table1 table-striped table-bordered" ID="productGridView" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="PID">
                                <Columns>
                                    <asp:BoundField  DataField="PID" HeaderText="ProductID"/>
                                    <asp:BoundField DataField="PName" HeaderText="Product Name" />
                                    <asp:TemplateField HeaderText="Quantity">
                                        <ItemTemplate>
                                            <asp:TextBox ID="quantityTextBox" runat="server" Text="1" Width="50"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="productCheckBox" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                      </div>
                  </div>
                  <div class="row">
                     <div class="col-6">
                        <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Add Bundle" OnClick="Button1_Click" />
                     </div>
                     <div class="col-6">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete Bundle" OnClientClick="return confirmDel();" OnClick="Button2_Click" />
                     </div>
                  </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDB3ConnectionString %>" SelectCommand="SELECT [PID], [PName] FROM [Product_with_details]"></asp:SqlDataSource>
               </div>
            </div>
            <a href="MasterPage.aspx"><< Back to Home</a><br />
            <br />
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Bundle's List</h4>
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
                          <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="CamDataSource">
                              <Columns>
                                  <asp:BoundField DataField="BName" HeaderText="Bundle" SortExpression="BName" />
                                  <asp:BoundField DataField="PName" HeaderText="Product" SortExpression="PName" />
                                  <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                  <asp:BoundField DataField="BundlePrice" HeaderText="BundlePrice" SortExpression="BundlePrice" />
                              </Columns>
                          </asp:GridView>
                          <asp:SqlDataSource ID="CamDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDB3ConnectionString %>" SelectCommand="SELECT * FROM [V4]"></asp:SqlDataSource>
                      </div>
                  </div>
               </div>
            </div>
         </div>
      <div class="row">
          <div class="col">
              <a href="ProductInventory.aspx">>>Products Details</a> <br />
              <br />
              <a href="Signin.aspx"> >>LOG OUT</a> <br />
          </div>
      </div>
      </div>
   </div>
        </div>
    </form>
</body>
</html>
