using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Examples.dropdownlist
{
    public partial class multiselect_enableedit : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnSelectItem6_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "Value6";
        }

        protected void btnGetSelection_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem != null)
            {
                List<string> texts = new List<string>();
                List<string> values = new List<string>();
                foreach (ListItem item in DropDownList1.SelectedItemArray)
                {
                    texts.Add(item.Text);
                    values.Add(item.Value);
                }

                labResult.Text = String.Format("选中项文本：{0}<br/>选中项值：{1}",
                    String.Join("&nbsp;&nbsp;", texts.ToArray()),
                    String.Join("&nbsp;&nbsp;", values.ToArray()));
            }
            else
            {
                labResult.Text = "无选中项";
            }
        }



    }
}
