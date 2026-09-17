using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace HostelBooking
{
    public partial class ViewStudents : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["HostelBookingDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStudents();
            }
        }
        // ----------------- Navigation Buttons -----------------
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


        private void BindStudents()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT FullName, Email, Phone, Role FROM Users WHERE Role='Student'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}
