<?php

$crond_list = array(
    //每分钟
    '*' => [
        'app\command\Test::planEventBase',//处理基础事件消息
    ],

    //每天 ------------
    '00:00' => [
    ],
    //每月--------
    '*-01 00:00' => [

    ],
    //每小时---------
    '*:00' => [],


);

return $crond_list;