using System;
using System.IO;
using System.Web;
using System.Web.UI;

namespace HostelBooking
{
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Optional: initialization
            }
        }

        protected void btnManageRooms_Click(object sender, EventArgs e)
        {
            RedirectPage("~/ManageRooms.aspx");
        }

        protected void btnViewStudents_Click(object sender, EventArgs e)
        {
            RedirectPage("~/ViewStudents.aspx");
        }

        protected void btnApproveBookings_Click(object sender, EventArgs e)
        {
            RedirectPage("~/Bookings.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        private void RedirectPage(string virtualPath)
        {
            try
            {
                string physical = Server.MapPath(virtualPath);
                if (File.Exists(physical))
                {
                    Response.Redirect(ResolveUrl(virtualPath));
                }
                else
                {
                    string fileName = VirtualPathUtility.GetFileName(virtualPath);
                    string script = $"alert('Page \"{fileName}\" not found. Please check your project files.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "missingPage", script, true);
                }
            }
            catch (Exception ex)
            {
                string script = $"alert('Navigation error: {HttpUtility.JavaScriptStringEncode(ex.Message)}');";
                ClientScript.RegisterStartupScript(this.GetType(), "navError", script, true);
            }
        }
    }
}
