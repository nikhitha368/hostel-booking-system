<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bookings.aspx.cs" Inherits="HostelBooking.Bookings" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All Bookings</title>
    <style>
        body { font-family: Arial; background-color: #f4f6f9; margin: 20px; }
        .container { width: 900px; margin: auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #333; }
        .grid { margin-top: 20px; width: 100%; }
        .btn { background-color: #28a745; color: white; padding: 5px 10px; border: none; border-radius: 5px; cursor: pointer; }
        .btn.reject { background-color: #dc3545; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>All Bookings</h2>
            <asp:GridView ID="GridViewBookings" runat="server" CssClass="grid" AutoGenerateColumns="False" DataKeyNames="BookingID" OnRowCommand="GridViewBookings_RowCommand">
                <Columns>
                    <asp:BoundField DataField="BookingID" HeaderText="Booking ID" ReadOnly="True" />
                    <asp:BoundField DataField="FullName" HeaderText="Student Name" />
                    <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" />
                    <asp:BoundField DataField="CheckInDate" HeaderText="Check-In" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="CheckOutDate" HeaderText="Check-Out" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnApprove" runat="server" Text="Approve" CommandName="Approve" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn" 
                                        Visible='<%# Eval("Status").ToString() == "Pending" %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnReject" runat="server" Text="Reject" CommandName="Reject" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn reject"
                                        Visible='<%# Eval("Status").ToString() == "Pending" %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
