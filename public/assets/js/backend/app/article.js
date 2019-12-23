define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'app/article/index' + location.search,
                    add_url: 'app/article/add',
                    edit_url: 'app/article/edit',
                    del_url: 'app/article/del',
                    multi_url: 'app/article/multi',
                    table: 'app_article',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'user_id', title: __('User_id')},
                        {field: 'column_id', title: __('Column_id')},
                        {field: 'title', title: __('Title')},
                        {field: 'cover_file', title: __('Cover_file')},
                        {field: 'view_count', title: __('View_count')},
                        {field: 'like_count', title: __('Like_count')},
                        {field: 'comment_count', title: __('Comment_count')},
                        {field: 'sort', title: __('Sort')},
                        {field: 'status', title: __('Status'), searchList: {"0":__('Status 0'),"1":__('Status 1')}, formatter: Table.api.formatter.status},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'update_time', title: __('Update_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'appuser.nickname', title: __('Appuser.nickname')},
                        {field: 'appuser.avatar', title: __('Appuser.avatar'), events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'appcolumn.title', title: __('Appcolumn.title')},
                        {field: 'appcolumn.subtitle', title: __('Appcolumn.subtitle')},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});