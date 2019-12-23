<?php
/**
 * JWT 扩展配置
 */
$time = time();

return [
    'key' => 'JusGXfzDp65JDmnD',    //自定义key值
    'lat' => $time,                 //签发时间
    'nbf' => $time,                 //生效时间
    'exp' => $time + 3600,          //过期时间
];