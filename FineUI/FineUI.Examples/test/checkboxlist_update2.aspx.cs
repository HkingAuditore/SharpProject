using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace FineUI.Examples.form
{
    public partial class checkboxlist_update2 : PageBase
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

        

        #region CheckBoxList2

        protected void btnUpdateList2_Click(object sender, EventArgs e)
        {
            BindCheckBoxList2();

            //btnUpdateList2.Enabled = false;
        }

        private void BindCheckBoxList2()
        {
            List<TestClass> myList = new List<TestClass>();
            myList.Add(new TestClass("value1", "数据绑定值 1"));
            myList.Add(new TestClass("value2", "数据绑定值 2"));
            myList.Add(new TestClass("value3", "数据绑定值 3"));
            myList.Add(new TestClass("value4", "数据绑定值 4"));
            myList.Add(new TestClass("value5", "数据绑定值 5"));
            myList.Add(new TestClass("value6", "数据绑定值 6"));

            CheckBoxList2.DataTextField = "Name";
            CheckBoxList2.DataValueField = "Id";
            CheckBoxList2.DataSource = myList;
            CheckBoxList2.DataBind();

            CheckBoxList2.SelectedValueArray = new string[] { "value1", "value3", "value6" };

        }

        protected void btnCheckedItemsList2_Click(object sender, EventArgs e)
        {
            Alert.ShowInTop("列表二选中项的值：" + GetCheckedValuesString(CheckBoxList2.SelectedValueArray));
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
