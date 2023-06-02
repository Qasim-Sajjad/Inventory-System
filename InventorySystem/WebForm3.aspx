<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="InventorySystem.WebForm3" %>

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

<%--     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find
                 ("tr:first"))).dataTable();
         });
     </script>
    <script>
        function confirmDel() {
            return confirm("Are You Sure You want to Delete This Product From Campaign");
        }
    </script>--%>
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Create New Bundle</h2>
            <hr />

            <div>
                <label>Bundle Name:</label>
                <asp:TextBox ID="txtBundleName" runat="server"></asp:TextBox>
            </div>
            <br />

            <div>
                <label>Bundle Price:</label>
                <asp:TextBox ID="txtBundlePrice" runat="server"></asp:TextBox>
            </div>
            <br />
            <div>
        <div class="row">
            <div class="col-md-6">
                <asp:GridView CssClass="table table-striped table-bordered" ID="productGridView" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="PID">
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
                <div class="row">
                    <div class="col-md-3">
                        <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>
        </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDB3ConnectionString %>" SelectCommand="SELECT [PID], [PName] FROM [Product_with_details]"></asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
