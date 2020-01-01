<?php

namespace app\admin\model\app;

use think\Model;


class Dynamic extends Model
{
    // 表名
    protected $name = 'app_dynamic';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    // 追加属性
    protected $append = [
        'article_type_id_text',
        'type_id_text',
        'create_time_text',
        'update_time_text'
    ];


    public function getArticleTypeIdList()
    {
        return ['0' => __('Article_type_id 0'), '1' => __('Article_type_id 1')];
    }

    public function getTypeIdList()
    {
        return ['1' => __('Type_id 1'), '2' => __('Type_id 2'), '3' => __('Type_id 3'), '4' => __('Type_id 4'), '5' => __('Type_id 5'), '6' => __('Type_id 6')];
    }


    public function getArticleTypeIdTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['article_type_id']) ? $data['article_type_id'] : '');
        $list = $this->getArticleTypeIdList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getTypeIdTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['type_id']) ? $data['type_id'] : '');
        $list = $this->getTypeIdList();
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


    public function appactivity()
    {
        return $this->belongsTo('app\admin\model\app\Activity', 'activity_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function apparticle()
    {
        return $this->belongsTo('app\admin\model\app\Article', 'article_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function appcomment()
    {
        return $this->belongsTo('app\admin\model\app\Comment', 'comment_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function apparticlelike()
    {
        return $this->belongsTo('app\admin\model\app\ArticleLike', 'article_like_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function appactivitylike()
    {
        return $this->belongsTo('app\admin\model\app\ActivityLike', 'activity_like_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
