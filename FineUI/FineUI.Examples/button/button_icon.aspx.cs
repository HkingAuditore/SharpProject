using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.button
{
    public partial class button_icon : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCustomIcon_Click(object sender, EventArgs e)
        {
            if (btnCustomIcon.IconUrl.EndsWith("1.png"))
            {
                btnCustomIcon.IconUrl = "~/res/images/16/8.png";
            }
            else
            {
                btnCustomIcon.IconUrl = "~/res/images/16/1.png";
            }
        }
    }
}
