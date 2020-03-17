using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using System.Xml;

namespace FineUI.Examples.tree
{
    public partial class tree_expand : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Tree1.SelectedNodeID = "zhumadian";
            }
        }

        protected void Tree1_NodeExpand(object sender, TreeNodeEventArgs e)
        {
            labResult.Text = "展开节点：" + e.Node.Text;
        }

        protected void Tree1_NodeCollapse(object sender, TreeNodeEventArgs e)
        {
            labResult.Text = "折叠节点：" + e.Node.Text;
        }

    }
}
