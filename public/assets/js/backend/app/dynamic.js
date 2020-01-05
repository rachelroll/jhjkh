define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'app/dynamic/index' + location.search,
                    add_url: 'app/dynamic/add',
                    edit_url: 'app/dynamic/edit',
                    del_url: 'app/dynamic/del',
                    multi_url: 'app/dynamic/multi',
                    table: 'app_dynamic',
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
                        {
                            field: 'article_type_id',
                            title: __('Article_type_id'),
                            searchList: {"0": __('Article_type_id 0'), "1": __('Article_type_id 1')},
                            formatter: Table.api.formatter.normal
                        },
                        {field: 'article_column_id', title: __('Article_column_id')},
                        {field: 'user_id', title: __('User_id')},
                        {field: 'article_id', title: __('Article_id')},
                        {field: 'activity_id', title: __('Activity_id')},
                        {field: 'comment_id', title: __('Comment_id')},
                        {field: 'article_like_id', title: __('Article_like_id')},
                        {field: 'activity_like_id', title: __('Activity_like_id')},
                        {
                            field: 'type_id',
                            title: __('Type_id'),
                            searchList: {
                                "1": __('Type_id 1'),
                                "2": __('Type_id 2'),
                                "3": __('Type_id 3'),
                                //"4": __('Type_id 4'),
                                "5": __('Type_id 5'),
                                //"6": __('Type_id 6')
                            },
                            formatter: Table.api.formatter.normal
                        },
                        {field: 'description', title: __('Description')},
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
                        {field: 'appactivity.title', title: __('Appactivity.title')},
                        {field: 'apparticle.title', title: __('Apparticle.title')},
                        {field: 'appcomment.content', title: __('Appcomment.content')},
                        {field: 'apparticlelike.id', title: __('Apparticlelike.id')},
                        {field: 'appactivitylike.id', title: __('Appactivitylike.id')},
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