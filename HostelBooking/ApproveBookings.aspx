<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApproveBookings.aspx.cs" Inherits="HostelBooking.ApproveBookings" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Approve Bookings</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to bottom right, #eaf5ef, #f7fafc);
            color: #333;
        }

       
        .hero {
            background: #baf1d3;
            text-align: center;
            padding: 50px 20px;
            color: #004d40;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .hero h1 { font-size: 32px; font-weight: 600; margin-bottom: 10px; }
        .hero p { font-size: 16px; color: #00695c; margin: 0; }

        .nav-buttons {
            max-width: 800px;
            margin: 20px auto;
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            justify-content: center;
        }
        .nav-buttons .btn-nav {
            flex: 1 1 180px;
            padding: 15px 20px;
            background-color: #009879; /* Green like Admin Dashboard */
            color: #fff;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .nav-buttons .btn-nav:hover {
            background-color: #007b65;
            transform: translateY(-2px);
        }
        .nav-buttons .btn-logout {
            background-color: #dc3545; /* Red logout button */
        }
        .nav-buttons .btn-logout:hover {
            background-color: #b02a37;
        }

        /* Container for Grid */
        .container {
            max-width: 900px;
            margin: 20px auto 40px auto;
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        h2 { color: #004d40; font-weight: 600; margin-bottom: 10px; text-align:center; }
        .subtitle { color: #777; margin-bottom: 20px; font-size: 14px; text-align:center; }

       
        .grid-container { margin-top: 20px; }
        .grid-container table { width:100%; border-collapse: collapse; background: #fff; }
        .grid-container th, .grid-container td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        .grid-container th { background-color: #009879; color: #fff; }
        .grid-container tr:hover { background-color: #f1f1f1; cursor: pointer; }

        /* Action Buttons in Grid */
        .btn-approve { background-color:#28a745; color:white; border:none; padding:5px 10px; border-radius:4px; cursor:pointer; margin-right:5px;}
        .btn-reject { background-color:#dc3545; color:white; border:none; padding:5px 10px; border-radius:4px; cursor:pointer; }
        .btn-approve:hover, .btn-reject:hover { opacity:0.9; }
    </style>
</head>
<body>
    <div class="hero">
        <h1>Approve Bookings</h1>
        <p>Admin Panel - Approve or Reject Booking Requests</p>
    </div>

    <form id="form1" runat="server">
      
        <div class="nav-buttons">
            <asp:Button ID="btnManageRooms" runat="server" Text="Manage Rooms" CssClass="btn-nav" OnClick="btnManageRooms_Click" />
            <asp:Button ID="btnViewStudents" runat="server" Text="View Students" CssClass="btn-nav" OnClick="btnViewStudents_Click" />
            <asp:Button ID="btnApproveBookings" runat="server" Text="Approve Bookings" CssClass="btn-nav" OnClick="btnApproveBookings_Click" />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn-nav btn-logout" OnClick="btnLogout_Click" />
        </div>

        <div class="container">
            <h2>Booking Requests</h2>
            <div class="subtitle">Approve or reject student room bookings</div>

            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

            <div class="grid-container">
               <asp:GridView ID="GridViewBookings" runat="server" AutoGenerateColumns="False" OnRowCommand="GridViewBookings_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="BookingID" HeaderText="Booking ID" ReadOnly="True" />
                        <asp:BoundField DataField="UserName" HeaderText="Student Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="CheckInDate" HeaderText="From" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="CheckOutDate" HeaderText="To" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnApprove" runat="server" Text="Approve" CommandName="Approve" CommandArgument='<%# Eval("BookingID") %>' CssClass="btn-approve" />
                                <asp:Button ID="btnReject" runat="server" Text="Reject" CommandName="Reject" CommandArgument='<%# Eval("BookingID") %>' CssClass="btn-reject" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </div>
        </div>
    </form>
</body>
</html>
