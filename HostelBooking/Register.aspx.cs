using System;
using System.Configuration;
using System.Data.SqlClient;

namespace HostelBooking
{
    public partial class Register : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["HostelBookingDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "INSERT INTO Users (FullName, Email, Password, Phone, Role) " +
                               "VALUES (@FullName, @Email, @Password, @Phone, 'Student')";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "✅ Registration successful! You can now login.";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                // ✅ Added line: redirect to Login page after successful registration
                Response.Redirect("Login.aspx");
            }
        }
    }
}
