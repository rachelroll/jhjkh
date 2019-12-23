<?php

namespace app\admin\model\app;

use think\Model;


class User extends Model
{
    // 表名
    protected $name = 'app_user';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    // 追加属性
    protected $append = [
        'gender_text',
        'role_text',
        'is_bind_text',
        'status_text',
        'create_time_text',
        'update_time_text'
    ];


    public function getGenderList()
    {
        return ['0' => __('Gender 0'), '1' => __('Gender 1'), '2' => __('Gender 2')];
    }

    public function getRoleList()
    {
        return ['0' => __('Role 0'), '1' => __('Role 1')];
    }

    public function getIsBindList()
    {
        return ['0' => __('Is_bind 0'), '1' => __('Is_bind 1')];
    }

    public function getStatusList()
    {
        return ['0' => __('Status 0'), '1' => __('Status 1')];
    }


    public function getGenderTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['gender']) ? $data['gender'] : '');
        $list = $this->getGenderList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getRoleTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['role']) ? $data['role'] : '');
        $list = $this->getRoleList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getIsBindTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['is_bind']) ? $data['is_bind'] : '');
        $list = $this->getIsBindList();
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


}
