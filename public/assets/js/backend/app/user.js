define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'app/user/index' + location.search,
                    add_url: 'app/user/add',
                    edit_url: 'app/user/edit',
                    del_url: 'app/user/del',
                    multi_url: 'app/user/multi',
                    table: 'app_user',
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
                        {field: 'name', title: __('Name')},
                        {field: 'nickname', title: __('Nickname')},
                        {
                            field: 'avatar',
                            title: __('Avatar'),
                            events: Table.api.events.image,
                            formatter: Table.api.formatter.image
                        },
                        {
                            field: 'gender',
                            title: __('Gender'),
                            searchList: {"0": __('Gender 0'), "1": __('Gender 1'), "2": __('Gender 2')},
                            formatter: Table.api.formatter.normal
                        },
                        {field: 'phone_number', title: __('Phone_number')},
                        {
                            field: 'role',
                            title: __('Role'),
                            searchList: {"0": __('Role 0'), "1": __('Role 1')},
                            formatter: Table.api.formatter.normal
                        },
                        {
                            field: 'is_bind',
                            title: __('Is_bind'),
                            searchList: {"0": __('Is_bind 0'), "1": __('Is_bind 1')},
                            formatter: Table.api.formatter.normal
                        },
                        {
                            field: 'status',
                            title: __('Status'),
                            searchList: {"0": __('Status 0'), "1": __('Status 1')},
                            formatter: Table.api.formatter.status
                        },
                        {
                            field: 'create_time',
                            title: __('Create_time'),
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },
                        {
                            field: 'update_time',
                            title: __('Update_time'),
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },
                        {
                            field: 'operate',
                            title: __('Operate'),
                            table: table,
                            events: Table.api.events.operate,
                            formatter: Table.api.formatter.operate
                        }
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