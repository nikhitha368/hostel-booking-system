<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HostelBooking.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Hostel Booking System</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            line-height: 1.7;
            background: linear-gradient(to bottom right, #eaf5ef, #f7fafc);
            color: #004d40;
        }

        .login-container {
            width: 450px; /* slightly bigger */
            margin: 80px auto;
            padding: 50px; /* increased padding */
            background: #ffffff;
            border-radius: 20px; /* slightly more rounded */
            box-shadow: 0 10px 25px rgba(0,0,0,0.12);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .login-container:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        }

        .login-container h2 {
            margin-bottom: 30px;
            font-size: 2rem;
            color: #004d40;
        }

        .form-control {
            width: 100%;
            padding: 14px;
            margin-bottom: 18px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        .btn {
            width: 100%;
            padding: 16px;
            border: none;
            border-radius: 10px;
            background-color: #009879;
            color: #fff;
            font-size: 17px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background-color: #007b65;
            transform: translateY(-2px);
        }

        .message {
            margin-top: 15px;
            color: red;
            font-weight: 500;
        }

        /* Responsive */
        @media (max-width: 500px) {
            .login-container {
                width: 95%;
                padding: 35px;
                margin: 50px auto;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Hostel Booking Login</h2>

            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password"></asp:TextBox>

            <!-- Dropdown for selecting role -->
            <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                <asp:ListItem Text="-- Select Role --" Value="" />
                <asp:ListItem Text="Admin" Value="Admin" />
                <asp:ListItem Text="Student" Value="Student" />
            </asp:DropDownList>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
        </div>
    </form>
</body>
</html>
