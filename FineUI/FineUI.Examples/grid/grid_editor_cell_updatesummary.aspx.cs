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
    public partial class grid_editor_cell_updatesummary : PageBase
    {
        private bool AppendToEnd = true;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 绑定表格
                BindGrid();
            }
        }

        #region OutputSummaryData

        private void OutputSummaryData()
        {
            DataTable source = GetSourceData();

            int chineseTotal = 0;
            int mathTotal = 0;
            foreach (DataRow row in source.Rows)
            {
                chineseTotal += Convert.ToInt32(row["ChineseScore"]);
                mathTotal += Convert.ToInt32(row["MathScore"]);
            }


            JObject summary = new JObject();
            summary.Add("ChineseScore", chineseTotal);
            summary.Add("MathScore", mathTotal);


            Grid1.SummaryData = summary;

        }

        #endregion

        #region BindGrid

        private void BindGrid()
        {
            DataTable table = GetSourceData();

            Grid1.DataSource = table;
            Grid1.DataBind();

            OutputSummaryData();
        }



        #endregion

        #region Events

        private DataRow CreateNewData(DataTable table, Dictionary<string, object> newAddedData)
        {
            DataRow rowData = table.NewRow();

            // 设置行ID（模拟数据库的自增长列）
            rowData["Id"] = GetNextRowID();
            UpdateDataRow(newAddedData, rowData);

            return rowData;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // 修改的现有数据
            Dictionary<int, Dictionary<string, object>> modifiedDict = Grid1.GetModifiedDict();
            foreach (int rowIndex in modifiedDict.Keys)
            {
                int rowID = Convert.ToInt32(Grid1.DataKeys[rowIndex][0]);
                DataRow row = FindRowByID(rowID);

                UpdateDataRow(modifiedDict[rowIndex], row);
            }


            // 删除现有数据
            List<int> deletedRows = Grid1.GetDeletedList();
            foreach (int rowIndex in deletedRows)
            {
                int rowID = Convert.ToInt32(Grid1.DataKeys[rowIndex][0]);
                DeleteRowByID(rowID);
            }


            // 新增数据
            List<Dictionary<string, object>> newAddedList = Grid1.GetNewAddedList();
            DataTable table = GetSourceData();
            if (AppendToEnd)
            {
                for (int i = 0; i < newAddedList.Count; i++)
                {
                    DataRow rowData = CreateNewData(table, newAddedList[i]);
                    table.Rows.Add(rowData);
                }
            }
            else
            {
                for (int i = newAddedList.Count - 1; i >= 0; i--)
                {
                    DataRow rowData = CreateNewData(table, newAddedList[i]);
                    table.Rows.InsertAt(rowData, 0);
                }
            }


            labResult.Text = String.Format("用户修改的数据：<pre>{0}</pre>", Grid1.GetModifiedData().ToString(Newtonsoft.Json.Formatting.Indented));
            
            BindGrid();

            ShowNotify("数据保存成功！（表格数据已重新绑定）");
        }

        private void UpdateDataRow(Dictionary<string, object> rowDict, DataRow rowData)
        {
            // 姓名
            UpdateDataRow("Name", rowDict, rowData);

            // 性别
            UpdateDataRow("Gender", rowDict, rowData);

            // 所学专业
            UpdateDataRow("Major", rowDict, rowData);

            // 语文成绩
            UpdateDataRow("ChineseScore", rowDict, rowData);

            // 数学成绩
            UpdateDataRow("MathScore", rowDict, rowData);

            // 总成绩
            UpdateDataRow("TotalScore", rowDict, rowData);

        }

        private void UpdateDataRow(string columnName, Dictionary<string, object> rowDict, DataRow rowData)
        {
            if (rowDict.ContainsKey(columnName))
            {
                rowData[columnName] = rowDict[columnName];
            }
        }


        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grid_editor_cell_updatesummary";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private DataTable GetSourceData()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                Session[KEY_FOR_DATASOURCE_SESSION] = DataSourceUtil.GetDataTable();
            }
            return (DataTable)Session[KEY_FOR_DATASOURCE_SESSION];
        }

        // 根据行ID来获取行数据
        private DataRow FindRowByID(int rowID)
        {
            DataTable table = GetSourceData();
            foreach (DataRow row in table.Rows)
            {
                if (Convert.ToInt32(row["Id"]) == rowID)
                {
                    return row;
                }
            }
            return null;
        }

        // 根据行ID来删除行数据
        private void DeleteRowByID(int rowID)
        {
            DataTable table = GetSourceData();

            DataRow found = FindRowByID(rowID);
            if (found != null)
            {
                table.Rows.Remove(found);
            }
        }

        // 模拟数据库的自增长列
        private int GetNextRowID()
        {
            int maxID = 0;
            DataTable table = GetSourceData();
            foreach (DataRow row in table.Rows)
            {
                int currentRowID = Convert.ToInt32(row["Id"]);
                if (currentRowID > maxID)
                {
                    maxID = currentRowID;
                }
            }
            return maxID + 1;
        }

        #endregion

    }
}
