using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.master
{
    public partial class formlist : PageBase, ISingleGridPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 父面板增加 5px 的内边距（显示表格的边框时，看起来比较美观）
                (Master.FindControl("Panel1") as Panel).BodyPadding = "5px";

                BindGrid();
            }
        }

        #region BindGrid

        /// <summary>
        /// [ISingleGridPage]重新绑定表格
        /// </summary>
        public void BindGrid()
        {
            // 1.设置总项数（特别注意：数据库分页一定要设置总记录数RecordCount）
            Grid1.RecordCount = GetTotalCount();

            // 2.获取当前分页数据
            DataTable table = GetPagedDataTable();

            // 3.绑定到Grid
            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        /// <summary>
        /// 模拟返回总项数
        /// </summary>
        /// <returns></returns>
        private int GetTotalCount()
        {
            return DataSourceUtil.GetDataTable2().Rows.Count;
        }

        /// <summary>
        /// 模拟数据库分页
        /// </summary>
        /// <returns></returns>
        private DataTable GetPagedDataTable()
        {
            int pageIndex = Grid1.PageIndex;
            int pageSize = Grid1.PageSize;

            string sortField = Grid1.SortField;
            string sortDirection = Grid1.SortDirection;

            DataTable table2 = DataSourceUtil.GetDataTable2();

            DataView view2 = table2.DefaultView;
            view2.Sort = String.Format("{0} {1}", sortField, sortDirection);

            DataTable table = view2.ToTable();

            DataTable paged = table.Clone();

            int rowbegin = pageIndex * pageSize;
            int rowend = (pageIndex + 1) * pageSize;
            if (rowend > table.Rows.Count)
            {
                rowend = table.Rows.Count;
            }

            for (int i = rowbegin; i < rowend; i++)
            {
                paged.ImportRow(table.Rows[i]);
            }

            return paged;
        }

        #endregion
        
        #region ISingleGridPage

        /// <summary>
        /// [ISingleGridPage]删除表格数据
        /// </summary>
        public void DeleteSelectedRows()
        {
            Alert.ShowInTop("删除选中的 " + Grid1.SelectedRowIndexArray.Length + " 项纪录！");
        }

        /// <summary>
        /// [ISingleGridPage]主表格实例
        /// </summary>
        public Grid Grid
        {
            get
            {
                return Grid1;
            }
        }

        /// <summary>
        /// [ISingleGridPage]获取新增地址
        /// </summary>
        /// <returns></returns>
        public string GetNewUrl()
        {
            return "~/grid/grid_iframe_window.aspx";
        }

        /// <summary>
        /// [ISingleGridPage]获取编辑地址
        /// </summary>
        /// <returns></returns>
        public string GetEditUrl()
        {
            object[] keys = Grid1.DataKeys[Grid1.SelectedRowIndex];
            return String.Format("~/grid/grid_iframe_window.aspx?id={0}&name={1}", keys[0], HttpUtility.UrlEncode(keys[1].ToString()));
        } 

        #endregion


        #region Events

        protected void btnImport_Click(object sender, EventArgs e)
        {
            Alert.ShowInTop("尚未实现！");
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            Alert.ShowInTop("尚未实现！");
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Alert.ShowInTop("尚未实现！");
        } 

        #endregion

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ttbSearch_Trigger1Click(object sender, EventArgs e)
        {
            ttbSearch.Text = String.Empty;
            ttbSearch.ShowTrigger1 = false;

            Alert.ShowInTop("尚未实现！");
        }

        protected void ttbSearch_Trigger2Click(object sender, EventArgs e)
        {
            ttbSearch.ShowTrigger1 = true;

            Alert.ShowInTop("尚未实现！");
        }

    }
}
