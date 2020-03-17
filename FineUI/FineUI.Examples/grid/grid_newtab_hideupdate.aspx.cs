using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using Newtonsoft.Json.Linq;

namespace FineUI.Examples.grid
{
    public partial class grid_newtab_hideupdate : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //FineUIPro.WindowField windowField1 = Grid1.FindColumn("myWindowField") as FineUIPro.WindowField;
                //windowField1.DataIFrameUrlFormatString = "grid_newtab_window.aspx?id={0}&page={1}&param1=<script>" + TextBox1.GetValueReference() + "</script>";


                btnDelete.OnClientClick = Grid1.GetNoSelectionAlertReference("至少选择一项！");

                JsObjectBuilder joBuilder = new JsObjectBuilder();
                joBuilder.AddProperty("id", "grid_newtab_sametab_addnew");
                joBuilder.AddProperty("title", "新增人员");
                joBuilder.AddProperty("iframeUrl", "getNewWindowUrl()", true);
                joBuilder.AddProperty("refreshWhenExist", true);
                joBuilder.AddProperty("iconFont", "plus");
                btnNew.OnClientClick = String.Format("parent.addExampleTab({0});", joBuilder);

                BindGrid();
            }
            else
            {
                var args = GetRequestEventArgument(); // 此函数所在文件：PageBase.cs
                if (args.StartsWith("UpdatePage$"))
                {
                    string param1 = args.Substring("UpdatePage$".Length);

                    Grid1.Title = "表格 - 来自子页面的参数：" + param1;

                    // 此时可以更新页面上的其他控件，比如表格
                }
            }

            
        }

        #region BindGrid

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        protected string GetEditUrl(object id, object name)
        {
            JsObjectBuilder joBuilder = new JsObjectBuilder();
            joBuilder.AddProperty("id", "grid_newtab_sametab_edit");
            joBuilder.AddProperty("title", "编辑 - " + name);
            joBuilder.AddProperty("iframeUrl", String.Format("getEditWindowUrl('{0}','{1}')", id, HttpUtility.UrlEncode(name.ToString())), true); // ResolveUrl(String.Format("~/grid/grid_newtab_window.aspx?id={0}&name={1}", id, HttpUtility.UrlEncode(name.ToString()))));
            joBuilder.AddProperty("refreshWhenExist", true);
            joBuilder.AddProperty("iconFont", "pencil");

            // addExampleTab函数定义在default.aspx，参数分别为：id, url, text, icon, refreshWhenExist
            return String.Format("parent.addExampleTab({0});", joBuilder);
        }


        #endregion

        #region Events

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            foreach (int row in Grid1.SelectedRowIndexArray)
            {
                sb.Append(Grid1.DataKeys[row][1].ToString());
                sb.Append(",");
            }
            ShowNotify("你选择了删除行：" + sb.ToString().TrimEnd(','));
        }


        protected void Window1_Close(object sender, EventArgs e)
        {
            ShowNotify("弹出窗口关闭了！");
        }

        #endregion

    }
}
