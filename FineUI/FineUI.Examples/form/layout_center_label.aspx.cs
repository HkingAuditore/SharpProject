using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.form
{
    public partial class layout_center_label : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnResetForm1.OnClientClick = Form1.GetResetReference();
                
            }
        }

        protected void btnSubmitForm1_Click(object sender, EventArgs e)
        {
            ShowNotify("表单验证并提交成功！");
        }



    }
}
