using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.message
{
    public partial class confirm_buttons : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 页面第一次加载
            }
            else
            {
                string eventArg = GetRequestEventArgument();
                if (eventArg == "ConfirmOK")
                {
                    ShowNotify("你点击了[直接退出]按钮！");
                }
                else
                {
                    ShowNotify("你点击了[不退出]按钮！");
                }
            }
        }


    }
}
