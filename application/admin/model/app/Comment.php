<?php

namespace app\admin\model\app;

use think\Model;


class Comment extends Model
{
    // 表名
    protected $name = 'app_comment';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    // 追加属性
    protected $append = [
        'create_time_text',
        'update_time_text'
    ];


    public function getCreateTimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['create_time']) ? $data['create_time'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getUpdateTimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['update_time']) ? $data['update_time'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setCreateTimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }

    protected function setUpdateTimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }

    public function likeFlag()
    {
        return $this->hasMany('app\admin\model\app\CommentLike', 'comment_id');
    }

    public function appuser()
    {
        return $this->belongsTo('app\admin\model\app\User', 'user_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }

    public function apparticle()
    {
        return $this->belongsTo('app\admin\model\app\Article', 'article_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
