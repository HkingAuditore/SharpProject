﻿
(function () {

    // 正在进行中的AJAX请求个数
    var __ajaxUnderwayCount = 0;

    F.ajax = {

        timeoutErrorMsg: "Request timeout, please refresh the page and try again!",
        errorMsg: "Error! {0} ({1})",
        errorWindow: null,

        hookPostBack: function () {
            if (typeof (__doPostBack) != 'undefined') {
                __doPostBack = f__doPostBack;
            }
        }

    };

    function enableAjax() {
        if (typeof (F.controlEnableAjax) === 'undefined') {
            return F.enableAjax;
        }
        return F.controlEnableAjax;
    }

    function enableAjaxLoading() {
        if (typeof (F.controlEnableAjaxLoading) === 'undefined') {
            return F.enableAjaxLoading;
        }
        return F.controlEnableAjaxLoading;
    }

    function ajaxLoadingType() {
        if (typeof (F.controlAjaxLoadingType) === 'undefined') {
            return F.ajaxLoadingType;
        }
        return F.controlAjaxLoadingType;
    }


    function f__doPostBack_internal() {
        //if (typeof (F.util.beforeAjaxPostBackScript) === 'function') {
        //    F.util.beforeAjaxPostBackScript();
        //}
		
		// 如果显式返回false，则阻止AJAX回发
        if(F.util.triggerBeforeAjax() === false) {
			return;
		}


        // Ext.encode will convert Chinese characters. Ext.encode({a:"你好"}) => '{"a":"\u4f60\u597d"}'
        // We will include the official JSON object from http://json.org/
        // 现在还是用的 Ext.encode，在 IETester的 IE8下 JSON.stringify 生成的中文是\u9009\u9879形式。
        //F.util.setHiddenFieldValue('F_STATE', encodeURIComponent(JSON.stringify(getFState())));

        var fstate = Ext.encode(getFState());
        if (Ext.isIE6 || Ext.isIE7) {
            F.util.setHiddenFieldValue('F_STATE_URI', 'true');
            fstate = encodeURIComponent(fstate);
        } else {
            fstate = Base64.encode(fstate);
        }
        F.util.setHiddenFieldValue('F_STATE', fstate);

        //F.util.setHiddenFieldValue('F_STATE', encodeURIComponent(Ext.encode(getFState())));
        if (!enableAjax()) {
            // 当前请求结束后必须重置 F.controlEnableAjax
            F.controlEnableAjax = undefined;
            F.util.setHiddenFieldValue('F_AJAX', 'false');
            theForm.submit();
        } else {
            // 当前请求结束后必须重置 F.controlEnableAjax
            F.controlEnableAjax = undefined;
            F.util.setHiddenFieldValue('F_AJAX', 'true');
            var url = document.location.href;
            var urlHashIndex = url.indexOf('#');
            if (urlHashIndex >= 0) {
                url = url.substring(0, urlHashIndex);
            }

            var viewStateBeforeAJAX = F.util.getHiddenFieldValue('__VIEWSTATE');
            var disabledButtonIdBeforeAJAX = F.getHidden('F_TARGET');

            function processEnd() {
                //隐藏正在加载提示
                ajaxStop();
            }

            function ajaxSuccess(data, viewStateBeforeAJAX) {

                // 如果显式返回false，则阻止AJAX回发
                if (F.util.triggerBeforeAjaxSuccess(data) === false) {
                    processEnd();
                    return;
                }

                try {
                    new Function('__VIEWSTATE', data)(viewStateBeforeAJAX);

                    // 有可能响应返回后即关闭本窗体
                    if (F && F.util) {
                        F.util.triggerAjaxReady();
                    }
                } catch (e) {

                    // 重新抛出异常
                    throw e;

                } finally {

                    processEnd();
                }

            }

            ajaxStart();


            // 判断是否有文件上传
            var isFileUpload = !!Ext.get(theForm).query('input[type=file]').length;

            Ext.Ajax.request({
                form: theForm.id,
                url: url,
                isUpload: isFileUpload, //F.form_upload_file,
                //params: serializeForm(theForm) + '&X_AJAX=true',
                success: function (data) {
                    var scripts = data.responseText;

                    if (scripts && isFileUpload) {
                        // 文件上传时，输出内容经过encodeURIComponent编码（在ResponseFilter中的Close函数中）
                        //scripts = scripts.replace(/<\/?pre[^>]*>/ig, '');
                        scripts = decodeURIComponent(scripts);
                    }

                    // 启用AJAX发起时禁用的按钮
                    if (disabledButtonIdBeforeAJAX) {
                        F.enable(disabledButtonIdBeforeAJAX);
                    }

                    // 因为这里调用后（可能会关闭当前页面），extjs还有代码要执行（Ext.callback...），所以这里要延迟一下，等 extjs 代码执行完毕后再执行这里代码
                    window.setTimeout(function () {
                        ajaxSuccess(scripts, viewStateBeforeAJAX);
                    }, 0);
                },
                failure: function (data) {
                    //var lastDisabledButtonId = F.util.getHiddenFieldValue('F_TARGET');
                    if (disabledButtonIdBeforeAJAX) {
                        F.enable(disabledButtonIdBeforeAJAX);
                    }

                    processEnd(); // v6.0.0：失败也要做清理工作
                    createErrorWindow(data);
                },
                callback: function (options, success, response) {
                    // AJAX结束时需要清空此字段，否则下一次的type=submit提交（ASP.NET回发方式之一）会被误认为是AJAX提交
                    if (F && F.util) {
                        F.util.setHiddenFieldValue('F_AJAX', 'false');
                    }
                }
            });
        }
    }


    // 如果启用 Ajax，则所有对 __doPostBack 的调用都会到这里来
    function f__doPostBack(eventTarget, eventArgument) {
        var enableAjax;
        if (typeof (eventTarget) === 'boolean') {
            enableAjax = eventTarget;
            eventTarget = eventArgument;
            eventArgument = arguments[2];
        }

        // 回发页面之前延时 100 毫秒，确保页面上的操作完成（比如选中复选框的动作）
        window.setTimeout(function () {
            
            // theForm variable will always exist, because we invoke the GetPostBackEventReference in PageManager.
            if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                theForm.__EVENTTARGET.value = eventTarget;
                theForm.__EVENTARGUMENT.value = eventArgument;

                // 设置当前请求是否为AJAX请求
                if (typeof (enableAjax) === 'boolean') {
                    F.controlEnableAjax = enableAjax;
                }

                f__doPostBack_internal();
            }
        }, 100);
    }


    function writeContentToIFrame(iframe, content) {
        // http://stackoverflow.com/questions/1477547/getelementbyid-contentdocument-error-in-ie
        // contentWindow is always there.
        if (iframe) {
            var doc = iframe.contentWindow.document;
            if (doc) {
                doc.open();
                doc.write(content);
                doc.close();
            }
        }
    }

    // 创建出错窗口
    function createErrorWindow(data) {
        // 如果是请求超时错误，则弹出简单提醒对话框
        if (data.isTimeout) {
            F.util.alert(F.ajax.timeoutErrorMsg);
            return;
        }

        // 如果响应正文为空，则弹出简单提醒对话框
        if (!data.responseText) {
            F.util.alert(Ext.String.format(F.ajax.errorMsg, data.statusText, data.status));
            return;
        }

        if (!F.ajax.errorWindow) {
            F.ajax.errorWindow = F.create('Ext.window.Window', {
                id: "FINEUI_ERROR",
                renderTo: window.body,
                width: 550,
                height: 350,
                border: true,
                animCollapse: true,
                collapsible: false,
                collapsed: false,
                closeAction: "hide",
                plain: false,
                modal: true,
                draggable: true,
                minimizable: false,
                minHeight: 100,
                minWidth: 200,
                resizable: true,
                maximizable: true,
                closable: true
            });
        }

        F.ajax.errorWindow.show();
        F.ajax.errorWindow.body.dom.innerHTML = F.wnd.createIFrameHtml('about:blank', 'FINEUI_ERROR');
        F.ajax.errorWindow.setTitle(Ext.String.format(F.ajax.errorMsg, data.statusText, data.status));
        writeContentToIFrame(F.ajax.errorWindow.body.query('iframe')[0], data.responseText);
    }

    // 序列化表单为 URL 编码字符串，除去 <input type="submit" /> 的按钮
    var extjsSerializeForm = Ext.Element.serializeForm;
    Ext.Element.serializeForm = function (form) {
        var el, originalStr = extjsSerializeForm(form);
        for (var i = 0; i < form.elements.length; i++) {
            el = form.elements[i];
            if (el.type === 'submit') {
                var submitStr = encodeURIComponent(el.name) + '=' + encodeURIComponent(el.value);
                if (originalStr.indexOf(submitStr) == 0) {
                    originalStr = originalStr.replace(submitStr, '');
                } else {
                    originalStr = originalStr.replace('&' + submitStr, '');
                }
            }
        }
        return originalStr;
    };


    function getFState() {
        var state = {};
        Ext.ComponentManager.each(function (key, cmp) {
            // 只处理FineUI服务器端生成的控件（f_state表明这个控件对应一个服务器端控件）
            if (cmp.fineui && cmp.f_state) {
                resolveCmpHiddenFields(cmp);

                var fstate = cmp['f_state'];
                if (fstate && !F.isEOBJ(fstate)) {
                    if (F.fstateValidation) {
                        // 如果验证信息不存在，则不添加f_state
                        var fstatev = cmp['f_state_v'];
                        if (fstatev) {
                            state[cmp.id] = [fstate, fstatev];
                        }
                    } else {
                        state[cmp.id] = fstate;
                    }
                }
            }
            /*
            if (cmp.isXType) {
                var fstate = cmp['f_state'];
                if (fstate && Ext.isObject(fstate)) {
                    var cmpState = getFStateViaCmp(cmp, fstate);
                    if (!F.util.isObjectEmpty(cmpState)) {
                        state[cmp.id] = cmpState;
                    }
                }
            }
            */
        });
        return state;
    }

    //F.ajax.getFState = getFState;

    // 设置控件相关隐藏字段的值
    function resolveCmpHiddenFields(cmp) {
        //var state = {};
        //Ext.apply(state, fstate);

        function saveInHiddenField(property, currentValue) {
            // Save this client-changed property in a form hidden field. 
            F.util.setHiddenFieldValue(cmp.id + '_' + property, currentValue);
        }
        function removeHiddenField(property) {
            F.util.removeHiddenField(cmp.id + '_' + property);
        }

        /*
        // 如果存在Gzip压缩的属性，就删除原来的属性
        function resolveGZProperty(property) {
            var gzProperty = property + '_GZ';
            if (state[gzProperty]) {
                delete state[property];
            } else {
                delete state[gzProperty];
            }
        }
        */


        // 有些属性可以在客户端改变，因此需要在每个请求之前计算
        if (cmp.isXType('menucheckitem')) {
            saveInHiddenField('Checked', cmp.checked);
        }

        if (cmp.isXType('checkbox')) {
            // 包含RadioButton
            saveInHiddenField('Checked', cmp.getValue());
        }

        if (cmp.isXType('checkboxgroup')) {
            var selected = cmp.f_getSelectedValues();
            if (selected.length > 0) {
                saveInHiddenField('SelectedValueArray', selected.join(','));
            } else {
                removeHiddenField('SelectedValueArray');
            }
        }

        if (cmp.isXType('panel') || cmp.isXType('fieldset')) {
            saveInHiddenField('Collapsed', cmp.f_isCollapsed());
        }

        if (cmp.isXType('datepicker')) {
            saveInHiddenField('SelectedDate', Ext.Date.format(cmp.getValue(), cmp.initialConfig.format));
        }

        if (cmp.isXType('button')) {
            if (cmp.initialConfig.enableToggle) {
                saveInHiddenField('Pressed', cmp.pressed);
            }
        }

        if (cmp.isXType('grid')) {

            // 启用分页
            if (cmp.f_paging) {
                var pagingBar = cmp.f_getPaging();
                saveInHiddenField('PageIndex', pagingBar.f_pageIndex);
            }

            // 启用排序
            if (cmp.f_sorting) {
                var sorters = cmp.getStore().sorters;
                
                if(sorters) {
                    var gridSorter = sorters.get(0);

                    // 如果启用排序，但是默认没有排序，则可能 gridSorter 不存在
                    if (gridSorter) {
                        saveInHiddenField('SortField', gridSorter.property);
                        saveInHiddenField('SortDirection', gridSorter.direction);
                    }
                }
            }


            //if (cmp.getPlugin(cmp.id + '_celledit')) {
            if(cmp.f_cellEditing) {
                // 可编辑单元格的表格
                // 选中单元格
                //saveInHiddenField('SelectedCell', cmp.f_getSelectedCell().join(','));
				
				 // 选中单元格
				var selectedCell = cmp.f_getSelectedCell();
				if (selectedCell && selectedCell.length) {
					saveInHiddenField('SelectedCell', JSON.stringify(selectedCell));
				} else {
					removeHiddenField('SelectedCell');
				}

                //// 新增行
                //var newAddedRows = cmp.f_getNewAddedRows();
                //if (newAddedRows.length > 0) {
                //    saveInHiddenField('NewAddedRows', newAddedRows.join(','));
                //} else {
                //    removeHiddenField('NewAddedRows');
                //}

                // 修改的数据
                var modifiedData = cmp.f_getModifiedData();
                if (modifiedData.length > 0) {
                    saveInHiddenField('ModifiedData', Ext.encode(modifiedData));
                } else {
                    removeHiddenField('ModifiedData');
                }

                /*
                // 删除的行索引列表
                var deletedRows = cmp.f_getDeletedRows();
                if (deletedRows.length > 0) {
                    saveInHiddenField('DeletedRows', deletedRows.join(','));
                } else {
                    removeHiddenField('DeletedRows');
                }
                */

            } else {
                // 普通的表格
                // 选中行索引列表
                //saveInHiddenField('SelectedRowIndexArray', cmp.f_getSelectedRows().join(','));
                // 选中行标识符列表
                var selectedRows = cmp.f_getSelectedRows();
                if (selectedRows && selectedRows.length) {
                    saveInHiddenField('SelectedRows', JSON.stringify(selectedRows));
                } else {
                    removeHiddenField('SelectedRows');
                }
            }


            // 隐藏的列索引列表
            var gridHiddenColumns = cmp.f_getHiddenColumns();
            if (gridHiddenColumns.length > 0) {
                saveInHiddenField('HiddenColumns', gridHiddenColumns.join(','));
            } else {
                removeHiddenField('HiddenColumns');
            }

            // 目前States仅用于CheckBoxField
            var gridStates = cmp.f_getStates();
            if (gridStates.length > 0) {
                saveInHiddenField('States', Ext.encode(gridStates));
            } else {
                removeHiddenField('States');
            }

            //// 如果存在 GZIPPED 的属性，就用 GZIPPED 属性
            //resolveGZProperty('F_Rows');
        }

        //if (cmp.isXType('combo') || cmp.isXType('checkboxgroup') || cmp.isXType('radiogroup')) {

        //    // 如果存在 GZIPPED 的属性，就用 GZIPPED 属性
        //    resolveGZProperty('F_Items');
        //}

        if (cmp.isXType('field')) {

            //// 如果存在 GZIPPED 的属性，就用 GZIPPED 属性
            //resolveGZProperty('Text');
        }

        if (cmp.isXType('treepanel')) {
            saveInHiddenField('ExpandedNodes', cmp.f_getExpandedNodes(cmp.getRootNode().childNodes).join(','));
            saveInHiddenField('CheckedNodes', cmp.f_getCheckedNodes().join(','));
            saveInHiddenField('SelectedNodeIDArray', cmp.f_getSelectedNodes().join(','));

            //// 如果存在 GZIPPED 的属性，就用 GZIPPED 属性
            //resolveGZProperty('F_Nodes');
        }

        if (cmp.isXType('tabpanel')) {
            saveInHiddenField('ActiveTabIndex', cmp.f_getActiveTabIndex());
        }

        if (cmp.isXType('panel') && cmp.getLayout().type === 'accordion') {
            saveInHiddenField('ActivePaneIndex', cmp.f_getActiveIndex());
        }

        if (cmp['f_type'] && cmp['f_type'] === 'tab') {
            saveInHiddenField('Hidden', cmp.tab.isHidden());
        }

        //return state;
    }


    function showMaskAjaxLoading() {

        var loadingMaskNode = Ext.get('f_ajax_loading_mask_mask');
        var loadingNode = Ext.get('f_ajax_loading_mask');
        // 如果还没有创建，则创建节点
        if (!loadingNode) {

            var loadingMaskHtml = '<div id="f_ajax_loading_mask_mask" class="f-loading-mask"></div>'
                + '<div id="f_ajax_loading_mask" class="f-loading"><div class="f-loading-img"><img src="' + F.loadingImage + '"/></div></div>';

            Ext.DomHelper.append(Ext.getBody(), loadingMaskHtml);


            loadingMaskNode = Ext.get('f_ajax_loading_mask_mask');
            loadingNode = Ext.get('f_ajax_loading_mask');
        }


        loadingMaskNode.show();
        loadingNode.show();
    }


    function hideMaskAjaxLoading() {
        Ext.get('f_ajax_loading_mask_mask').hide();
        Ext.get('f_ajax_loading_mask').hide();
    }

    // 显示“正在载入...”的提示信息
    function _showAjaxLoading(ajaxLoadingType) {
        // 延迟后，要再次检查当前有 AJAX 正在进行，才显示提示信息
        if (__ajaxUnderwayCount > 0) {

            if (ajaxLoadingType === "default") {
                F.ajaxLoadingDefault.setStyle('left', (Ext.getBody().getWidth() - F.ajaxLoadingDefault.getWidth()) / 2 + 'px');
                F.ajaxLoadingDefault.show();
            } else {
                //F.ajaxLoadingMask.show();
                //Ext.getBody().mask(F.util.loading);
                showMaskAjaxLoading();
            }

        }
    }

    // 隐藏“正在载入...”的提示信息
    function _hideAjaxLoading(ajaxLoadingType) {
        if (__ajaxUnderwayCount === 0) {

            if (ajaxLoadingType === "default") {
                F.ajaxLoadingDefault.hide();
            } else {
                //F.ajaxLoadingMask.hide();
                //Ext.getBody().unmask();
                hideMaskAjaxLoading();
            }

        }
    }

    function ajaxStart() {

        // 计数加一
        __ajaxUnderwayCount++;

        // 仅在第一个 AJAX 发起时，延迟显示提示信息
        if (__ajaxUnderwayCount !== 1) {
            return;
        }

        if (!enableAjaxLoading()) {
            // Do nothing
        } else {
            Ext.defer(_showAjaxLoading, 50, window, [ajaxLoadingType()]);
        }

    }

    function ajaxStop() {
        // 计数减一
        __ajaxUnderwayCount--;
        if (__ajaxUnderwayCount < 0) {
            __ajaxUnderwayCount = 0;
        }

        if (!enableAjaxLoading()) {
            // ...
        } else {
           Ext.defer(_hideAjaxLoading, 0, window, [ajaxLoadingType()]);
        }

        if (__ajaxUnderwayCount === 0) {
            F.controlEnableAjaxLoading = undefined;
            F.controlAjaxLoadingType = undefined;
        }
    }

    /*
    // 当前 Ajax 的并发请求数
    //var _requestCount = 0;
    var _ajaxStarted = false;

    // 发起 Ajax 请求之前事件处理
    Ext.Ajax.on('beforerequest', function (conn, options) {
        //_requestCount++;

        _ajaxStarted = true;
        ajaxStart();
    });

    // Ajax 请求结束
    Ext.Ajax.on('requestcomplete', function (conn, options) {
        //_requestCount--;
        _ajaxStarted = false;
        
    });

    // Ajax 请求发生异常
    Ext.Ajax.on('requestexception', function (conn, options) {
        //_requestCount--;
        _ajaxStarted = false;
        

    });
    */





    //        // 不适用于所有Extjs控件（比如Toolbar中放置按钮，这个按钮就没有ownerCt对象）
    //        // 更新一个Javascript对象
    //        updateObject: function(obj, newObjFunction, renderImmediately) {
    //            var id = obj.id;
    //            if (Ext.type(renderImmediately) == 'boolean' && !renderImmediately) {

    //                // 1.取得父容器
    //                var owner = obj.ownerCt;
    //                // 2.本控件在父容器的位置
    //                var insertIndex = owner.items.indexOf(obj);
    //                // 3.从父容器中销毁此控件
    //                owner.remove(obj);
    //                // 4.创建新的控件
    //                newObjFunction();
    //                // 5.将新的控件添加到删除的位置
    //                owner.insert(insertIndex, Ext.getCmp(id));
    //                // 6.父容器重新布局
    //                owner.doLayout();

    //            }
    //            else {

    //                // 1.销毁此控件
    //                obj.destroy();
    //                // 2.新建此控件
    //                newObjFunction();
    //            }
    //        }

})();