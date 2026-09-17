using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HostelBooking
{
    public partial class Bookings : Page
    {
        string cs = ConfigurationManager.ConnectionStrings["HostelBookingDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBookings();
            }
        }

        private void BindBookings()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT b.BookingID, u.FullName, r.RoomNumber, b.CheckInDate, b.CheckOutDate, b.Status
                                 FROM Bookings b
                                 INNER JOIN Users u ON b.UserID = u.UserID
                                 INNER JOIN Rooms r ON b.RoomID = r.RoomID";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewBookings.DataSource = dt;
                GridViewBookings.DataBind();
            }
        }

        private void UpdateBookingStatus(int bookingID, string newStatus)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE Bookings SET Status=@Status WHERE BookingID=@BookingID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Status", newStatus);
                cmd.Parameters.AddWithValue("@BookingID", bookingID);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        protected void GridViewBookings_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int bookingID = Convert.ToInt32(GridViewBookings.DataKeys[index].Value);

            if (e.CommandName == "Approve")
                UpdateBookingStatus(bookingID, "Approved");
            else if (e.CommandName == "Reject")
                UpdateBookingStatus(bookingID, "Rejected");

            BindBookings(); // refresh
        }
    }
}
