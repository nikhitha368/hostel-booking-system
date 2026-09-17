<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageRooms.aspx.cs" Inherits="HostelBooking.ManageRooms" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Rooms</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to bottom right, #eaf5ef, #f7fafc);
            color: #333;
        }

        /* Hero Section */
        .hero {
            background: #baf1d3;
            text-align: center;
            padding: 50px 20px;
            color: #004d40;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .hero h1 { font-size: 32px; font-weight: 600; margin-bottom: 10px; }
        .hero p { font-size: 16px; color: #00695c; margin: 0; }

        /* Top Navigation Buttons (Admin Dashboard style) */
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

        /* Container for Form & Grid */
        .container {
            max-width: 800px;
            margin: 20px auto 40px auto;
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        h2 { color: #004d40; font-weight: 600; margin-bottom: 5px; text-align:center; }
        .subtitle { color: #777; margin-bottom: 20px; font-size: 14px; text-align:center; }

        /* Form Styling */
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: 500; }
        .form-group input, .form-group select { width: 100%; padding: 10px; box-sizing: border-box; border-radius: 6px; border: 1px solid #ccc; }

        /* Action Buttons */
        .btn-action {
            padding: 12px 20px;
            margin: 8px 4px 8px 0;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .btn-add { background-color: #28a745; color: #fff; }
        .btn-update { background-color: #007bff; color: #fff; }
        .btn-delete { background-color: #dc3545; color: #fff; }
        .btn-action:hover { opacity: 0.9; transform: translateY(-1px); }

        /* Message Label */
        #lblMessage { display:block; font-weight: 500; margin-bottom: 15px; text-align:center; }

        /* Grid Styling */
        .grid-container { margin-top: 25px; }
        .grid-container table { width: 100%; border-collapse: collapse; }
        .grid-container th, .grid-container td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        .grid-container th { background-color: #009879; color: #fff; }
        .grid-container tr:hover { background-color: #f1f1f1; cursor: pointer; }
    </style>
</head>
<body>
    <div class="hero">
        <h1>Manage Rooms</h1>
        <p>Admin Panel - Add, Update, Delete and View Rooms</p>
    </div>

    <form id="form1" runat="server">
        <!-- Top Navigation Buttons -->
        <div class="nav-buttons">
            <asp:Button ID="btnManageRooms" runat="server" Text="Manage Rooms" CssClass="btn-nav" OnClick="btnManageRooms_Click" />
            <asp:Button ID="btnViewStudents" runat="server" Text="View Students" CssClass="btn-nav" OnClick="btnViewStudents_Click" />
            <asp:Button ID="btnApproveBookings" runat="server" Text="Approve Bookings" CssClass="btn-nav" OnClick="btnApproveBookings_Click" />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn-nav btn-logout" OnClick="btnLogout_Click" />
        </div>

        <div class="container">
            <h2>Room Management</h2>
            <div class="subtitle">Use the form below to manage rooms</div>

            <asp:Label ID="lblMessage" runat="server"></asp:Label>

            <div class="form-group">
                <label>Room Number:</label>
                <asp:TextBox ID="txtRoomNumber" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Room Type:</label>
                <asp:TextBox ID="txtRoomType" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Capacity:</label>
                <asp:TextBox ID="txtCapacity" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Price:</label>
                <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Status:</label>
                <asp:DropDownList ID="ddlStatus" runat="server">
                    <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                    <asp:ListItem Text="Occupied" Value="Occupied"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div>
                <asp:Button ID="btnAdd" runat="server" Text="Add Room" CssClass="btn-action btn-add" OnClick="btnAdd_Click" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update Room" CssClass="btn-action btn-update" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete Room" CssClass="btn-action btn-delete" OnClick="btnDelete_Click" />
            </div>

            <div class="grid-container">
                <asp:GridView ID="GridViewRooms" runat="server" AutoGenerateColumns="False" DataKeyNames="RoomID" OnSelectedIndexChanged="GridViewRooms_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="RoomID" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" />
                        <asp:BoundField DataField="RoomType" HeaderText="Room Type" />
                        <asp:BoundField DataField="Capacity" HeaderText="Capacity" />
                        <asp:BoundField DataField="Price" HeaderText="Price" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:CommandField ShowSelectButton="True" />

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
