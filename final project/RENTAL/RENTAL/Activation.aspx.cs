﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace RENTAL
{
    public partial class Activation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ActivateMyAccount();
            }
        }
        private void ActivateMyAccount()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand();
            try
            {
              
                if ((!string.IsNullOrEmpty(Request.QueryString["UserID"])) & (!string.IsNullOrEmpty(Request.QueryString["EmailId"])))
                {   //approve account by setting Is_Approved to 1 i.e. True in the sql server table
                    cmd = new SqlCommand("UPDATE Users SET Is_Approved=1 WHERE UserId=@UserId AND Email=@Email", con);
                    cmd.Parameters.AddWithValue("@UserID", Request.QueryString["UserID"]);
                    cmd.Parameters.AddWithValue("@Email", Request.QueryString["EmailId"]);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    cmd.ExecuteNonQuery();
                    Response.Write("You account has been activated. You can <a href='https://localhost:44350/Login.aspx'>Login</a> now! ");
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
                return;
            }
            finally
            {
                con.Close();
                cmd.Dispose();
            }
        }
    }
}