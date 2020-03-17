

Ext.define('Ext.ux.SimplePagingToolbar', {
    extend: 'Ext.toolbar.Paging',
    alias: 'widget.simplepagingtoolbar',

    cls: 'x-toolbar-paging',

    // Override parent
    initComponent: function () {
        var me = this;

        me.store = Ext.Object.merge({}, me.store, {
            getCount: function () {
                return me.f_recordCount;
            },
            currentPage: me.f_pageIndex + 1
        });

        me.callParent();
    },

    // Override parent
    getPagingItems: function() {
        var items = this.callParent();
        // Remove refresh and separator items.
        return items.slice(0, items.length - 2);
    },

    // Override parent
    getPageData: function () {
        var fromRecord = 0, toRecord = 0;
        if (this.f_databasePaging) {
            fromRecord = (this.f_pageIndex * this.f_pageSize) + 1;
            toRecord = fromRecord + this.f_pageSize - 1;
        } else {
            fromRecord = this.f_startRowIndex + 1;
            toRecord = this.f_endRowIndex + 1;
        }
        if (toRecord > this.f_recordCount) {
            toRecord = this.f_recordCount;
        }

        return {
            total: this.f_recordCount,
            currentPage: this.f_pageIndex + 1,
            pageCount: this.f_pageCount <= 0 ? 1 : this.f_pageCount,
            fromRecord: fromRecord,
            toRecord: toRecord
        };
    },

    f_update: function (configs) {
        var me = this;
        Ext.Object.merge(me, configs);
        me.store.currentPage = me.f_pageIndex + 1;
        

        // �Ƿ���˷�ҳ������Ҫ���¼��� f_startRowIndex ��  f_endRowIndex
        if (!me.f_databasePaging) {
            var startRowIndex = me.f_pageSize * me.f_pageIndex;
            var endRowIndex = (me.f_pageIndex + 1) * me.f_pageSize - 1;
            if(endRowIndex > me.f_recordCount - 1) {
                endRowIndex = me.f_recordCount - 1;
            }
            
            me.f_startRowIndex = startRowIndex;
            me.f_endRowIndex = endRowIndex;
        }

        // v6.0.3�����������ҳ��Ϣ������ʾ����ȷ��9097��
        // onLoad��������getPageData�����õ�f_startRowIndex, f_endRowIndex��������Ҫ���ִ��onLoad
        me.onLoad();

    }

});
