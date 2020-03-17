﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace FineUI.Examples.form
{
    public partial class checkboxlist_update : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitCheckBoxList2();
            }
        }

        private void InitCheckBoxList2()
        {
            List<TestClass> myList = new List<TestClass>();
            myList.Add(new TestClass("value1", "可选项 1"));
            myList.Add(new TestClass("value2", "可选项 2"));
            myList.Add(new TestClass("value3", "可选项 3"));
            myList.Add(new TestClass("value4", "可选项 4"));
            myList.Add(new TestClass("value5", "可选项 5"));
            myList.Add(new TestClass("value6", "可选项 6"));

            CheckBoxList2.DataTextField = "Name";
            CheckBoxList2.DataValueField = "Id";
            CheckBoxList2.DataSource = myList;
            CheckBoxList2.DataBind();

            CheckBoxList2.SelectedValueArray = new string[] { "value1", "value2", "value3" };

        }

        #region TestClass

        public class TestClass
        {
            private string _id;

            public string Id
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

            public TestClass(string id, string name)
            {
                _id = id;
                _name = name;
            }

        }


        #endregion

        #region Events

        #region CheckBoxList1

        protected void btnUpdateList1_Click(object sender, EventArgs e)
        {
            BindCheckBoxList1();

            //btnUpdateList1.Enabled = false;
        }

        private void BindCheckBoxList1()
        {
            List<TestClass> myList = new List<TestClass>();
            myList.Add(new TestClass("data1", "数据绑定值 1"));
            myList.Add(new TestClass("data2", "数据绑定值 2"));
            myList.Add(new TestClass("data3", "数据绑定值 3"));
            myList.Add(new TestClass("data4", "数据绑定值 4"));

            CheckBoxList1.DataTextField = "Name";
            CheckBoxList1.DataValueField = "Id";
            CheckBoxList1.DataSource = myList;
            CheckBoxList1.DataBind();

            CheckBoxList1.SelectedValueArray = new string[] { "data1", "data3" };

        }

        protected void btnCheckedItemsList1_Click(object sender, EventArgs e)
        {
            Alert.ShowInTop("列表一选中项的值：" + GetCheckedValuesString(CheckBoxList1.SelectedValueArray));
        }


        #endregion

        #region CheckBoxList2

        protected void btnUpdateList2_Click(object sender, EventArgs e)
        {
            BindCheckBoxList2();

            //btnUpdateList2.Enabled = false;
        }

        private void BindCheckBoxList2()
        {
            List<TestClass> myList = new List<TestClass>();
            myList.Add(new TestClass("data1", "数据绑定值 1"));
            myList.Add(new TestClass("data2", "数据绑定值 2"));
            myList.Add(new TestClass("data3", "数据绑定值 3"));
            myList.Add(new TestClass("data4", "数据绑定值 4"));
            myList.Add(new TestClass("data5", "数据绑定值 5"));
            myList.Add(new TestClass("data6", "数据绑定值 6"));

            CheckBoxList2.DataTextField = "Name";
            CheckBoxList2.DataValueField = "Id";
            CheckBoxList2.DataSource = myList;
            CheckBoxList2.DataBind();

            CheckBoxList2.SelectedValueArray = new string[] { "data1", "data3", "data6" };

        }

        protected void btnCheckedItemsList2_Click(object sender, EventArgs e)
        {
            Alert.ShowInTop("列表二选中项的值：" + GetCheckedValuesString(CheckBoxList2.SelectedValueArray));
        }

        #endregion

        #region CheckBoxList3

        protected void btnUpdateList3_Click(object sender, EventArgs e)
        {
            BindCheckBoxList3();

            //btnUpdateList3.Enabled = false;
        }

        private void BindCheckBoxList3()
        {
            List<TestClass> myList = new List<TestClass>();
            myList.Add(new TestClass("data1", "数据绑定值 1"));
            myList.Add(new TestClass("data2", "数据绑定值 2"));
            myList.Add(new TestClass("data3", "数据绑定值 3"));
            myList.Add(new TestClass("data4", "数据绑定值 4"));
            myList.Add(new TestClass("data5", "数据绑定值 5"));
            myList.Add(new TestClass("data6", "数据绑定值 6"));
            myList.Add(new TestClass("data7", "数据绑定值 7"));
            myList.Add(new TestClass("data8", "数据绑定值 8"));
            myList.Add(new TestClass("data9", "数据绑定值 9"));

            CheckBoxList3.DataTextField = "Name";
            CheckBoxList3.DataValueField = "Id";
            CheckBoxList3.DataSource = myList;
            CheckBoxList3.DataBind();

            CheckBoxList3.SelectedValueArray = new string[] { "data1", "data2", "data6", "data7" };

        }

        protected void btnCheckedItemsList3_Click(object sender, EventArgs e)
        {
            Alert.ShowInTop("列表三选中项的值：" + GetCheckedValuesString(CheckBoxList3.SelectedValueArray));
        }

        #endregion

        #region CheckBoxList4

        protected void btnUpdateList4_Click(object sender, EventArgs e)
        {
            if (CheckBoxList4.Items.Count > 0)
            {
                ClearCheckBoxList4();
            }
            else
            {
                BindCheckBoxList4();
            }
        }

        private void BindCheckBoxList4()
        {
            List<TestClass> myList = new List<TestClass>();
            myList.Add(new TestClass("data1", "数据绑定值 1"));
            myList.Add(new TestClass("data2", "数据绑定值 2"));
            myList.Add(new TestClass("data3", "数据绑定值 3"));
            myList.Add(new TestClass("data4", "数据绑定值 4"));
            myList.Add(new TestClass("data5", "数据绑定值 5"));
            myList.Add(new TestClass("data6", "数据绑定值 6"));

            CheckBoxList4.DataTextField = "Name";
            CheckBoxList4.DataValueField = "Id";
            CheckBoxList4.DataSource = myList;
            CheckBoxList4.DataBind();

            CheckBoxList4.SelectedValueArray = new string[] { "data1", "data2" };

        }

        private void ClearCheckBoxList4()
        {
            CheckBoxList4.Items.Clear();
        }

        protected void btnCheckedItemsList4_Click(object sender, EventArgs e)
        {
            Alert.ShowInTop("列表四选中项的值：" + GetCheckedValuesString(CheckBoxList4.SelectedValueArray));
        }

        #endregion

        private string GetCheckedValuesString(string[] array)
        {
            if (array.Length == 0)
            {
                return "无";
            }

            StringBuilder sb = new StringBuilder();
            foreach (string item in array)
            {
                sb.Append(item);
                sb.Append(",");
            }
            return sb.ToString().TrimEnd(',');
        }

        #endregion


    }
}
