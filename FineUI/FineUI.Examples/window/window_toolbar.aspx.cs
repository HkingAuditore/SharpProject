using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Examples.window
{
    public partial class window_toolbar : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label labTextInWindow = Window2.FindControl("labTextInWindow") as Label;
                labTextInWindow.Text = "这是初始值！";
            }
        }


        protected void btnClose_Click(object sender, EventArgs e)
        {
            Window2.Hidden = true;
        }

        protected void btnChangeText_Click(object sender, EventArgs e)
        {
            Label labTextInWindow = Window2.FindControl("labTextInWindow") as Label;
            labTextInWindow.Text = "这是修改后的值！" + DateTime.Now.ToLongTimeString();
        }

    }
}
