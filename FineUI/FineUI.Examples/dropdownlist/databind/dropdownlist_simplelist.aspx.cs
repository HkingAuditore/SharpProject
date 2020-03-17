using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FineUI.Examples.dropdownlist
{
    public partial class dropdownlist_simplelist : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStringListToDropDownList();
            }
        }

        #region BindStringListToDropDownList

        private void BindStringListToDropDownList()
        {
            List<string> strList = new List<string>();
            strList.Add("可选项1");
            strList.Add("可选项2");
            strList.Add("可选项3");
            strList.Add("可选项4");
            strList.Add("可选项5");
            strList.Add("可选项6");
            strList.Add("可选择项7");
            strList.Add("可选择项8");
            strList.Add("可选择项9");
            strList.Add("这是一个很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的可选项");

            DropDownList1.DataSource = strList;
            DropDownList1.DataBind();

        }
        #endregion

        #region Events

        protected void btnSelectItem6_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "可选项6";
        }

        protected void btnGetSelection_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem != null)
            {
                labResult.Text = String.Format("选中项：{0}（值：{1}）", DropDownList1.SelectedItem.Text, DropDownList1.SelectedValue);
            }
            else
            {
                labResult.Text = "无选中项";
            }
        } 

        #endregion

    }
}
