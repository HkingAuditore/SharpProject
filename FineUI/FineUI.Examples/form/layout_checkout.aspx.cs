using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.form
{
    public partial class layout_checkout : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbxSameAsContactAddress_CheckedChanged(object sender, CheckedEventArgs e)
        {
            tbxBillingAddress.Enabled = !e.Checked;
            tbxBillingProvince.Enabled = !e.Checked;
            tbxBillingCity.Enabled = !e.Checked;
            tbxBillingPostCode.Enabled = !e.Checked;
        }
    }
}