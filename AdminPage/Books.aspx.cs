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
        if (Session["admin_id"] == null)
        {
            Response.Redirect("Login");
        }
    }

    protected void GridViewBook_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(GridViewBook.SelectedRow.Cells[0].Text);
        BooksTB.DeleteCommand = "DELETE FROM Books WHERE book_id = '" + id +"";
        GridViewBook.DataBind();
    }

    protected void GridViewBook_OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(GridViewBook.SelectedRow.Cells[0].Text);
        string title = GridViewBook.SelectedRow.Cells[2].Text;
        int price = Convert.ToInt32(GridViewBook.SelectedRow.Cells[3].Text);
        int instock = Convert.ToInt32(GridViewBook.SelectedRow.Cells[4].Text);
        int publication_year = Convert.ToInt32(GridViewBook.SelectedRow.Cells[5].Text);
        DropDownList category = GridViewBook.SelectedRow.Cells[6].FindControl("ddlEditCategory") as DropDownList;
        DropDownList author = GridViewBook.SelectedRow.Cells[7].FindControl("ddlEditAuthor") as DropDownList;
        BooksTB.UpdateCommand = "UPDATE Books SET title='"+title+"', price="+price+",instock='"+instock+"',publication_year='"+publication_year+"',category_id='"+ category.SelectedValue +"',author_id='"+author.SelectedValue +"' WHERE book_id='"+id+"'";
        GridViewBook.DataBind();
    }

    protected void btnNew_Click(object sender, EventArgs e)
    { 
        string filePath = "";
        if (fuCoverImage.HasFile)
        {
            string file_name = fuCoverImage.PostedFile.FileName.ToString();
            filePath = "~/images/" + fuCoverImage.FileName;
            fuCoverImage.SaveAs(MapPath(filePath));
        }
        string query = "INSERT INTO Books (cover_image,title,price,instock,publication_year,category_id,author_id) VALUES ('"+filePath+ "','"+txtTitle.Text+"','"+txtPrice.Text + "','" + txtInstock.Text + "','" + txtPublicationYear.Text + "','" + ddlCategory.SelectedValue + "','" + ddlAuthor.SelectedValue + "')";
        connectDB.executeNonQuery(query);
        GridViewBook.DataBind();
    }
}