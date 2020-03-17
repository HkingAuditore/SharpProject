<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_lockcolumn_groupheader_sort.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_lockcolumn_groupheader_sort" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="true" Width="800px" runat="server"
            DataKeyNames="Guid" AllowSorting="true" SortField="HZData1" AllowColumnLocking="true"
            SortDirection="ASC" OnSort="Grid1_Sort">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Year" EnableLock="true" Locked="true" Width="100px" HeaderText="统计年份<br>2000-2009" />
                <f:GroupField EnableLock="true" HeaderText="安徽省" TextAlign="Center">
                    <Columns>
                        <f:GroupField EnableLock="true" Locked="true" HeaderText="合肥市" TextAlign="Center">
                            <Columns>
                                <f:BoundField EnableLock="true" Width="100px" DataField="AHData1" SortField="AHData1" HeaderText="数据一"
                                    TextAlign="Center" />
                                <f:BoundField EnableLock="true" Width="100px" DataField="AHData2" SortField="AHData2" HeaderText="数据二"
                                    TextAlign="Center" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:GroupField EnableLock="true" HeaderText="河南省" TextAlign="Center">
                    <Columns>
                        <f:GroupField EnableLock="true" HeaderText="驻马店市" TextAlign="Center">
                            <Columns>
                                <f:BoundField EnableLock="true" Width="100px" DataField="HZData1" SortField="HZData1" ColumnID="HZData1"
                                    HeaderText="数据一" TextAlign="Center" />
                                <f:BoundField EnableLock="true" Width="100px" DataField="HZData2" SortField="HZData2" HeaderText="数据二"
                                    TextAlign="Center" />
                            </Columns>
                        </f:GroupField>
                        <f:GroupField EnableLock="true" HeaderText="漯河市" TextAlign="Center">
                            <Columns>
                                <f:BoundField EnableLock="true" Width="100px" DataField="HLData1" SortField="HLData1" HeaderText="数据一"
                                    TextAlign="Center" />
                                <f:BoundField EnableLock="true" Width="100px" DataField="HLData2" SortField="HLData2" HeaderText="数据二"
                                    TextAlign="Center" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:BoundField EnableLock="true" Width="300px" DataField="LogTime" DataFormatString="{0:yyyy-MM-dd}" HeaderText="记录时间" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        注：ExtJS实现有BUG，本示例默认将“统计年份”和“合肥市”锁定，但实际情况“合肥市”并未被锁定。
    </form>
</body>
</html>
