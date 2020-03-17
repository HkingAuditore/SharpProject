using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Examples.iframe
{
    public partial class parent_postback_top2 : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            labResult.Text = "页面加载时间：" + DateTime.Now.ToLongTimeString();
        }

        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Window1.Width = 850;
            Window1.Height = 450;
            Window1.Title = "在顶层页面弹出窗体（改变窗体属性）";
            Window1.IFrameUrl = "~/iframe/parent_postback_top3.aspx";
            Window1.Hidden = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Window1.GetShowReference("~/iframe/parent_postback_top3.aspx", "在顶层页面弹出窗体（直接注册脚本）", 850, 450));
        }


    }
}
