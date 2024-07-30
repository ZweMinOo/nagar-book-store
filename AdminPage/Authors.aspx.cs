using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Authors : Page
{
    ConnectDB connectDB = new ConnectDB();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ( Session["admin_id"] == null)
        {
            Response.Redirect("Login");
        }
        
    }

    protected void btnNew_Click(object sender, EventArgs e)
    {
        string query = "INSERT INTO Authors (author_name) VALUES ('" + txtAuthorName.Text +"')";
        connectDB.executeNonQuery(query);
        GridViewAuthor.DataBind();
    }
}