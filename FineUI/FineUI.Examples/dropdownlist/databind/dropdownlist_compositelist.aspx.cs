using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FineUI.Examples.dropdownlist
{
    public partial class dropdownlist_compositelist : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEnumrableToDropDownList();
            }
        }

        #region CustomClass

        public class CustomClass
        {
            private string _id;

            public string ID
            {
                get { return _id; }
                set { _id = value; }
            }
            private string _name;

            public string Name
            {
                get { return _name; }
                set { _name = value; }
            }

            public CustomClass(string id, string name)
            {
                _id = id;
                _name = name;
            }
        }
        #endregion

        #region BindEnumrableToDropDownList

        private void BindEnumrableToDropDownList()
        {
            List<CustomClass> myList = new List<CustomClass>();
            myList.Add(new CustomClass("1", "可选项1"));
            myList.Add(new CustomClass("2", "可选项2"));
            myList.Add(new CustomClass("3", "可选项3"));
            myList.Add(new CustomClass("4", "可选项4"));
            myList.Add(new CustomClass("5", "可选项5"));
            myList.Add(new CustomClass("6", "可选项6"));
            myList.Add(new CustomClass("7", "可选择项7"));
            myList.Add(new CustomClass("8", "可选择项8"));
            myList.Add(new CustomClass("9", "可选择项9"));

            DropDownList1.DataTextField = "Name";
            DropDownList1.DataValueField = "ID";
            DropDownList1.DataSource = myList;
            DropDownList1.DataBind();

        }

        #endregion

        #region Events

        protected void btnSelectItem6_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "6";
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
