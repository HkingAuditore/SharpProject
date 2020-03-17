using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.master
{
    public partial class Simple : System.Web.UI.MasterPage
    {
        public delegate void ProcessLeftTreeNodeClickDelegate(string treeNodeId, string treeNodeText);
        public ProcessLeftTreeNodeClickDelegate ProcessLeftTreeNodeClick
        {
            get;
            set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Tree1_NodeCommand(object sender, TreeCommandEventArgs e)
        {
            if (ProcessLeftTreeNodeClick != null)
            {
                ProcessLeftTreeNodeClick(e.NodeID, e.Node.Text);
            }
        }

    }
}