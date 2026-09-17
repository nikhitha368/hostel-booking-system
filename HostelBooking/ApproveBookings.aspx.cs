using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HostelBooking
{
    public partial class ApproveBookings : Page
    {
        string cs = ConfigurationManager.ConnectionStrings["HostelBookingDB"].ConnectionString; // ✅ Use same as other pages

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBookings();
            }
        }

        private void BindBookings()
        {
            lblMessage.Text = "";

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query = @"
                        SELECT 
                            b.BookingID, 
                            u.FullName AS UserName, 
                            u.Email, 
                            b.CheckInDate, 
                            b.CheckOutDate, 
                            b.Status
                        FROM Bookings b
                        INNER JOIN Users u ON b.UserID = u.UserID
                        ORDER BY b.BookingID DESC";



                    DataTable dt = new DataTable();
                    using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                    {
                        da.Fill(dt);
                    }

                    GridViewBookings.DataSource = dt;
                    GridViewBookings.DataBind();

                    if (dt.Rows.Count == 0)
                    {
                        lblMessage.Text = "No booking requests found.";
                        lblMessage.ForeColor = System.Drawing.Color.Gray;
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading bookings: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void GridViewBookings_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve" || e.CommandName == "Reject")
            {
                int bookingID = Convert.ToInt32(e.CommandArgument);
                string newStatus = e.CommandName == "Approve" ? "Approved" : "Rejected";

                try
                {
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        con.Open();
                        string query = "UPDATE Bookings SET Status=@Status WHERE BookingID=@BookingID";
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@Status", newStatus);
                            cmd.Parameters.AddWithValue("@BookingID", bookingID);
                            cmd.ExecuteNonQuery();
                        }
                    }

                    // ✅ Pop-up message for Admin
                    string script = $"alert('Booking {newStatus} successfully!');";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", script, true);

                    BindBookings(); // Refresh data
                }
                catch (Exception ex)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Error updating booking: " + ex.Message;
                }
            }
        }

        // Navigation buttons
        protected void btnManageRooms_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageRooms.aspx");
        }

        protected void btnViewStudents_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewStudents.aspx");
        }

        protected void btnApproveBookings_Click(object sender, EventArgs e)
        {
            Response.Redirect("ApproveBookings.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}
