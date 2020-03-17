using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

using Newtonsoft.Json.Linq;

namespace FineUI.Examples.grid
{
    public partial class grid_editor_cell_newdelete_getmergeddata : PageBase
    {
        private bool AppendToEnd = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 删除选中单元格的客户端脚本
                string deleteScript = GetDeleteScript(Grid1);

                // 新增数据初始值
                JObject defaultObj = new JObject();
                defaultObj.Add("Name", "新用户");
                defaultObj.Add("Gender", "1");
                defaultObj.Add("EntranceYear", "2015");
                defaultObj.Add("EntranceDate", "2015-09-01");
                defaultObj.Add("AtSchool", false);
                defaultObj.Add("Major", "化学系");
                defaultObj.Add("Delete", String.Format("<a href=\"javascript:;\" onclick=\"{0}\"><img src=\"{1}\"/></a>", deleteScript, IconHelper.GetResolvedIconUrl(Icon.Delete)));

                // 在第一行新增一条数据
                btnNew.OnClientClick = Grid1.GetAddNewRecordReference(defaultObj, AppendToEnd);

                // 重置表格
                btnReset.OnClientClick = Confirm.GetShowReference("确定要重置表格数据？", String.Empty, Grid1.GetRejectChangesReference(), String.Empty);

                
                // 删除选中行按钮
                btnDelete.OnClientClick = Grid1.GetNoSelectionAlertReference("请至少选择一项！") + deleteScript;


                // 绑定表格
                BindGrid();
            }
        }

        //// 删除选中行的脚本
        //private string GetDeleteScript()
        //{
        //    return Confirm.GetShowReference("删除选中行？", String.Empty, MessageBoxIcon.Question, Grid1.GetDeleteSelectedRowsReference(), String.Empty);
        //}
        

        #region BindGrid

        private void BindGrid()
        {
            DataTable table = GetSourceData();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        #endregion

        #region Events

        protected void Grid1_PreDataBound(object sender, EventArgs e)
        {
            // 设置LinkButtonField的点击客户端事件
            LinkButtonField deleteField = Grid1.FindColumn("Delete") as LinkButtonField;
            deleteField.OnClientClick = GetDeleteScript(Grid1);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Grid1.GetModifiedData().Count == 0)
            {
                Alert.Show("表格数据没有变化！");
                return;
            }

            // 复制原始表格的结构
            DataTable newTable = GetSourceData().Clone();
            DataRow newRow;

            JArray mergedData = Grid1.GetMergedData();
            foreach (JObject mergedRow in mergedData)
            {
                string status = mergedRow.Value<string>("status");
                int rowIndex = mergedRow.Value<int>("index");
                JObject values = mergedRow.Value<JObject>("values");

                newRow = newTable.NewRow();
                newRow[0] = rowIndex; // 将行标识符设置为行索引号
                newRow[1] = values.Value<string>("Name");
                newRow[2] = values.Value<int>("EntranceYear");
                newRow[3] = values.Value<bool>("AtSchool");
                newRow[4] = values.Value<string>("Major");
                newRow[5] = values.Value<int>("Gender");
                newRow[6] = values.Value<string>("EntranceDate");
                newTable.Rows.Add(newRow);
            }

            // 更新数据源
            Session[KEY_FOR_DATASOURCE_SESSION] = newTable;

            
            labResult.Text = String.Format("用户修改的数据：<pre>{0}</pre>", Grid1.GetModifiedData().ToString(Newtonsoft.Json.Formatting.Indented));
            
            BindGrid();

            Alert.Show("数据保存成功！（表格数据已重新绑定）");
        }

        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grid_editor_cell_newdelete_getmergeddata";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private DataTable GetSourceData()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                Session[KEY_FOR_DATASOURCE_SESSION] = DataSourceUtil.GetSimpleDataTable();
            }
            return (DataTable)Session[KEY_FOR_DATASOURCE_SESSION];
        }
        #endregion
    }
}
