<?php

$crond_list = array(
    //每分钟
    '*' => [
        'app\command\Test::planEventBase',      //处理基础事件消息
        'app\command\Test::planEventRecipe',    //处理食谱事件消息
        'app\command\Test::planEventSport',     //处理运动事件消息
        'app\command\Test::planEventData',      //处理数据事件消息
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