using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Feedback : Page
{
    ConnectDB connectDB = new ConnectDB();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_id"] == null)
        {
            Response.Redirect("Login");
        }
        Replys.SelectCommand = "SELECT subject,mail FROM Feedback WHERE from_id = '"+Session["user_id"]+"' AND from_role = '1'";
        GridView1.DataBind();
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (txtMail.Text == "" || txtSubject.Text == "")
        {
            lblMessage.Text = "Please fill all field to send";
        }
        else
        {
            string query = "INSERT INTO Feedback (from_id,to_id,subject,mail,from_role) VALUES ('" + Session["user_id"] + "','1','" + txtSubject.Text + "','" + txtMail.Text + "','0')";
            connectDB.executeNonQuery(query);
            Response.Write("<script>alert('Message sent!');</script>");
            lblMessage.Text = "";         
        }
    }
}