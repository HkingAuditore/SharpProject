﻿



Ext.apply(F.ajax, {
    errorMsg: "出錯了！{0} ({1})",
	timeoutErrorMsg: "請求超時，請刷新頁面並重試！"
});

Ext.apply(F.util, {
    alertTitle: "提示對話方塊",
    confirmTitle: "確認對話方塊",
    //formAlertMsg: "請為 {0} 提供有效值！",
    formAlertTitle: "表單不完整",
    loading: "正在載入..."
});


Ext.apply(F.wnd, {
    closeButtonTooltip: "關閉此窗口",
    formChangeConfirmMsg: "當前表單已經被修改，確認放棄修改？"
});


if (Ext.ux.SimplePagingToolbar) {
    Ext.apply(Ext.ux.SimplePagingToolbar.prototype, {
        afterPageText: "頁，共 {0} 頁",
        displayMsg: "顯示 {0} - {1} 筆，共 {2} 筆"
    });
}

//if (Ext.ux.SimplePagingToolbar) {
//    Ext.apply(Ext.ux.SimplePagingToolbar.prototype, {
//        beforePageText: "轉到",
//        afterPageText: " 共 {0} 頁",
//        firstText: "第一頁",
//        prevText: "前一頁",
//        nextText: "下一頁",
//        lastText: "最後頁",
//        displayMsg: "顯示 {0} - {1}，共 {2} 條",
//        emptyMsg: "没有資料需要顯示"
//    });
//}

if (Ext.ux.form && Ext.ux.TabCloseMenu) {
    Ext.apply(Ext.ux.TabCloseMenu.prototype, {
        closeTabText: "關閉標籤",
        closeOthersTabsText: "關閉其它標籤",
        closeAllTabsText: "關閉全部標籤"
    });
}

if (Ext.ux.form && Ext.ux.form.FileUploadField) {
    Ext.apply(Ext.ux.form.FileUploadField.prototype, {
        buttonText: "瀏覽..."
    });
}


if (Ext.panel.Panel) {
    Ext.apply(Ext.panel.Panel.prototype, {
        collapseToolText: '折疊面板',
        expandToolText: '展開面板'
    });
}

if (Ext.window.Window) {
    Ext.apply(Ext.window.Window.prototype, {
        closeToolText: '關閉窗體'
    });
}

if (Ext.window.MessageBox) {
    Ext.apply(Ext.window.MessageBox.prototype, {
        closeToolText: '關閉對話框'
    });
}

if (Ext.form.field.Number) {
    Ext.apply(Ext.form.field.Number.prototype, {
        negativeText: '該輸入項不能為負值'
    });
}