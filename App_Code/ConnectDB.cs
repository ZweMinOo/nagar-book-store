using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ConnectDB
/// </summary>
public class ConnectDB
{
    SqlConnection conn;
    

    public ConnectDB()
    {
        string mainconn = ConfigurationManager.ConnectionStrings["NagarBookStore"].ConnectionString;
        conn = new SqlConnection(mainconn);
    }


    public Boolean executeNonQuery(string query)
    {
        try
        {
            SqlCommand sqlCmd = new SqlCommand(query, conn);
            conn.Open();
            sqlCmd.ExecuteNonQuery();
            conn.Close();
            return true;
        }
        catch(Exception e)
        {
            return false;
        }
    }

    public DataTable executeReader(string query)
    {
        try
        {
            SqlCommand sqlCmd = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader reader = sqlCmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            conn.Close();
            return dt;
        }
        catch (Exception e)
        {          
            return null;
        }
    }
}