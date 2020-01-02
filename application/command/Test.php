<?php


namespace app\command;

use think\Cache;
use think\Controller;
use think\Db;
use think\Exception;
use think\exception\PDOException;
use think\exception\ValidateException;

class Test extends Controller
{
    public static function test()
    {
        echo 111;
    }

}