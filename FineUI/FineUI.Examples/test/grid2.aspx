<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid2.aspx.cs" Inherits="FineUI.Examples.grid.grid2" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" Width="800px" DataKeyNames="Id,Name" runat="server" Title="表格"
            EnableCheckBoxSelect="true" EnableRowClickEvent="true" EnableRowDeselectEvent="true" >
            <Columns>
                <f:TemplateField>
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="Name" HeaderText="姓名" />
                <f:TemplateField HeaderText="性别">
                    <ItemTemplate>
                        <%# GetGender(Eval("Gender")) %>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField HeaderText="所学专业" DataTextField="Major" DataTextFormatString="{0}"
                    DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    Target="_blank" ExpandUnusedSpace="true" />
                <f:ImageField DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                    HeaderText="分组">
                </f:ImageField>
            </Columns>
            <Listeners>
                <f:Listener Event="select" Handler="OnGridSelect" />
                <f:Listener Event="deselect" Handler="OnGridDeSelect" />
                <f:Listener Event="selectionchange" Handler="OnGridselectionchange" />
            </Listeners>
        </f:Grid>
    </form>

    <script>

        function OnGridSelect(obj, record, eOpts) {

            console.log('Select:' + record.id);

        }

        function OnGridDeSelect(obj, record, supressed, eOpts) {

            console.log('DeSelect:' + record.id);

        }

        function OnGridselectionchange() {
            console.log('selectionchange');
        }

    </script>
</body>
</html>
