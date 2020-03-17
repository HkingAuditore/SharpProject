using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.form
{
    public partial class triggerbox_triggerboxurl : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        // 点击 TriggerBox 弹出窗口
        protected void tbxMyBox1_TriggerClick(object sender, EventArgs e)
        {
            Window1.Hidden = false;
        }

        // 关闭弹出窗口
        protected void btnCloseWindow_Click(object sender, EventArgs e)
        {
            Window1.Hidden = true;

            tbxMyBox1.Text = "弹出窗口被关闭了";
        }

        // 点击 TwinTriggerBox 的搜索按钮
        protected void ttbxMyBox2_Trigger2Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(ttbxMyBox2.Text))
            {
                // 执行搜索动作
                ShowNotify(String.Format("在关键词“{0}”中搜索", ttbxMyBox2.Text));

                ttbxMyBox2.ShowTrigger1 = true;
            }
            else
            {
                ShowNotify("请输入你要搜索的关键词！");
            }
        }

        // 点击 TwinTriggerBox 的取消按钮
        protected void ttbxMyBox2_Trigger1Click(object sender, EventArgs e)
        {
            // 执行清空动作
            ShowNotify("取消搜索！");

            ttbxMyBox2.Text = "";
            ttbxMyBox2.ShowTrigger1 = false;
        }

       

    }
}
