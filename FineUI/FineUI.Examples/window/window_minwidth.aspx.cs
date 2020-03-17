using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Examples.window
{
    public partial class window_minwidth : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnShowWindow.OnClientClick = Window1.GetShowReference();

                btnCloseWindow.OnClientClick = Window1.GetHideReference();
            }
        }

    }
}
