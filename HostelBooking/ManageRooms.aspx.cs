using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web; // for HttpUtility.HtmlDecode

namespace HostelBooking
{
    public partial class ManageRooms : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["HostelBookingDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        // Display rooms in GridView
        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Rooms", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewRooms.DataSource = dt;
                GridViewRooms.DataBind();
            }
        }

        // Add new room
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                int capacity = 0;
                decimal price = 0m;

                int.TryParse(txtCapacity.Text.Trim(), out capacity);
                decimal.TryParse(txtPrice.Text.Trim(), out price);

                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "INSERT INTO Rooms (RoomNumber, RoomType, Capacity, Price, Status) VALUES (@RoomNumber, @RoomType, @Capacity, @Price, @Status)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@RoomNumber", txtRoomNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@RoomType", txtRoomType.Text.Trim());
                    cmd.Parameters.AddWithValue("@Capacity", capacity);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedItem.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                ClearFields();
                BindGrid();
                lblMessage.Text = "Room added successfully.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        // Update existing room
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (GridViewRooms.SelectedDataKey == null)
            {
                lblMessage.Text = "Please select a row to update.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            int roomId = Convert.ToInt32(GridViewRooms.SelectedDataKey.Value);

            try
            {
                int capacity = 0;
                decimal price = 0m;

                int.TryParse(txtCapacity.Text.Trim(), out capacity);
                decimal.TryParse(txtPrice.Text.Trim(), out price);

                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "UPDATE Rooms SET RoomNumber=@RoomNumber, RoomType=@RoomType, Capacity=@Capacity, Price=@Price, Status=@Status WHERE RoomID=@RoomID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@RoomNumber", txtRoomNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@RoomType", txtRoomType.Text.Trim());
                    cmd.Parameters.AddWithValue("@Capacity", capacity);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@RoomID", roomId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                ClearFields();
                BindGrid();
                lblMessage.Text = "Room updated successfully.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        // Delete room
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (GridViewRooms.SelectedDataKey == null)
            {
                lblMessage.Text = "Please select a row to delete.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            int roomId = Convert.ToInt32(GridViewRooms.SelectedDataKey.Value);

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "DELETE FROM Rooms WHERE RoomID=@RoomID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@RoomID", roomId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                ClearFields();
                BindGrid();
                lblMessage.Text = "Room deleted successfully.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        // Select room from GridView
        protected void GridViewRooms_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridViewRooms.SelectedRow == null) return;

            var row = GridViewRooms.SelectedRow;

            txtRoomNumber.Text = HttpUtility.HtmlDecode(row.Cells[1].Text).Trim();
            txtRoomType.Text = HttpUtility.HtmlDecode(row.Cells[2].Text).Trim();
            txtCapacity.Text = HttpUtility.HtmlDecode(row.Cells[3].Text).Trim();
            txtPrice.Text = HttpUtility.HtmlDecode(row.Cells[4].Text).Trim();

            string statusText = HttpUtility.HtmlDecode(row.Cells[5].Text).Trim();
            ddlStatus.ClearSelection();
            var item = ddlStatus.Items.FindByText(statusText);
            if (item != null)
                item.Selected = true;
            else if (ddlStatus.Items.Count > 0)
                ddlStatus.SelectedIndex = 0;
        }

        // Clear form fields
        private void ClearFields()
        {
            txtRoomNumber.Text = "";
            txtRoomType.Text = "";
            txtCapacity.Text = "";
            txtPrice.Text = "";
            ddlStatus.SelectedIndex = 0;
            GridViewRooms.SelectedIndex = -1;
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
    }
}
