<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewStudents.aspx.cs" Inherits="HostelBooking.ViewStudents" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Students</title>
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

        /* Top Navigation Buttons (same as ManageRooms) */
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
            max-width: 800px;
            margin: 20px auto 40px auto;
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        h2 { color: #004d40; font-weight: 600; margin-bottom: 5px; text-align:center; }
        .subtitle { color: #777; margin-bottom: 20px; font-size: 14px; text-align:center; }

        /* Grid Styling */
        .grid-container { margin-top: 25px; }
        .grid-container table { width: 100%; border-collapse: collapse; background: #fff; }
        .grid-container th, .grid-container td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        .grid-container th { background-color: #009879; color: #fff; }
        .grid-container tr:hover { background-color: #f1f1f1; cursor: pointer; }
    </style>
</head>
<body>
    <div class="hero">
        <h1>View Students</h1>
        <p>Admin Panel - View all registered students</p>
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
            <h2>Registered Students</h2>
            <div class="subtitle">List of all students registered in the system</div>

            <div class="grid-container">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridView" AutoGenerateColumns="true"></asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
