using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Books : Page
{
    ConnectDB connectDB = new ConnectDB();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DataList1_ItemCommand(object source,DataListCommandEventArgs e)
    {
        if (Session["user_id"] == null)
        {
            Response.Redirect("Login");
        }
        if (e.CommandName == "AddToCart")
        {
            DataList1.SelectedIndex = e.Item.ItemIndex;
            Label id = DataList1.SelectedItem.FindControl("book_idLabel") as Label;
            string query = "INSERT INTO Cart (user_id,book_id,quantity) VALUES ('" + Session["user_id"] +"','"+Convert.ToInt32(id.Text)+"','1')";
            connectDB.executeNonQuery(query);
        }
    }

    protected void btnTitleSearch_Click(object sender, EventArgs e)
    {
        BooksTB.SelectCommand = "SELECT b.book_id,b.cover_image, b.title, b.price, b.instock, b.publication_year, c.category_name, a.author_name FROM Authors AS a INNER JOIN Books AS b ON a.author_id = b.author_id INNER JOIN Categories AS c ON c.category_id = b.category_id WHERE b.title LIKE '%"+txtSearch.Text+"%'";
        DataList1.DataBind();
    }

    protected void btnCategorySearch_Click(object sender, EventArgs e)
    {
        BooksTB.SelectCommand = "SELECT b.book_id,b.cover_image, b.title, b.price, b.instock, b.publication_year, c.category_name, a.author_name FROM Authors AS a INNER JOIN Books AS b ON a.author_id = b.author_id INNER JOIN Categories AS c ON c.category_id = b.category_id WHERE c.category_name LIKE '%" + txtSearch.Text + "%'";
        DataList1.DataBind();
    }

    protected void btnAuthorSearch_Click(object sender, EventArgs e)
    {
        BooksTB.SelectCommand = "SELECT b.book_id,b.cover_image, b.title, b.price, b.instock, b.publication_year, c.category_name, a.author_name FROM Authors AS a INNER JOIN Books AS b ON a.author_id = b.author_id INNER JOIN Categories AS c ON c.category_id = b.category_id WHERE a.author_name LIKE '%" + txtSearch.Text + "%'";
        DataList1.DataBind();
    }

    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        BooksTB.SelectCommand = "SELECT b.book_id,b.cover_image, b.title, b.price, b.instock, b.publication_year, c.category_name, a.author_name FROM Authors AS a INNER JOIN Books AS b ON a.author_id = b.author_id INNER JOIN Categories AS c ON c.category_id = b.category_id";
        DataList1.DataBind();
    }
}