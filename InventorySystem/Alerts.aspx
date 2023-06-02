<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alerts.aspx.cs" Inherits="InventorySystem.Bundles" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <!-- basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <!-- site metas -->
    <title>lion</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.css">

    <!-- style css -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive-->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- fevicon -->
    <link rel="icon" href="images/fevicon.png" type="image/gif" />
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
    <!-- Tweaks for older IEs-->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen" />
    <script>
        function confirmBuy() {
            return confirm('Are You Sure You want To Buy This Product.');
        }
    </script> 


    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="wrapper">
                <div class="content">
                    <div class="container">
                        <div id="shoes" class="shoes-bg">
                            <h3>
                                <center>
                                    New Alerts

                                </center>
                            </h3>
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img id="uploadedImage" runat="server" height="100" width="100" src="~/images/warning.png"/>
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>
                            <div class="row">
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="AtertsDataSource">
                                    <ItemTemplate>
                                        <div class="col-md-12">
                                             <asp:Label runat="server" Text="The Following Product With PID :" Font-Size="X-Large"></asp:Label>
                                             <asp:Label ID="Label1" runat="server" Text='<%# Eval("PID") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                             &nbsp;| ,<asp:Label runat="server" Text="Product Name" Font-Size="X-Large"></asp:Label> 
                                             <asp:Label ID="Label5" runat="server" Text='<%# Eval("PName") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                             &nbsp;|  <asp:Label runat="server" Text="is Running Low on Stock:" Font-Size="X-Large"></asp:Label>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Stock") %>' Font-Bold="True" Font-Size="X-Large" ForeColor="#ff0000"></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="AtertsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDB3ConnectionString %>" SelectCommand="SELECT * FROM [V3]"></asp:SqlDataSource>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
