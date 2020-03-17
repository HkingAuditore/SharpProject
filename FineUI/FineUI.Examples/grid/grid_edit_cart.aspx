<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_edit_cart.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_edit_cart" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .totalpanel .x-panel-body {
            border-top-width: 0 !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel2" runat="server" />
        <f:Panel ID="Panel2" runat="server" ShowBorder="false" Layout="VBox" BoxConfigAlign="Stretch"
            BoxConfigPosition="Start" BodyPadding="5px" BoxConfigChildMargin="0 5 0 0"
            ShowHeader="false">
            <Items>
                <f:Grid ID="Grid1" ShowBorder="true" BoxFlex="1" ShowHeader="true" Title="购物车"
                    EnableCollapse="true" runat="server" EnableCheckBoxSelect="true" CheckBoxSelectOnly="true"
                    DataKeyNames="Id,Code,Name" EnableTextSelection="true">
                    <Columns>
                        <f:RowNumberField />
                        <f:BoundField Width="120px" DataField="Code" DataFormatString="{0}" HeaderText="商品代码" />
                        <f:BoundField DataField="Name" ExpandUnusedSpace="true" DataFormatString="{0}" HeaderText="商品名称" />
                        <f:BoundField Width="120px" DataField="Price" HeaderText="商品单价" DataFormatString="¥{0:F}" />
                        <f:TemplateField HeaderText="数量" Width="120px">
                            <ItemTemplate>
                                <input type="hidden" class="price" runat="server" value='<%# Eval("Price") %>' />
                                <asp:TextBox runat="server" Width="98%" ID="tbxNumber" CssClass="number"
                                    TabIndex='<%# Container.DataItemIndex + 10 %>' Text='<%# Eval("Number") %>'></asp:TextBox>
                            </ItemTemplate>
                        </f:TemplateField>
                        <f:TemplateField HeaderText="小计" Width="120px">
                            <ItemTemplate>
                                <asp:Label runat="server" CssClass="xiaoji" Text='<%# "¥" + GetXiaoji(Eval("Price"), Eval("Number")) %>'></asp:Label>
                            </ItemTemplate>
                        </f:TemplateField>
                    </Columns>
                </f:Grid>
                <f:ContentPanel runat="server" CssClass="totalpanel" ShowBorder="true" ShowHeader="false">
                    <div style="text-align: right; margin: 10px;">
                        <div style="margin-bottom: 10px;">
                            <input type="hidden" id="TOTAL_NUMBER" name="TOTAL_NUMBER" />
                            <span id="totalNumber" style="color: red;"></span>
                            件商品
                        </div>
                        <div style="margin-bottom: 10px;">
                            <input type="hidden" id="TOTAL_PRICE" name="TOTAL_PRICE" />
                            总计：<span id="totalPrice" style="color: red; font-size: 1.5em; font-weight: bold;"></span>
                        </div>
                        <div>
                            <f:Button runat="server" Text="去结算" Enabled="false" Size="Large" ID="btnGotoPay" OnClick="btnGotoPay_Click"></f:Button>
                        </div>
                    </div>
                </f:ContentPanel>
            </Items>
        </f:Panel>
    </form>
    <script src="../res/js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var gridClientID = '<%= Grid1.ClientID %>';
        var btnGotoPayClientID = '<%= btnGotoPay.ClientID %>';
        var numberSelector = '.f-grid-tpl input.number';
        var priceSelector = '.f-grid-tpl input.price';

        function getRowNumber(row) {
            var num = parseInt(row.find(numberSelector).val(), 10);
            if (isNaN(num)) {
                num = 0;
            }
            return num;
        }
        function getRowPrice(row) {
            return parseFloat(row.find(priceSelector).val());
        }

        function updateTotal() {
            var grid = F(gridClientID);
            var selection = grid.getSelectionModel().getSelection();
            var store = grid.getStore();

            var total = 0;
            $.each(selection, function (index, item) {
                var rowIndex = store.indexOf(item);
                var row = $(grid.body.el.dom).find('.x-grid-item').eq(rowIndex);
                total += getRowNumber(row) * getRowPrice(row);
            });

            $('#totalNumber').text(selection.length);
            $('#totalPrice').text("¥" + total.toFixed(2));

            $('#TOTAL_NUMBER').val(selection.length);
            $('#TOTAL_PRICE').val(total.toFixed(2));

            var gotoPayBtn = F(btnGotoPayClientID);
            if (total === 0) {
                gotoPayBtn.disable();
            } else {
                gotoPayBtn.enable();
            }
        }

        // 过滤数字输入框中的无效字符
        function filterNumberInput(inputNode) {
            // 仅保留数字、点号和负号
            //var filterRegex = /[^0-9\.\-]/g;
            // 仅保留数字
            var filterRegex = /[^0-9]/g;

            var originalValue = inputNode.val();
            var filteredValue = originalValue.replace(filterRegex, '');
            if (originalValue !== filteredValue) {
                inputNode.val(filteredValue);
            }
        }

        function registerNumberChangeEvents() {
            var grid = F(gridClientID);

            // 数量改变事件
            // http://stackoverflow.com/questions/17384218/jquery-input-event
            $(grid.el.dom).find(numberSelector).on('input propertychange', function (evt) {
                var cnode = $(this);

                filterNumberInput(cnode);

                var row = cnode.parents('.x-grid-item');
                var number = getRowNumber(row);
                var price = getRowPrice(row);
                var resultNode = row.find('.f-grid-tpl span.xiaoji');

                resultNode.text("¥" + (number * price).toFixed(2));

                updateTotal();
            });
        }

        function registerSelectionChangeEvents() {
            var grid = F(gridClientID);

            grid.on('selectionchange', function (cmp, selected) {
                updateTotal();
            });
        }

        // 页面第一次加载完成后调用的函数
        F.ready(function () {
            registerNumberChangeEvents();
            registerSelectionChangeEvents();
            updateTotal();
        });

    </script>
</body>
</html>
