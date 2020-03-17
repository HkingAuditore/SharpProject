using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.message
{
    public partial class alert : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHello_Click(object sender, EventArgs e)
        {
            
            Alert alert = new Alert();
            alert.CssClass = "myalert";
            alert.Message = "你好 FineUI！";
            alert.Icon = Icon.Book;
            alert.Show();

        }

        protected void btnHello2_Click(object sender, EventArgs e)
        {

            Alert alert = new Alert();
            alert.Message = "你好 FineUI！";
            alert.IconUrl = "~/res/images/success.png";
            alert.Target = Target.Top;
            alert.Show();

        }

    }
}
