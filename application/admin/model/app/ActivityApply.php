<?php

namespace app\admin\model\app;

use think\Model;


class ActivityApply extends Model
{
    // 表名
    protected $name = 'app_activity_apply';

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


    public function appactivity()
    {
        return $this->belongsTo('app\admin\model\app\Activity', 'activity_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function appuser()
    {
        return $this->belongsTo('app\admin\model\app\User', 'user_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
