<?php


namespace app\admin\model\app;


use think\Model;

class ArticleLabel extends Model
{
    // 表名
    protected $name = 'app_article_label';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = true;
}