<?php

namespace app\admin\model\app;

use think\Model;


class Banner extends Model
{
    // 表名
    protected $name = 'app_banner';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    // 追加属性
    protected $append = [
        'position_text',
        'click_type_text',
        'start_time_text',
        'end_time_text',
        'status_text',
        'create_time_text',
        'update_time_text'
    ];


    public function getPositionList()
    {
        return ['1' => __('Position 1'), '2' => __('Position 2'), '3' => __('Position 3')];
    }

    public function getClickTypeList()
    {
        return ['0' => __('Click_type 0'), '1' => __('Click_type 1'), '2' => __('Click_type 2'), '3' => __('Click_type 3'), '4' => __('Click_type 4')];
    }

    public function getStatusList()
    {
        return ['0' => __('Status 0'), '1' => __('Status 1')];
    }


    public function getPositionTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['position']) ? $data['position'] : '');
        $list = $this->getPositionList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getClickTypeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['click_type']) ? $data['click_type'] : '');
        $list = $this->getClickTypeList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getStartTimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['start_time']) ? $data['start_time'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getEndTimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['end_time']) ? $data['end_time'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
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

    protected function setStartTimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }

    protected function setEndTimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
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
