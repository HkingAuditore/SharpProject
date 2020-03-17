
//if(Ext.ux.SimplePagingToolbar){
//Ext.apply(Ext.ux.SimplePagingToolbar.prototype, {
//    beforePageText: "Страница",
//    afterPageText: "из {0}",
//    firstText: "Первая Страница",
//    prevText: "Предыдущая Страница",
//    nextText: "Следующая Страница",
//    lastText: "Последняя Страница",
//    displayMsg: "Отображается {0} - {1} из {2}",
//    emptyMsg: 'Нет данных для отображения'
//});
//}

Ext.apply(F.ajax, {
    errorMsg: "Запрос текущей страницы не удался!<br /><br />Сообщение об Ошибке: {0} ({1})"
});

Ext.apply(F.util, {
    alertTitle: "Диалог события",
    confirmTitle: "Диалог подтверждения",
    //formAlertMsg: "Пожалуйста укажите значение для {0}!",
    formAlertTitle: "Форма неверна",
    loading: "Загрузка..."
});

Ext.apply(F.wnd, {
    closeButtonTooltip: "Закрывает это окно",
    formChangeConfirmMsg: "Текущая форма была изменена, oтменить изменения?"
});