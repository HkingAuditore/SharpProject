using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Examples.iframe
{
    public partial class passvalue_iframe : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string openUrl = String.Format("./passvalue_iframe_iframe.aspx?selected=<script>encodeURIComponent({0})</script>", tbxProvince.GetValueReference());

                Button1.OnClientClick = Window1.GetSaveStateReference(tbxProvince.ClientID)
                    + Window1.GetShowReference(openUrl);
            }

        }

        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            Alert.ShowInTop("触发了 Window1 的关闭事件！");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string openUrl = String.Format("./passvalue_iframe_iframe.aspx?selected={0}", HttpUtility.UrlEncode(tbxProvince.Text));

            PageContext.RegisterStartupScript(Window1.GetSaveStateReference(tbxProvince.ClientID)
                    + Window1.GetShowReference(openUrl));
        }

    }
}
