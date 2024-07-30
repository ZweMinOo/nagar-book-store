using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserMaster : MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["user_id"] == null)
        {
            LoginState.Visible = false;
            AnonymousState.Visible = true;
        }
        else
        {
            LoginState.Visible = true;
            AnonymousState.Visible = false;
        }
    }

    protected void Logout(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Login");
    }
}