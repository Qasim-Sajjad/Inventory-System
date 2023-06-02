<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Campaign.aspx.cs" Inherits="InventorySystem.Campaign" %>

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
     </script> --%>
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find
                 ("tr:first"))).dataTable();
         });
     </script>
    <script>
        function confirmDel() {
            return confirm("Are You Sure You want to Delete This Product From Campaign");
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
                           <h4>Campaigns</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img id="imgview" height="150" width="100" src="images/campaign.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Product ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="ProductID" runat="server" placeholder="ID"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary" Text="Go"  ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Campaign Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Campaign Name"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Original Price</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Org_Price" runat="server" ReadOnly="true" placeholder="" ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Price</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Set Price"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Start Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Enter Start Date" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>End Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-6">
                        <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button1_Click" />
                     </div>
                     <div class="col-6">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClientClick="return confirmDel();" OnClick="Button2_Click" />
                     </div>
                  </div>
               </div>
            </div>
            <a href="MasterPage.aspx"><< Back to Home</a><br>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Campaign's List</h4>
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
                          <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="CamDataSource">
                              <Columns>
                                  <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" />
                                  <asp:BoundField DataField="Cam_Name" HeaderText="Cam_Name" SortExpression="Cam_Name" />
                                  <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                                  <asp:BoundField DataField="Cam_Price" HeaderText="Cam_Price" SortExpression="Cam_Price" />
                                  <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
                                  <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
                              </Columns>

                          </asp:GridView>
                          <asp:SqlDataSource ID="CamDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDB3ConnectionString %>" SelectCommand="SELECT * FROM [Cam_View]"></asp:SqlDataSource>
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
