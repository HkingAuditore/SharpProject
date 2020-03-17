using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.aspnet
{
    public partial class my97 : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            labResult.Text = String.Format("日期一：{0}<br/>日期和时间：{1}",
                DatePicker1.Text,
                tbxMyBox.Text);
        }

    }
}
