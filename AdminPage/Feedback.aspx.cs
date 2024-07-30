using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Feedback : Page
{
    //from_role 1 -> admin, 2 -> user
    ConnectDB connectDB = new ConnectDB();
    static int user_id = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin_id"] == null)
        {
            Response.Redirect("Login");
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (txtUser.Text == "" || txtMail.Text == "" || txtSubject.Text == "")
        {
            lblMessage.Text = "Please fill all field to send";
        }
        else
        {
            string query = "INSERT INTO Feedback (from_id,to_id,subject,mail,from_role) VALUES ('" + Session["admin_id"] + "','" + user_id + "','" + txtSubject.Text + "','" + txtMail.Text + "','1')";
            connectDB.executeNonQuery(query);
            Response.Write("<script>alert('Message sent!');</script>");
            GridView2.DataBind();
            lblMessage.Text = "";
            Panel2.Visible = false;
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        user_id =  Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);
        txtUser.Text = user_id+"";
        Panel2.Visible = true;
    }

    protected void GridView1_OnRowDeleting(object sender,GridViewDeleteEventArgs e)
    {
        int from_id = Convert.ToInt32(GridView1.Rows[e.RowIndex].Cells[1].Text);
        string mail = GridView1.Rows[e.RowIndex].Cells[3].Text;
        Feedbacks.DeleteCommand = "DELETE FROM Feedback WHERE from_id = '" + from_id + "' AND mail = '" + mail + "' AND from_role = '0'";
        GridView1.DataBind();
    }

    protected void GridView2_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int to_id = Convert.ToInt32(GridView2.Rows[e.RowIndex].Cells[0].Text);
        string mail = GridView2.Rows[e.RowIndex].Cells[2].Text;
        Replys.DeleteCommand = "DELETE FROM Feedback WHERE to_id = '" + to_id + "' AND mail = '" + mail + "' AND from_role = '1'";
        GridView1.DataBind();
    }
}