using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Examples.tabstrip
{
    public partial class tabstrip_addtab : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnAddTab1.OnClientClick = TabStrip1.GetAddTabReference("dynamic_tab1", "http://fineui.com/version_pro/", "专业版", IconHelper.GetIconUrl(Icon.Application), true);
                btnAddTab2.OnClientClick = TabStrip1.GetAddTabReference("dynamic_tab2", "http://fineui.com/version/", "开源版", IconHelper.GetIconUrl(Icon.ApplicationAdd), true);
                btnRemoveTab1.OnClientClick = TabStrip1.GetRemoveTabReference("dynamic_tab1");
                btnRemoveTab2.OnClientClick = TabStrip1.GetRemoveTabReference("dynamic_tab2");
            }
        }

        protected void btnAddTab3_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(TabStrip1.GetAddTabReference("dynamic_tab3", "http://fineui.com/version_pro/", "专业版（服务器）", IconHelper.GetIconUrl(Icon.Application), true));
        }

        protected void btnAddTab4_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(TabStrip1.GetAddTabReference("dynamic_tab4", "http://fineui.com/version/", "开源版（服务器）", IconHelper.GetIconUrl(Icon.ApplicationAdd), true));
        }

        protected void btnRemoveTab3_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(TabStrip1.GetRemoveTabReference("dynamic_tab3"));
        }

        protected void btnRemoveTab4_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(TabStrip1.GetRemoveTabReference("dynamic_tab4"));
        }

    }
}
