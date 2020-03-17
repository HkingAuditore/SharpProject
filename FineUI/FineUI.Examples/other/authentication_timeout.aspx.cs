using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.other
{
    public partial class authentication_timeout : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/default.aspx?ReturnUrl=%2fother%2fauthentication_timeout.aspx"));
        }

      
    }
}