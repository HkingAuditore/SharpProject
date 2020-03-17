using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Examples.window
{
    public partial class window_multi : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void btnShowWindow_Click(object sender, EventArgs e)
        {
            string wndID = "Window" + DropDownList1.SelectedValue;
            Window wnd = FindControl(wndID) as Window;

            if (wnd != null)
            {
                PageContext.RegisterStartupScript(wnd.GetShowReference());
            }

        }

    }
}
