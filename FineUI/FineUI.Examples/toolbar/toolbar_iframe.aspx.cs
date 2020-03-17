using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.toolbar
{
    public partial class toolbar_iframe : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(String.Format("updateIFrameUrl('{0}');", ResolveUrl("~/basic/login.aspx")));
        }
    }
}