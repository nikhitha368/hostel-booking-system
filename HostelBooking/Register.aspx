<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HostelBooking.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hostel Registration</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet" />

    <style>
body {
    font-family: 'Poppins', sans-serif;
    color: #ACE1AF;
    margin: 0;
    padding: 0;
    line-height: 1.7;

    /* Correct background syntax */
    background: linear-gradient(to bottom right, #eaf5ef, #f7fafc), 
                url('../Images/WhatsApp%20Image%202025-10-12%20at%203.38.48%20PM.jpeg') no-repeat center center;
    background-size: cover; /* fill full screen */
}

        h1, h2, h3 {
            color: #004d40;
            margin-bottom: 10px;
        }

        /* Container for the registration form */
        .register-container {
            max-width: 500px;
            margin: 60px auto;
            background: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .register-container h2 {
            text-align: center;
            font-size: 1.8rem;
            margin-bottom: 25px;
        }

        .form-label {
            display: block;
            font-weight: 500;
            margin-bottom: 6px;
            color: #004d40;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .btn-register {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 8px;
            background-color: #009879;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-register:hover {
            background-color: #007b65;
            transform: translateY(-2px);
        }

        .lbl-message {
            text-align: center;
            margin-top: 10px;
            font-weight: 500;
        }

       
        
    </style>
</head>

<body>    <form id="form1" runat="server">

        <!-- Registration Form -->
        <div class="register-container">
            <h2> Registration</h2>

            <asp:Label CssClass="form-label" Text="Full Name:" runat="server" />
            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" />

            <asp:Label CssClass="form-label" Text="Email:" runat="server" />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />

            <asp:Label CssClass="form-label" Text="Password:" runat="server" />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />

            <asp:Label CssClass="form-label" Text="Phone:" runat="server" />
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />

            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-register" OnClick="btnRegister_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="lbl-message" ForeColor="Red" />
        </div>

        

    </form>
</body>
</html>
