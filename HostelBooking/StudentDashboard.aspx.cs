using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace HostelBooking
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["HostelBookingDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // ✅ Allow direct run (for testing only)
                if (Session["UserID"] == null)
                {
                    // For direct testing, create a temporary session
                    Session["UserID"] = 1; // assume test user ID
                    Session["UserEmail"] = "teststudent@example.com";
                }

                lblWelcome.Text = "Welcome, " + Session["UserEmail"].ToString();
                BindAvailableRooms();
                BindMyBookings();
            }
        }

        private void BindAvailableRooms()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Rooms WHERE Status='Available'";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewRooms.DataSource = dt;
                GridViewRooms.DataBind();
            }
        }

        private void BindMyBookings()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"
            SELECT TOP 1 b.BookingID, r.RoomNumber, b.CheckInDate, b.CheckOutDate, b.Status
            FROM Bookings b
            INNER JOIN Rooms r ON b.RoomID = r.RoomID
            WHERE b.UserID=@UserID
            ORDER BY b.BookingID DESC";  // Latest booking for logged-in user

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewMyBookings.DataSource = dt;
                GridViewMyBookings.DataBind();

                // Store the latest booking status in hidden field
                if (dt.Rows.Count > 0)
                {
                    hfLatestBookingStatus.Value = dt.Rows[0]["Status"].ToString();
                }
                else
                {
                    hfLatestBookingStatus.Value = "";
                }
            }
        }


        protected void GridViewRooms_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Book")
            {
                int roomID = Convert.ToInt32(e.CommandArgument);

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Insert booking
                    SqlCommand cmdInsert = new SqlCommand(@"
                        INSERT INTO Bookings (UserID, RoomID, CheckInDate, CheckOutDate, Status)
                        VALUES (@UserID, @RoomID, GETDATE(), DATEADD(DAY,30,GETDATE()), 'Pending')", con);
                    cmdInsert.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    cmdInsert.Parameters.AddWithValue("@RoomID", roomID);
                    cmdInsert.ExecuteNonQuery();

                    // Update room status
                    SqlCommand cmdUpdate = new SqlCommand("UPDATE Rooms SET Status='Occupied' WHERE RoomID=@RoomID", con);
                    cmdUpdate.Parameters.AddWithValue("@RoomID", roomID);
                    cmdUpdate.ExecuteNonQuery();

                    con.Close();
                }

                lblMessage.Text = "✅ Room booked successfully! Waiting for admin approval.";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                BindAvailableRooms();
                BindMyBookings();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}
