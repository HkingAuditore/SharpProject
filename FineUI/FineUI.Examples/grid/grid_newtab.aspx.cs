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
    public partial class grid_newtab : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //FineUIPro.WindowField windowField1 = Grid1.FindColumn("myWindowField") as FineUIPro.WindowField;
                //windowField1.DataIFrameUrlFormatString = "grid_newtab_window.aspx?id={0}&page={1}&param1=<script>" + TextBox1.GetValueReference() + "</script>";


                btnDelete.OnClientClick = Grid1.GetNoSelectionAlertReference("至少选择一项！");

                JsObjectBuilder joBuilder = new JsObjectBuilder();
                joBuilder.AddProperty("id", "grid_newtab_addnew");
                joBuilder.AddProperty("title", "新增人员");
                joBuilder.AddProperty("iframeUrl", ResolveUrl("~/grid/grid_newtab_window.aspx"));
                joBuilder.AddProperty("refreshWhenExist", true);
                joBuilder.AddProperty("iconFont", "plus");
                btnNew.OnClientClick = String.Format("parent.addExampleTab({0});", joBuilder);

                BindGrid();
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
            joBuilder.AddProperty("id", "grid_newtab_edit_" + id);
            joBuilder.AddProperty("title", "编辑 - " + name);
            joBuilder.AddProperty("iframeUrl", ResolveUrl(String.Format("~/grid/grid_newtab_window.aspx?id={0}&name={1}", id, HttpUtility.UrlEncode(name.ToString()))));
            joBuilder.AddProperty("refreshWhenExist", true);
            joBuilder.AddProperty("iconFont", "pencil");

            // addExampleTab函数定义在default.aspx
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
