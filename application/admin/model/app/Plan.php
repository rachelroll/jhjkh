<?php

namespace app\admin\model\app;

use app\admin\model\app\Article as ArticleModel;
use app\admin\model\app\PlanEventBase as PlanEventBaseModel;
use app\admin\model\app\PlanEventData as PlanEventDataModel;
use app\admin\model\app\PlanEventRecipe as PlanEventRecipeModel;
use app\admin\model\app\PlanEventRecipeList as PlanEventRecipeListModel;
use app\admin\model\app\PlanEventSport as PlanEventSportModel;
use app\admin\model\app\PlanEventSportList as PlanEventSportListModel;
use app\admin\model\app\PlanRecipe as PlanRecipeModel;
use think\Model;


class Plan extends Model
{
    // 表名
    protected $name = 'app_plan';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    // 追加属性
    protected $append = [
        'status_text',
        'create_time_text',
        'update_time_text'
    ];


    public static function fetchDetailData($condition)
    {
        //todo 计划基础数据
        $planEventBaseModel = new PlanEventBaseModel;
        //todo 计划食谱
        $planRecipeModel = new PlanRecipeModel;
        $planEventRecipeModel = new PlanEventRecipeModel;
        $planEventRecipeListModel = new PlanEventRecipeListModel;
        //todo 计划运动
        $planEventSportModel = new PlanEventSportModel;
        $planEventSportListModel = new PlanEventSportListModel;
        //todo 创建数据类型
        $planEventDataModel = new PlanEventDataModel;


        //基础事件
        $planEventBaseData = $planEventBaseModel->where($condition)->limit(1)->find();

        $baseEventData = [
            'id' => $planEventBaseData['id'],
            'wake_up_time' => $planEventBaseData['wake_up_time'],
            'format_wake_up_time' => $planEventBaseData['format_wake_up_time'],
            'fall_asleep_time' => $planEventBaseData['fall_asleep_time'],
            'format_fall_asleep_time' => $planEventBaseData['format_fall_asleep_time'],
            'lunch_break_start' => $planEventBaseData['lunch_break_start'],
            'format_lunch_break_start' => $planEventBaseData['format_lunch_break_start'],
            'lunch_break_end' => $planEventBaseData['lunch_break_end'],
            'format_lunch_break_end' => $planEventBaseData['format_lunch_break_end'],
        ];
        $condition['date'] = $planEventBaseData['date'];
        //全部的食谱分类
        $planRecipeData = $planRecipeModel->order(['sort' => 'desc', 'id' => 'asc'])->select();
        $recipeEventData = [];
        foreach ($planRecipeData as $key => $value) {
            $planEventRecipeInfo = $planEventRecipeModel->where($condition + ['recipe_id' => $value['id']])->limit(1)->find();
            if (empty($planEventRecipeInfo)) continue;
            $tempEventRecipeList = $planEventRecipeListModel->where([
                'event_recipe_id' => $planEventRecipeInfo['id']
            ])->order([
                'group_sort' => 'asc',
                'article_sort' => 'asc'
            ])->select();
            $tempArticleList = [];
            foreach ($tempEventRecipeList as $index => $item) {
                $tempArticleList[$item['group_sort']][] = [
                    'article_id' => $item['article_id'],
                    'article_name' => ArticleModel::where('id', $item['article_id'])->value('title'),
                ];
            }
            $recipeEventData[] = [
                'id' => $planEventRecipeInfo['id'],
                'set_notice_time' => $planEventRecipeInfo['set_notice_time'],
                'format_set_notice_time' => $planEventRecipeInfo['format_set_notice_time'],
                'cover_image' => $value['cover_image'],
                'name' => $value['name'],
                'sketch' => $value['sketch'],
                'detail' => $tempArticleList
            ];
        }

        //运动事件
        $planEventSportData = $planEventSportModel->where($condition)->select();
        $sportEventData = [];
        foreach ($planEventSportData as $key => $value) {
            $sportInfo = PlanSport::get($value['sport_id']);
            $tempEventSportList = $planEventSportListModel->where([
                'event_sport_id' => $value['id']
            ])->order([
                'group_sort' => 'asc',
                'article_sort' => 'asc'
            ])->select();
            $tempArticleList = [];
            foreach ($tempEventSportList as $index => $item) {
                $tempArticleList[$item['group_sort']][] = [
                    'article_id' => $item['article_id'],
                    'article_name' => ArticleModel::where('id', $item['article_id'])->value('title'),
                ];
            }
            $sportEventData[] = [
                'id' => $value['id'],
                'set_notice_time' => $value['start_time'],
                'format_set_notice_time' => $value['format_start_time'],
                'start_time' => $value['start_time'],
                'end_time' => $value['end_time'],
                'target_step' => $value['target_step'],
                'sport_id' => $value['sport_id'],
                'cover_image' => $sportInfo['cover_image'],
                'name' => $sportInfo['name'],
                'sketch' => $sportInfo['sketch'],
                'detail' => $tempArticleList
            ];
        }

        //数据事件
        $planEventDataData = $planEventDataModel->where($condition)->select();
        $dataEventData = [];

        foreach ($planEventDataData as $key => $value) {
            $tempPlanData = PlanData::where(['id' => ['in', $value['data_id']]])->find();
            $dataEventData[] = [
                'id' => $value['id'],
                'set_notice_time' => $value['start_time'],
                'format_set_notice_time' => $value['format_start_time'],
                'cover_image' => $tempPlanData['cover_image'],
                'name' => $tempPlanData['name'],
                'sketch' => $tempPlanData['sketch'],
            ];
        }

        return [$baseEventData, $recipeEventData, $sportEventData, $dataEventData];
    }

    public function getStatusList()
    {
        return ['0' => __('Status 0'), '1' => __('Status 1')];
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
