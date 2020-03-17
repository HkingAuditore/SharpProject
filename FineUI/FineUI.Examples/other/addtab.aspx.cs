using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.other
{
    public partial class addtab : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript("closeActiveTab();");

            //PageContext.RegisterStartupScript("alert('ok');");
        }

    }
}