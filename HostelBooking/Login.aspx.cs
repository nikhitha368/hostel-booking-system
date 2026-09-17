using System;
using System.Data.SqlClient;
using System.Configuration;

namespace HostelBooking
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["HostelBookingDB"].ConnectionString;

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT Role, UserID FROM Users WHERE Email=@Email AND Password=@Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    dr.Read();
                    string role = dr["Role"].ToString();
                    int userID = Convert.ToInt32(dr["UserID"]);

                    // Store session
                    Session["UserID"] = userID;
                    Session["UserEmail"] = txtEmail.Text.Trim();
                    Session["UserRole"] = role;

                    if (role == "Student")
                        Response.Redirect("StudentDashboard.aspx");
                    else if (role == "Admin")
                        Response.Redirect("AdminDashboard.aspx");
                }
                else
                {
                    lblMessage.Text = "⚠️ Invalid email or password";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }

                con.Close();
            }
        }
    }
}
