using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FineUI.Examples.dropdownlist
{
    public partial class dropdownlist_no_forceselection_initvalue : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 设置下拉列表的初始值为自定义文本
                DropDownList1.Text = "初始自定义值";
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
                labResult.Text = String.Format("选中项：{0}（值：{1}）", DropDownList1.SelectedItem.Text, DropDownList1.SelectedValue);
            }
            else
            {
                labResult.Text = String.Format("用户输入值：{0}", DropDownList1.Text);
            }
        }

        protected void btnSetText_Click(object sender, EventArgs e)
        {
            DropDownList1.Text = "用户输入值";
        }

    }
}
