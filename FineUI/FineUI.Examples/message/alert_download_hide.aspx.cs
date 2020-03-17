using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.message
{
    public partial class alert_download_hide : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void PageManager1_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventArgument == "Confirm_OK")
            {
                // 非AJAX回发
                Response.ClearContent();
                Response.AddHeader("content-disposition", "attachment; filename=alert_download.txt");
                Response.ContentType = "text/plain";
                Response.ContentEncoding = System.Text.Encoding.UTF8;
                Response.Write("这是下载文件的内容！");
                Response.End();
            }
            else if (e.EventArgument == "Confirm_Cancel")
            {
                // AJAX回发
                ShowNotify("点击了取消按钮！");
            }
        }

        protected void btnOperation_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Window1.GetHideReference() +
                Confirm.GetShowReference("操作成功！点击确定按钮开始下载文件，点取消按钮弹出对话框",
                    String.Empty,
                    MessageBoxIcon.Question,
                    PageManager1.GetCustomEventReference(false, "Confirm_OK"), // 第一个参数 false 用来指定当前不是AJAX请求
                    PageManager1.GetCustomEventReference("Confirm_Cancel")));
        }

    }
}
