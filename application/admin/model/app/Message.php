<?php

namespace app\admin\model\app;

use think\Model;


class Message extends Model
{
    // 表名
    protected $name = 'app_message';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    // 追加属性
    protected $append = [
        'type_id_text',
        'status_text',
        'create_time_text',
        'update_time_text'
    ];


    public function getTypeIdList()
    {
        return ['1' => __('Type_id 1'), '2' => __('Type_id 2'), '3' => __('Type_id 3'), '4' => __('Type_id 4'), '5' => __('Type_id 5')];
    }

    public function getStatusList()
    {
        return ['0' => __('Status 0'), '1' => __('Status 1')];
    }


    public function getTypeIdTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['type_id']) ? $data['type_id'] : '');
        $list = $this->getTypeIdList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }


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

    public function appuser()
    {
        return $this->belongsTo('app\admin\model\app\User', 'user_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
