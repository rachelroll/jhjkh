define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'app/comment_like/index' + location.search,
                    add_url: 'app/comment_like/add',
                    edit_url: 'app/comment_like/edit',
                    del_url: 'app/comment_like/del',
                    multi_url: 'app/comment_like/multi',
                    table: 'app_comment_like',
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
                        {field: 'comment_id', title: __('Comment_id')},
                        {field: 'appcomment.content', title: __('Appcomment.content')},
                        {field: 'operate_user_id', title: __('Operate_user_id')},
                        {
                            field: 'operate_user.nickname',
                            title: __('点赞用户昵称'),
                            operate: 'like'
                        },
                        {
                            field: 'operate_user.avatar',
                            title: __('点赞用户头像'),
                            events: Table.api.events.image,
                            formatter: Table.api.formatter.image,
                            operate: false
                        },
                        {field: 'target_user_id', title: __('Target_user_id')},
                        {
                            field: 'target_user.nickname',
                            title: __('被赞用户昵称'),
                            operate: 'like'
                        },
                        {
                            field: 'target_user.avatar',
                            title: __('被赞用户头像'),
                            events: Table.api.events.image,
                            formatter: Table.api.formatter.image,
                            operate: false
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