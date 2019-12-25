define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'app/banner/index' + location.search,
                    add_url: 'app/banner/add',
                    edit_url: 'app/banner/edit',
                    del_url: 'app/banner/del',
                    multi_url: 'app/banner/multi',
                    table: 'app_banner',
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
                        {field: 'title', title: __('Title')},
                        {field: 'image', title: __('Image'), events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'position', title: __('Position'), searchList: {"1":__('Position 1'),"2":__('Position 2'),"3":__('Position 3')}, formatter: Table.api.formatter.normal},
                        {field: 'click_type', title: __('Click_type'), searchList: {"0":__('Click_type 0'),"1":__('Click_type 1'),"2":__('Click_type 2'),"3":__('Click_type 3'),"4":__('Click_type 4')}, formatter: Table.api.formatter.normal},
                        {field: 'url_path', title: __('Url_path')},
                        {field: 'activity_id', title: __('Activity_id')},
                        {field: 'user_id', title: __('User_id')},
                        {field: 'start_time', title: __('Start_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'end_time', title: __('End_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'sort', title: __('Sort')},
                        {field: 'status', title: __('Status'), searchList: {"0":__('Status 0'),"1":__('Status 1')}, formatter: Table.api.formatter.status},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'update_time', title: __('Update_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'appactivity.cover_file', title: __('Appactivity.cover_file')},
                        {field: 'appactivity.title', title: __('Appactivity.title')},
                        {field: 'appuser.nickname', title: __('Appuser.nickname')},
                        {field: 'appuser.avatar', title: __('Appuser.avatar'), events: Table.api.events.image, formatter: Table.api.formatter.image},
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