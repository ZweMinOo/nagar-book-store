using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using nagarbookstore;

public partial class Account_Register : Page
{
    ConnectDB connectDB = new ConnectDB();
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        string user = UserName.Text;
        string email = Email.Text;
        string pass = Password.Text;
        string query = "INSERT INTO Users (username,email,password) VALUES ('"+user+"','"+email+"','"+pass+"')";
        if (connectDB.executeNonQuery(query)) {
            Message.Text = "Account created";
        }
        else
        {
            Message.Text = "Account creating failed";
        }
    }
}