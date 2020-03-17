<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_groupheader_hidden.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_groupheader_hidden" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格"  EnableCollapse="true" Width="800px" runat="server"
            DataKeyNames="Guid" AllowSorting="true" SortField="HZData1"
            SortDirection="ASC" OnSort="Grid1_Sort" EnableHeaderMenu="true">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Year" Width="80px" HeaderText="统计年份" />
                <f:BoundField BoxFlex="1" DataField="LogTime" DataFormatString="{0:yyyy-MM-dd}" HeaderText="记录时间" />
                <f:GroupField HeaderText="安徽省" TextAlign="Center">
                    <Columns>
                        <f:GroupField HeaderText="合肥市" TextAlign="Center">
                            <Columns>
                                <f:BoundField Width="100px" DataField="AHData1" SortField="AHData1" HeaderText="数据一"
                                    TextAlign="Center" />
                                <f:BoundField Width="100px" DataField="AHData2" SortField="AHData2" HeaderText="数据二"
                                    TextAlign="Center" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:GroupField HeaderText="河南省" BoxFlex="1" TextAlign="Center">
                    <Columns>
                        <f:GroupField HeaderText="驻马店市" TextAlign="Center">
                            <Columns>
                                <f:BoundField DataField="HZData1" SortField="HZData1" HeaderText="数据一"
                                    TextAlign="Center" />
                                <f:BoundField Width="100px" DataField="HZData2" SortField="HZData2" HeaderText="数据二"
                                    TextAlign="Center" />
                            </Columns>
                        </f:GroupField>
                        <f:GroupField HeaderText="漯河市" Hidden="true" TextAlign="Center">
                            <Columns>
                                <f:BoundField Width="100px" DataField="HLData1" SortField="HLData1" HeaderText="数据一"
                                    TextAlign="Center" />
                                <f:BoundField Width="100px" DataField="HLData2" SortField="HLData2" HeaderText="数据二"
                                    TextAlign="Center" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
            </Columns>
        </f:Grid>
        <br />
        <br />
        注：初始隐藏[河南省]下面的[漯河市]。
    </form>
</body>
</html>
