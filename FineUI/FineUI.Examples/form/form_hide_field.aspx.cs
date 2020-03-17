using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.form
{
    public partial class form_hide_field : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void btnSubmitForm2_Click(object sender, EventArgs e)
        {
            ShowNotify("表单验证并提交成功！");
        }


        protected void btnShowHidePhone_Click(object sender, EventArgs e)
        {
            labPhone.Hidden = !labPhone.Hidden;
        }

        protected void btnShowHideTitle_Click(object sender, EventArgs e)
        {
            labTitle.Hidden = !labTitle.Hidden;
        }

        protected void btnShowHideFormRow2_Click(object sender, EventArgs e)
        {
            FormRow2.Hidden = !FormRow2.Hidden;
        }


        protected void btnShowHideFormRow3_Click(object sender, EventArgs e)
        {
            FormRow3.Hidden = !FormRow3.Hidden;
        }
        

        
    }
}
