using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.message
{
    public partial class alert_download_hideiframe_window : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnOperation_Click(object sender, EventArgs e)
        {
            // 不要在这里调用F.confirm，因为当前页面要被关闭，因此F.confirm的回调函数可能不能正确执行
            PageContext.RegisterStartupScript(ActiveWindow.GetHideReference() + "parent.showConfirm();");
        }

    }
}
