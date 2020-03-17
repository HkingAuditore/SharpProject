using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.message
{
    public partial class alert_download_hideiframe : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            else
            {
                string requestArgument = GetRequestEventArgument();

                if (requestArgument == "Confirm_OK")
                {
                    // 非AJAX回发
                    Response.ClearContent();
                    Response.AddHeader("content-disposition", "attachment; filename=alert_download.txt");
                    Response.ContentType = "text/plain";
                    Response.ContentEncoding = System.Text.Encoding.UTF8;
                    Response.Write("这是下载文件的内容！");
                    Response.End();
                }
                if (requestArgument == "Confirm_Cancel")
                {
                    // AJAX回发
                    ShowNotify("点击了取消按钮！");
                }
            }
        }

        
    }
}
