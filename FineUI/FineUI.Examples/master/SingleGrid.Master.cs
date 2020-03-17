using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.master
{
    public partial class SingleGrid : System.Web.UI.MasterPage
    {
        #region Page
        
        /// <summary>
        /// 重写Page属性
        /// </summary>
        private new ISingleGridPage Page
        {
            get
            {
                return (ISingleGridPage)base.Page;
            }
        } 

        #endregion

        #region Page_Init

        protected void Page_Init(object sender, EventArgs e)
        {
            Page.Grid.EnableRowDoubleClickEvent = true;
            Page.Grid.RowDoubleClick += grid_RowDoubleClick;

            Page.Grid.PageIndexChange += grid_PageIndexChange;
            Page.Grid.Sort += grid_Sort;

            SetToolBar();
            SetGridPageItems();
        }

        private void SetGridPageItems()
        {
            Page.Grid.PageItems.Add(new ToolbarSeparator());

            ToolbarText tbt = new ToolbarText();
            tbt.Text = "每页记录数：";
            Page.Grid.PageItems.Add(tbt);

            DropDownList ddlGridPageSize = new DropDownList();
            ddlGridPageSize.AutoPostBack = true;
            ddlGridPageSize.Items.Add(new ListItem("5", "5"));
            ddlGridPageSize.Items.Add(new ListItem("10", "10"));
            ddlGridPageSize.Items.Add(new ListItem("15", "15"));
            ddlGridPageSize.Items.Add(new ListItem("20", "20"));
            ddlGridPageSize.Width = 80;
            ddlGridPageSize.SelectedIndexChanged += ddlGridPageSize_SelectedIndexChanged;
            // 初始化选中值
            ddlGridPageSize.SelectedValue = Page.Grid.PageSize.ToString();
            Page.Grid.PageItems.Add(ddlGridPageSize);
        }

        private void SetToolBar()
        {
            Toolbar tb;
            if (Page.Grid.Toolbars.Count > 0)
            {
                tb = Page.Grid.Toolbars[0];
            }
            else
            {
                tb = new Toolbar();
                Page.Grid.Toolbars.Add(tb);
            }

            Button btnInsert = new Button();
            btnInsert.ID = "btnInsert";
            btnInsert.Text = "新增";
            btnInsert.Icon = Icon.Add;

            Button btnEdit = new Button();
            btnEdit.ID = "btnEdit";
            btnEdit.Text = "编辑";
            btnEdit.Icon = Icon.PageEdit;


            Button btnDelete = new Button();
            btnDelete.ID = "btnDelete";
            btnDelete.Text = "删除";
            btnDelete.Icon = Icon.Delete;

            btnInsert.Click += btnInsert_Click;
            btnEdit.Click += btnEdit_Click;
            btnDelete.Click += btnDelete_Click;

            
            tb.Items.Insert(0, btnDelete);
            tb.Items.Insert(0, btnEdit);
            tb.Items.Insert(0, btnInsert);

        }
        #endregion

        #region Events

        /// <summary>
        /// 表格每页显示项数改变
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlGridPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            Page.Grid.PageSize = System.Convert.ToInt32(((DropDownList)sender).SelectedValue);

            Page.BindGrid();
        }

        /// <summary>
        /// 点击新增按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Window1.GetShowReference(Page.GetNewUrl(), "新增"));
        }

        /// <summary>
        /// 点击编辑按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (Page.Grid.SelectedRowIndexArray.Length == 0)
            {
                Alert.ShowInTop("请至少选择一条记录！");
                return;
            }

            PageContext.RegisterStartupScript(Window1.GetShowReference(Page.GetEditUrl(), "编辑"));
        }

        /// <summary>
        /// 点击删除按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Page.Grid.SelectedRowIndexArray.Length == 0)
            {
                Alert.ShowInTop("请至少选择一条记录！");
                return;
            }

            Page.DeleteSelectedRows();
        }

       
        /// <summary>
        /// 弹出窗体关闭事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Window1_Close(object sender, EventArgs e)
        {
            Page.BindGrid();
        }


        /// <summary>
        /// 表格行双击（编辑本行）
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grid_RowDoubleClick(object sender, GridRowClickEventArgs e)
        {
            btnEdit_Click(null, null);
        }

        /// <summary>
        /// 表格分页改变事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grid_PageIndexChange(object sender, GridPageEventArgs e)
        {
            //Page.Grid.PageIndex = e.NewPageIndex;
            
            Page.BindGrid();
        }

        /// <summary>
        /// 表格排序事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grid_Sort(object sender, GridSortEventArgs e)
        {
            //Page.Grid.SortDirection = e.SortDirection;
            //Page.Grid.SortField = e.SortField;

            Page.BindGrid();
        }

        #endregion
        
        #region Methods

        public void SetBtnInsertVisible(bool bVisible)
        {
            Toolbar tbToolBar = Page.Grid.Toolbars[0];
            tbToolBar.FindControl("btnInsert").Visible = bVisible;
        }

        public void SetBtnEditVisible(bool bVisible)
        {
            Toolbar tbToolBar = Page.Grid.Toolbars[0];
            tbToolBar.FindControl("btnEdit").Visible = bVisible;
        }

        public void SetBtnDeleteVisible(bool bVisible)
        {
            Toolbar tbToolBar = Page.Grid.Toolbars[0];
            tbToolBar.FindControl("btnDelete").Visible = bVisible;
        }


        #endregion
    }
}
