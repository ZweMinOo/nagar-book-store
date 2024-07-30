using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart : Page
{
    ConnectDB connectDB = new ConnectDB();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["user_id"] == null)
        {
            Response.Redirect("Login");
        }
        else
        {
            if (!IsPostBack)
            {
                CartTB.SelectCommand = "SELECT b.book_id, b.title, b.cover_image, c.quantity, b.price FROM Users AS u INNER JOIN Cart AS c ON u.user_id = c.user_id INNER JOIN Books AS b ON c.book_id = b.book_id WHERE c.user_id = '" + Session["user_id"] + "'";
                GridViewCart.DataBind();
                if (GridViewCart.Rows.Count == 0)
                {
                    btnOrder.Visible = false;
                }
                else
                {
                    btnOrder.Visible = true;
                }
            }
        }
    }

    protected void GridViewCart_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(GridViewCart.SelectedRow.Cells[0].Text);
        CartTB.DeleteCommand = "DELETE FROM Cart WHERE book_id = '"+id+"' AND user_id = '" + Session["user_id"] + "'";
        GridViewCart.DataBind();
    }

    protected void GridViewCart_OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(GridViewCart.Rows[e.RowIndex].Cells[0].Text);
        TextBox txtQty = GridViewCart.Rows[e.RowIndex].Cells[3].FindControl("txtQty") as TextBox;
        int qty = Convert.ToInt32(txtQty.Text);
        //Response.Write("<script>alert('"+qty.Text+"');</script>");
        CartTB.UpdateCommand = "UPDATE Cart SET quantity = '"+qty+"' WHERE book_id = '" + id + "' AND user_id = '" + Session["user_id"] + "'";
        GridViewCart.DataBind();
    }

    protected void btnOrder_Click(object sender, EventArgs e)
    {
        pnlOrder.Visible = true;
        btnOrder.Visible = false;
    }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        string query = "";

        /** order flow **/
        //get ship deatils
        int user_id = Convert.ToInt32(Session["user_id"]);
        int ship_id = Convert.ToInt32(ddlShipDetails.SelectedValue.ToString());
        string ship_addr = txtShipAddress.Text;
        DateTime today = DateTime.Today;
        string today_date = today.ToString("dd/MM/yyyy");
        string shipped_date = today.AddDays(3).ToString("dd/MM/yyyy");

        //insert order
        query = "INSERT INTO Orders (user_id,ordered_date,ship_id,ship_address,shipped_date) VALUES ('" + user_id + "','" + today_date + "','" + ship_id + "','" + ship_addr + "','" + shipped_date + "')";
        connectDB.executeNonQuery(query);

        //get order_id
        query = "SELECT TOP 1 order_id FROM Orders WHERE user_id = '" + user_id + "' ORDER BY order_id DESC";
        System.Data.DataTable dt = connectDB.executeReader(query);
        int order_id = -1;

        foreach (System.Data.DataRow row in dt.Rows)
        {
            order_id = Convert.ToInt32(row["order_id"]);
        }

        //get cart
        query = "SELECT c.book_id,b.price,c.quantity,b.instock FROM Cart AS c INNER JOIN Books AS b ON c.book_id = b.book_id WHERE c.user_id = '" + user_id +"'";
        dt = connectDB.executeReader(query);

        foreach (System.Data.DataRow row in dt.Rows)
        {
            //insert order_details
            query = "INSERT INTO OrderDetails VALUES ('" + order_id + "','" + Convert.ToInt32(row["book_id"].ToString()) + "','" + Convert.ToInt32(row["price"].ToString()) + "','" + Convert.ToInt32(row["quantity"].ToString()) + "')";
            connectDB.executeNonQuery(query);

            int qty = Convert.ToInt32(row["quantity"].ToString());
            int instock = Convert.ToInt32(row["instock"].ToString());
            instock = instock - qty;
            //update books
            query = "UPDATE Books SET instock = " + instock + " WHERE book_id = '" + Convert.ToInt32(row["book_id"].ToString())+"'";
            connectDB.executeNonQuery(query);
        }

        //delete cart
        query = "DELETE FROM Cart WHERE user_id = '" + user_id + "'";
        connectDB.executeNonQuery(query);
        /** order flow end **/
        Response.Write("<script>alert('Order complete!');</script>");
        CartTB.SelectCommand = "SELECT b.book_id, b.title, b.cover_image, c.quantity, b.price FROM Users AS u INNER JOIN Cart AS c ON u.user_id = c.user_id INNER JOIN Books AS b ON c.book_id = b.book_id WHERE c.user_id = '" + Session["user_id"] + "'";
        GridViewCart.DataBind();
        pnlOrder.Visible = false;


    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        pnlOrder.Visible = false;
        btnOrder.Visible = true;
    }

    protected void ddlShipDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        int fee = 0;
        string query = "SELECT ship_fee FROM Shipping WHERE ship_id ='"+ddlShipDetails.SelectedValue.ToString()+"'";
        DataTable dt = connectDB.executeReader(query);

        foreach (System.Data.DataRow row in dt.Rows)
        {
            fee = Convert.ToInt32(row["ship_fee"]);
        }
        txtShipFee.Text = fee + " MMK";
    }
}