<?php

namespace app\api\controller\v1\plan;


use app\admin\model\app\PlanData;
use app\admin\model\app\PlanSport;
use app\api\controller\Api;
use app\admin\model\app\PlanData as PlanDataModel;
use app\admin\model\app\Plan as PlanModel;
use app\admin\model\app\PlanEventBase as PlanEventBaseModel;
use app\admin\model\app\PlanEventRecipe as PlanEventRecipeModel;
use app\admin\model\app\PlanEventRecipeList as PlanEventRecipeListModel;
use app\admin\model\app\PlanEventSport as PlanEventSportModel;
use app\admin\model\app\PlanEventSportList as PlanEventSportListModel;
use app\admin\model\app\PlanEventData as PlanEventDataModel;
use app\admin\model\app\PlanEventDataList as PlanEventDataListModel;

use app\admin\model\app\PlanRecipe as PlanRecipeModel;
use app\admin\model\app\Article as ArticleModel;
use app\admin\model\app\PlanFormData as PlanFormDataModel;
use think\Db;
use think\Exception;

class Plan extends Api
{
    /**
     * 创建任务
     */
    public function create()
    {
        $this->checkParam([
            'formData' => 'require|array'
        ]);
        Db::startTrans();
        try {
            $formData = $this->clientInfo['formData'];
            $daysPeriod = $this->make_days_period($formData['number_of_days']);

            //todo 创建计划主体
            $planData = PlanModel::create([
                'user_id' => $this->user_id,
                'sn' => date('YmdHis') . mt_rand(1000, 9999) . $this->user_id,
                'name' => $formData['plan_name'],
                'cover_image' => $formData['plan_cover_image'],
                'number_of_days' => $formData['number_of_days'],
            ]);
            $planEventBaseArr = $planEventRecipeListArr = $planEventSportArr = $planEventSportListArr = $planEventDataArr = [];
            //todo 创建计划基础数据
            $planEventBaseModel = new PlanEventBaseModel;
            //todo 创建计划食谱
            $planEventRecipeModel = new PlanEventRecipeModel;
            $planEventRecipeListModel = new PlanEventRecipeListModel;
            //todo 创建计划运动
            $planEventSportModel = new PlanEventSportModel;
            $planEventSportListModel = new PlanEventSportListModel;
            //todo 创建数据类型
            $planEventDataModel = new PlanEventDataModel;

            foreach ($formData['setting'] as $key => $value) {
                //循环周一到周日
                foreach ($daysPeriod[$key] as $index => $item) {
                    $commonSaveAll = [
                        'user_id' => $this->user_id,
                        'plan_id' => $planData['id'],
                        'date' => $item['date'],
                        'format_date' => $item['format_date'],
                        'day_of_the_week' => $key,
                    ];
                    //基础数据构建
                    $planEventBaseArr[] = $commonSaveAll + [
                            'wake_up_time' => $value['base']['wake_up_time'],
                            'fall_asleep_time' => $value['base']['fall_asleep_time'],
                            'lunch_break_start' => $value['base']['lunch_break_start'],
                            'lunch_break_end' => $value['base']['lunch_break_end'],
                            'format_fall_asleep_time' => strtotime($item['format_date'] . ' ' . $value['base']['fall_asleep_time']),
                            'format_lunch_break_start' => strtotime($item['format_date'] . ' ' . $value['base']['lunch_break_start']),
                            'format_lunch_break_end' => strtotime($item['format_date'] . ' ' . $value['base']['lunch_break_end']),
                        ];

                    //食谱数据构建
                    foreach ($value['recipe'] as $recipeKey => $recipeValue) {
                        $planEventRecipeRes = $planEventRecipeModel->create($commonSaveAll + [
                                'set_notice_time' => $recipeValue['set_notice_time'],
                                'format_set_notice_time' => strtotime($item['format_date'] . ' ' . $recipeValue['set_notice_time']),
                                'recipe_id' => $recipeKey,
                            ]);
                        $groupSort = 0;
                        foreach ($recipeValue['article_list'] as $articleKey => $articleValue) {
                            ++$groupSort;
                            $articleSort = 0;
                            foreach ($articleValue as $groupKey => $groupValue) {
                                $planEventRecipeListArr[] = [
                                    'type_id' => $articleKey == 0 ? 0 : 1,
                                    'event_recipe_id' => $planEventRecipeRes['id'],
                                    'article_id' => $groupValue,
                                    'group_sort' => $groupSort,
                                    'article_sort' => ++$articleSort,
                                ];
                            }
                        }
                    }
                    //运动数据构建
                    foreach ($value['sport'] as $sportKey => $sportValue) {
                        $planEventSportRes = $planEventSportModel->create($commonSaveAll + [
                                'sport_type_id' => $sportValue['sport_type_id'],
                                'start_time' => !empty($sportValue['start_time']) ? $sportValue['start_time'] : '',
                                'format_start_time' => !empty($sportValue['start_time']) ? strtotime($item['format_date'] . ' ' . $sportValue['start_time']) : 0,
                                'end_time' => !empty($sportValue['end_time']) ? $sportValue['end_time'] : '',
                                'format_end_time' => !empty($sportValue['end_time']) ? strtotime($item['format_date'] . ' ' . $sportValue['end_time']) : 0,
                                'target_step' => !empty($sportValue['target_step']) ? $sportValue['target_step'] : 0,
                                'sport_id' => $sportKey,
                            ]);
                        if (!empty($sportValue['article_list'])) {
                            $groupSort = 0;
                            foreach ($sportValue['article_list'] as $articleKey => $articleValue) {
                                ++$groupSort;
                                $articleSort = 0;
                                foreach ($articleValue as $groupKey => $groupValue) {
                                    $planEventSportListArr[] = [
                                        'type_id' => $articleKey == 0 ? 0 : 1,
                                        'event_sport_id' => $planEventSportRes['id'],
                                        'article_id' => $groupValue,
                                        'group_sort' => $groupSort,
                                        'article_sort' => ++$articleSort,
                                    ];
                                }
                            }
                        }
                    }
                    //数据类型构建
                    $infoDataList = PlanDataModel::where([
                        'id' => [
                            'in',
                            $value['info']
                        ]
                    ])->select();
                    foreach ($infoDataList as $infoKey => $infoValue) {
                        $planEventDataArr[] = $commonSaveAll + [
                                'data_id' => $infoValue['id'],
                                'data_type_id' => $infoValue['type_id'],
                                'start_time' => $infoValue['start_time'],
                                'format_start_time' => strtotime($item['format_date'] . ' ' . $infoValue['start_time']),
                            ];
                    }
                }
            }
            $planEventBaseModel->allowField(true)->saveAll($planEventBaseArr);
            $planEventRecipeListModel->allowField(true)->saveAll($planEventRecipeListArr);
            if (!empty($planEventSportListArr)) $planEventSportListModel->allowField(true)->saveAll($planEventSportListArr);
            $planEventDataModel->allowField(true)->saveAll($planEventDataArr);

            //todo 保存创建计划源数据
            PlanFormDataModel::create([
                'form_data' => json_encode($formData, JSON_UNESCAPED_UNICODE),
                'plan_id' => $planData['id']
            ]);
            Db::commit();
        } catch (Exception $exception) {
            Db::rollback();
            $this->returnmsg(400, $exception->getMessage());
        }
        $this->returnmsg(200, 'success');
    }

    /**
     * 根据计划总时长计算具体的周期时间
     */
    private function make_days_period($days)
    {
        $time = strtotime('+1 days', strtotime(date('Y-m-d', time())));
        $formatData = [];
        for ($i = 0; $i < $days; $i++) {
            $tempTime = $time + 86400 * $i;
            $tempKey = date('w', $tempTime);
            if (empty($formatData[$tempKey])) $formatData[$tempKey] = [];
            array_push($formatData[$tempKey], [
                'date' => $tempTime,
                'format_date' => date('Y-m-d', $tempTime),
            ]);
        }
        return $formatData;
    }

    /**
     * 计划详情展示
     */
    public function fetch_detail()
    {
        $this->checkParam([
            'plan_id' => 'require',
            'day_of_the_week' => 'require',
        ]);
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

        $condition = [
            'plan_id' => $this->clientInfo['plan_id'],
            'day_of_the_week' => $this->clientInfo['day_of_the_week'],
        ];
        //基础事件
        $planEventBaseData = $planEventBaseModel->where($condition)->limit(1)->find();

        $baseEventData = [
            'wake_up_time' => $planEventBaseData['wake_up_time'],
            'fall_asleep_time' => $planEventBaseData['fall_asleep_time'],
            'lunch_break_start' => $planEventBaseData['lunch_break_start'],
            'lunch_break_end' => $planEventBaseData['lunch_break_end'],
        ];
        $condition['date'] = $planEventBaseData['date'];
        //全部的食谱分类
        $planRecipeData = $planRecipeModel->where([])->order(['sort' => 'desc', 'id' => 'asc'])->select();
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
                'set_notice_time' => $planEventRecipeInfo['set_notice_time'],
                'recipe_event_name' => $value['name'],
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
                'set_notice_time' => $value['start_time'],
                'start_time' => $value['start_time'],
                'end_time' => $value['end_time'],
                'target_step' => $value['target_step'],
                'sport_id' => $value['sport_id'],
                'sport_name' => $sportInfo['name'],
                'detail' => $tempArticleList
            ];
        }
        $planEventDataData = $planEventDataModel->where($condition)->column('data_id');
        $dataEventData = [];
        $planDataList = PlanData::where(['id' => ['in', $planEventDataData]])->select();
        foreach ($planDataList as $key => $value) {
            $dataEventData[] = [
                'set_notice_time' => $value['start_time'],
                'name' => $value['name']
            ];
        }

        $this->returnmsg(200, 'success', compact('baseEventData', 'recipeEventData', 'sportEventData', 'dataEventData'));
    }
}