


Ext.apply(F.ajax, {
    errorMsg: "Error! {0} ({1})",
	timeoutErrorMsg: "Request timeout, please refresh the page and try again!"
});

Ext.apply(F.util, {
    alertTitle: "Alert Dialog",
    confirmTitle: "Confirm Dialog",
    //formAlertMsg: "Please provide valid value for {0}!",
    formAlertTitle: "Form Invalid",
    loading: "Loading..."
});

Ext.apply(F.wnd, {
    closeButtonTooltip: "Close this window",
    formChangeConfirmMsg: "Current form has been modified, abandon changes?"
});



//if (Ext.ux.SimplePagingToolbar) {
//    Ext.apply(Ext.ux.SimplePagingToolbar.prototype, {
//        beforePageText: "Page",
//        afterPageText: "of {0}",
//        firstText: "First Page",
//        prevText: "Previous Page",
//        nextText: "Next Page",
//        lastText: "Last Page",
//        displayMsg: "Displaying {0} - {1} of {2}",
//        emptyMsg: 'No data to display'
//    });
//}

if (Ext.ux.TabCloseMenu) {
    Ext.apply(Ext.ux.TabCloseMenu.prototype, {
        closeTabText: "Close Tab",
        closeOthersTabsText: "Close Other Tabs",
        closeAllTabsText: "Close All Tabs"
    });
}

if (Ext.ux.form && Ext.ux.form.FileUploadField) {
    Ext.apply(Ext.ux.form.FileUploadField.prototype, {
        buttonText: "Browse..."
    });
}


if (Ext.panel.Panel) {
    Ext.apply(Ext.panel.Panel.prototype, {
        collapseToolText: 'Collapse panel',
        expandToolText: 'Expand panel'
    });
}

if (Ext.window.Window) {
    Ext.apply(Ext.window.Window.prototype, {
        closeToolText: 'Close window'
    });
}

if (Ext.window.MessageBox) {
    Ext.apply(Ext.window.MessageBox.prototype, {
        closeToolText: 'Close dialog'
    });
}

if (Ext.form.field.Number) {
    Ext.apply(Ext.form.field.Number.prototype, {
        negativeText: 'The value cannot be negative'
    });
}
