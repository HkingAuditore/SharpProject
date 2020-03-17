using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.other
{
    public partial class global_error : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //System.Threading.Thread.Sleep(5000);

            PageContext.RegisterStartupScript("test();");
        }

      
    }
}