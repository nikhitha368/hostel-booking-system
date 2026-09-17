<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="HostelBooking.StudentDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 20px;
            background: #eaf5ef;
            color: #004d40;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            background: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        h2, h3 { color: #004d40; margin-bottom: 15px; }

        .btn-logout {
            background-color: #dc3545; 
            color: white; 
            padding: 10px 18px; 
            border: none; 
            cursor: pointer; 
            border-radius: 8px; 
            float: right;
        }

        .btn {
            background-color: #009879; 
            color: white; 
            padding: 6px 12px; 
            border: none; 
            cursor: pointer; 
            border-radius: 8px;
        }
        .btn:hover { background-color: #007b65; }

        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        th { background-color: #009879; color: white; }

        .guidelines {
            background: #f1f9f5;
            padding: 20px;
            border-radius: 12px;
            margin-top: 30px;
        }

        /* ✅ Vertical large image layout */
        .room-types {
            display: flex;
            flex-direction: column;
            gap: 35px;
            margin-top: 30px;
        }

        .room-card {
            background: #f1f9f5;
            padding: 20px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
        }

        .room-card img {
            width: 100%;
            max-height: 600px;
            object-fit: cover;
            border-radius: 12px;
            margin-bottom: 15px;
        }

        .room-card h4 {
            color: #004d40;
            margin-bottom: 8px;
            font-size: 20px;
        }

        .room-card p {
            color: #333;
            font-size: 15px;
        }

        .message { margin-top: 15px; font-weight: 500; }

        @media (max-width: 768px) {
            .room-card img { max-height: 300px; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hfLatestBookingStatus" runat="server" />

        <div class="container">
            <h2>Welcome, Student!</h2>
            <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn-logout" OnClick="btnLogout_Click" />
            
            <hr />

            <!-- Guidelines -->
            <div class="guidelines">
                <h3>Booking Guidelines:</h3>
                <ul>
                    <li>Check the room availability before booking.</li>
                    <li>Ensure your student details are updated correctly.</li>
                    <li>Book only one room at a time unless allowed by admin.</li>
                    <li>Check-in and check-out dates must be valid.</li>
                    <li>Contact admin for any special requirements.</li>
                </ul>
            </div>

            <!-- ✅ Vertical Room Type Images -->
            <div class="room-types">
                <div class="room-card">
                    <img src="Images/Single%20room%20Habitación%20individual%20Barceló%20Santa….jpeg" />
                    <h4>Single Room</h4>
                    <p>Comfortable for one person, ideal for focused study.</p>
                </div>
                <div class="room-card">
                    <img src="Images/WhatsApp%20Image%202025-10-12%20at%205.55.11%20PM.jpeg" />
                    <h4>Double Room</h4>
                    <p>Share with a friend, enjoy cozy environment.</p>
                </div>
                <div class="room-card">
                    <img src="Images/Photos%20of%20Hostelle%20-%20Female%20Only%20Hostel.jpeg" />
                    <h4>Dormitory Room</h4>
                    <p>Spacious with extra amenities for comfort.</p>
                </div>
            </div>

            <!-- Available Rooms -->
            <h3>Available Rooms</h3>
            <asp:GridView ID="GridViewRooms" runat="server" AutoGenerateColumns="False" DataKeyNames="RoomID"
                OnRowCommand="GridViewRooms_RowCommand" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="RoomID" HeaderText="Room ID" />
                    <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" />
                    <asp:BoundField DataField="RoomType" HeaderText="Room Type" />
                    <asp:BoundField DataField="Capacity" HeaderText="Capacity" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnBook" runat="server" Text="Book" CommandName="Book"
                                CommandArgument='<%# Eval("RoomID") %>' CssClass="btn" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <!-- My Bookings -->
            <h3>My Bookings</h3>
            <asp:GridView ID="GridViewMyBookings" runat="server" AutoGenerateColumns="False" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="BookingID" HeaderText="Booking ID" />
                    <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" />
                    <asp:BoundField DataField="CheckInDate" HeaderText="Check-In" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="CheckOutDate" HeaderText="Check-Out" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                </Columns>
            </asp:GridView>

            <asp:Label ID="lblMessage" runat="server" Text="" CssClass="message"></asp:Label>
        </div>
        <script type="text/javascript">
            window.onload = function() {
                var status = document.getElementById('<%= hfLatestBookingStatus.ClientID %>').value;
                if (status === "Approved") {
                    alert("✅ Your room booking has been approved!");
                } else if (status === "Rejected") {
                    alert("❌ Your room booking has been rejected.");
                }
            };
        </script>

    </form>
</body>
</html>
