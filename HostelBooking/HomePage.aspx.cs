using System;
using System.Web.UI;

namespace HostelBooking
{
    public partial class HomePage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            // Redirect to Register page when "Yes" is clicked
            Response.Redirect("register.aspx");
        }
    }
}
