using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Examples.window
{
    public partial class panel_disabled : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnToolbarButton.OnClientClick = Alert.GetShowReference("你点击了工具栏按钮");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel1.Enabled = !Panel1.Enabled;
        }

    }
}
