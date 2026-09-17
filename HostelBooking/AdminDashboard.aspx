<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="HostelBooking.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
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
            padding: 60px 20px;
            color: #004d40;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .hero h1 { font-size: 32px; font-weight: 600; margin-bottom: 10px; }
        .hero p { font-size: 16px; color: #00695c; margin: 0; }

        .container {
            max-width: 600px;
            margin: 60px auto;
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 { color: #004d40; font-weight: 600; margin-bottom: 10px; }
        .subtitle { color: #777; margin-bottom: 30px; font-size: 14px; }

        .btn-nav {
            display: block;
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            background-color: #009879;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-nav:hover { background-color: #007b65; transform: translateY(-2px); }
        .btn-logout { background-color: #dc3545; }
        .btn-logout:hover { background-color: #b02a37; }

        footer { text-align: center; margin-top: 40px; color: #666; font-size: 13px; padding-bottom: 20px; }
    </style>
</head>
<body>
    <div class="hero">
        <h1>Admin Dashboard</h1>
        <p>Manage hostel rooms, bookings, and students efficiently</p>
    </div>

    <form id="form1" runat="server"> 
        <div class="container">
            <h2>Welcome, Admin!</h2>
            <div class="subtitle">Select an option below to manage the system</div>

            <asp:Button ID="btnManageRooms" runat="server" Text="Manage Rooms" CssClass="btn-nav" OnClick="btnManageRooms_Click" />
            <asp:Button ID="btnViewStudents" runat="server" Text="View Students" CssClass="btn-nav" OnClick="btnViewStudents_Click" />
            <asp:Button ID="btnApproveBookings" runat="server" Text="Approve Bookings" CssClass="btn-nav" OnClick="btnApproveBookings_Click" />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn-nav btn-logout" OnClick="btnLogout_Click" />
        </div>

        <footer>© 2025 Hostel Booking System | Admin Panel</footer>
    </form>
</body>
</html>
