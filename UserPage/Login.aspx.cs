using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using nagarbookstore;
using System.Data;

public partial class Account_Login : Page
{
        ConnectDB connectDB = new ConnectDB();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void LogIn(object sender, EventArgs e)
        {           
            string user = UserName.Text;
            string pass = Password.Text;
            string query = "SELECT user_id FROM Users WHERE username='" + user + "' AND password = '" + pass + "'";
            DataTable dt = connectDB.executeReader(query);

            if (dt.Rows.Count != 0)
            {
                foreach (System.Data.DataRow row in dt.Rows)
                {
                    Session["user_id"] = Convert.ToInt32(row["user_id"].ToString());
                }

                Response.Redirect("Home");
            }
            else
            {
                FailureText.Text = "Username / password invalid";
                ErrorMessage.Visible = true;
            }
        }
}