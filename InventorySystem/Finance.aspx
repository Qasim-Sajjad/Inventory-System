<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Finance.aspx.cs" Inherits="InventorySystem.Finance" %>

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
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find
                 ("tr:first"))).dataTable();
         });
     </script>
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

</head>
<body>
    <form id="form1" runat="server">
        <div>
                 <nav class="navbar navbar-expand-md bg-dark navbar-dark">
      <a class="navbar-brand" href="WebForm2.aspx">WINDMILL</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="collapsibleNavbar">
       
      </div>
    </nav>
  <div class="container-fluid">
      <div class="row">
          <div class="col-md-2">

          </div>
         <div class="col-md-8">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Sales And Revenue</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img id="MoneyIMG" runat="server" height="100" width="100" src="~/images/money-bag.png"/>
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
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SalesDataSource" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-lg-10">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("PName") %>' Font-Bold="True" Font-Size="XX-Large" ForeColor="Black"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">

                                                            UnitsSold -
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("UnitsSold") %>' Font-Bold="True" Font-Size="Larger"></asp:Label>
                                                            &nbsp;| Revenue -
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Revenue") %>' Font-Bold="True"></asp:Label> RS
                                                            &nbsp;| NetProfit -
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("NetProfit") %>' Font-Bold="True"></asp:Label> RS

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
                         <asp:SqlDataSource ID="SalesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDB3ConnectionString %>" SelectCommand="SELECT [ID], [PName], [UnitsSold], [Revenue], [NetProfit], [Product_img_link] FROM [V2]"></asp:SqlDataSource>
                     </div>
                  </div>
               </div>
            </div>
         </div>
            <div class="col-md-2"></div>
      </div>
      <div class="row">
          <div class="col">
              <a href="ProductInventory.aspx">>>Products Details</a> <br />
              <a href="Finance.aspx">Finance.aspx</a>
              <br />
              <a href="Signin.aspx"> >>LOG OUT</a> <br />
          </div>
      </div>
   </div>
        </div>
    </form>
</body>
</html>
