using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace RENTAL
{
    public partial class Paymentgateway : System.Web.UI.Page
    {
        string str;
        protected void Page_Load(object sender, EventArgs e)
        {
            string orderid;
           // string redirectUrl="";
            orderid = Request.QueryString["orderid"] ;
            Response.Write("<form action='https://www.sandbox.paypal.com/cgi-bin/webscr' method='post'name='buyCredits' id='buyCredits'>");
            Response.Write("<input type='hidden' name='cmd' value='_xclick'>");
            Response.Write("<input type='hidden' name='business'value='sgurav2067@gmail.com'>");
            Response.Write("<input type='hidden' name='currency_code' value='INR'>");
            Response.Write("<input type='hidden' name='item_name' value='Payment for Renting'>");
            Response.Write("<input type='hidden' name='item_number' value='0'>");
            Response.Write("<input type='hidden' name='amount' value='" + Session["total"].ToString() + "'>");
            Response.Write("<input type='hidden' name='return' value='https://localhost:44350/PlaceOrderSuccessfully.aspx?orderid=" +orderid + "'>");
            Response.Write("</form>");


            Response.Write("<script type='text/javascript'>");
            Response.Write("document.getElementById('buyCredits').submit();");
            Response.Write("</script>");



            /*redirectUrl += "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=" + "sgurav2067@gmail.com";



            //First name I assign static based on login details assign this value

            redirectUrl += "&first_name=Sukanya_Seller";



            //Product Name

            redirectUrl += "&item_name=" + "produts";


            redirectUrl += "&currency_code=" + "INR";



            //Product Amount

            redirectUrl += "&amount=" + Session["total"].ToString();



            //Business contact paypal EmailID

            redirectUrl += "&business=sgurav2067@gmail.com";



            //Shipping charges if any, or available or using shopping cart system

            redirectUrl += "&shipping=5";



            //Handling charges if any, or available or using shopping cart system

            redirectUrl += "&handling=5";



            //Tax charges if any, or available or using shopping cart system

            redirectUrl += "&tax=5";



            //Quantiy of product, Here statically added quantity 1

            redirectUrl += "&quantity=1";



            //If transactioin has been successfully performed, redirect SuccessURL page- this page will be designed by developer

            redirectUrl += "&return=" + "https://localhost:44350/PlaceOrderSuccessfully.aspx?orderid=" + orderid;



            Response.Redirect(redirectUrl);


            redirectUrl += "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=" + "sgurav2067@gmail.com";



            //First name I assign static based on login details assign this value

            redirectUrl += "&first_name=Sukanya_Seller";



            //Product Name

            redirectUrl += "&item_name=" + "produts";


            redirectUrl += "&currency_code=" + "INR";



            //Product Amount

            redirectUrl += "&amount=" + Session["total"].ToString();



            //Business contact paypal EmailID

            redirectUrl += "&business=sgurav2067@gmail.com";



            //Shipping charges if any, or available or using shopping cart system

            redirectUrl += "&shipping=5";



            //Handling charges if any, or available or using shopping cart system

            redirectUrl += "&handling=5";



            //Tax charges if any, or available or using shopping cart system

            redirectUrl += "&tax=5";



            //Quantiy of product, Here statically added quantity 1

            redirectUrl += "&quantity=1";



            //If transactioin has been successfully performed, redirect SuccessURL page- this page will be designed by developer

            redirectUrl += "&return=" + "https://localhost:44350/PlaceOrderSuccessfully.aspx?orderid=" + orderid;



            Response.Redirect(redirectUrl);
*/




        }

    }
}