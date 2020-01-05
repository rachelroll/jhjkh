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
                            'format_wake_up_time' => strtotime($item['format_date'] . ' ' . $value['base']['wake_up_time']),
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
     * @param plan_id 计划ID
     * @param day_of_the_week 星期几
     */
    public function fetch_detail_list()
    {
        $this->checkParam([
            'plan_id' => 'require',
            'day_of_the_week' => 'require',
        ]);

        $condition = [
            'plan_id' => $this->clientInfo['plan_id'],
            'day_of_the_week' => $this->clientInfo['day_of_the_week'],
        ];
        list($baseEventData, $recipeEventData, $sportEventData, $dataEventData) = PlanModel::fetchDetailData($condition);
        $return = compact('baseEventData', 'recipeEventData', 'sportEventData', 'dataEventData');
//        halt($return);
        //todo 事件详情格式化
        $formatData = [
            [
                'event_key' => "起床时间：",
                'event_value' => $baseEventData['wake_up_time'],
                'event_timestamp' => $baseEventData['format_wake_up_time'],
                'event_item' => []
            ],
            [
                'event_key' => "午休时间：",
                'event_value' => $baseEventData['lunch_break_start'] . '-' . $baseEventData['lunch_break_end'],
                'event_timestamp' => $baseEventData['format_lunch_break_start'],
                'event_item' => []
            ],
            [
                'event_key' => "入睡时间：",
                'event_value' => $baseEventData['fall_asleep_time'],
                'event_timestamp' => $baseEventData['format_fall_asleep_time'],
                'event_item' => []
            ],
        ];

        //食谱
        $recipeFormatData = [];
        foreach ($recipeEventData as $key => $value) {
            $tempEventItem = [];
            foreach ($value['detail'] as $index => $item) {
                $tempEventItem[] = [
                    "item_key" => $index == 1 ? '主食：' : '辅食：',
                    "item_value" => implode('+', array_filter(array_column($item, 'article_name')))
                ];
            }
            $recipeFormatData[] = [
                'event_key' => $value['name'] . '：',
                'event_value' => $value['set_notice_time'],
                'event_timestamp' => strtotime($value['set_notice_time']),
                'event_item' => $tempEventItem
            ];
        }

        //运动
        $sportFormatData = [];
        foreach ($sportEventData as $key => $value) {
            $tempEventItem = [];
            foreach ($value['detail'] as $index => $item) {
                $tempEventItem[] = [
                    "item_key" => $index == 1 ? '主食：' : '辅食：',
                    "item_value" => implode('+', array_filter(array_column($item, 'article_name')))
                ];
            }
            $sportFormatData[] = [
                'event_key' => $value['name'] . '：',
                'event_value' => !empty($value['target_step']) ? $value['target_step'] . '步' : $value['start_time'] . '-' . $value['end_time'],
                'event_timestamp' => $value['format_set_notice_time'],
                'event_item' => $tempEventItem
            ];
        }
        //数据
        $dataFormatData = [];
        foreach ($dataEventData as $key => $value) {
            $dataFormatData[] = [
                'event_key' => '健康数据：',
                'event_value' => $value['set_notice_time'],
                'event_timestamp' => $value['format_set_notice_time'],
                'event_item' => [
                    "item_key" => '测量数据：',
                    "item_value" => $value['name']
                ]
            ];
        }
        $formatData = array_merge($formatData, $recipeFormatData, $sportFormatData, $dataFormatData);
        //todo 事件按时间排序
        $eventTimestampArr = array_column($formatData, 'event_timestamp');
        array_multisort($eventTimestampArr, SORT_ASC, $formatData);

        $this->returnmsg(200, 'success', $formatData);
    }

    /**
     * 计划详情展示
     * @param day
     */
    public function fetch_detail_by_date()
    {
        $this->checkParam(['date']);
        $condition = [
            'plan_id' => 43,
            'date' => strtotime($this->clientInfo['date']),
        ];
        list($baseEventData, $recipeEventData, $sportEventData, $dataEventData) = PlanModel::fetchDetailData($condition);
        //$return = compact('baseEventData', 'recipeEventData', 'sportEventData', 'dataEventData');
        //dump($return);

        //todo 事件详情格式化 $event_type:1=基础事件-起床,2=基础事件-午休,3=基础事件-入睡,4=食谱,5=运动,6=数据
        $formatData = [
            [
                'event_type' => "1",
                'event_target_id' => $baseEventData['id'],
                'cover_image' => '/upload/none.png',
                'name' => '起床',
                'sketch' => '早睡早起身体好，早安！',
                'event_timestamp' => strtotime($baseEventData['wake_up_time']),
                'event_time_text' => $baseEventData['wake_up_time'],
            ],
            [
                'event_type' => "2",
                'event_target_id' => $baseEventData['id'],
                'cover_image' => '/upload/none.png',
                'name' => '午休',
                'sketch' => '适当休息一下吧~',
                'event_time_text' => $baseEventData['lunch_break_start'] . '-' . $baseEventData['lunch_break_end'],
                'event_timestamp' => strtotime($baseEventData['lunch_break_start']),
            ],
            [
                'event_type' => "3",
                'event_target_id' => $baseEventData['id'],
                'cover_image' => '/upload/none.png',
                'name' => '入睡',
                'sketch' => '早睡早起身体好，晚安！',
                'event_time_text' => $baseEventData['fall_asleep_time'],
                'event_timestamp' => strtotime($baseEventData['fall_asleep_time']),
            ],
        ];

        //食谱
        $recipeFormatData = [];
        foreach ($recipeEventData as $key => $value) {
            $tempEventItem = [];
            foreach ($value['detail'] as $index => $item) {
                $tempEventItem[] = [
                    "item_key" => $index == 1 ? '主食：' : '辅食：',
                    "item_value" => implode('+', array_filter(array_column($item, 'article_name')))
                ];
            }
            $tempEventItemStr = implode('+', array_column($tempEventItem, 'item_value'));
            $recipeFormatData[] = [
                'event_type' => "4",
                'event_target_id' => $value['id'],
                'cover_image' => $value['cover_image'],
                'name' => $value['name'],
                'sketch' => !empty($tempEventItemStr) ? $tempEventItemStr : $value['sketch'],
                'event_timestamp' => $value['format_set_notice_time'],
                'event_time_text' => $value['set_notice_time'],
            ];
        }

        //运动
        $sportFormatData = [];
        foreach ($sportEventData as $key => $value) {
            $tempEventItem = [];
            foreach ($value['detail'] as $index => $item) {
                $tempEventItem[] = [
                    "item_key" => $index == 1 ? '主食：' : '辅食：',
                    "item_value" => implode('+', array_filter(array_column($item, 'article_name')))
                ];
            }
            $tempEventItemStr = implode('+', array_column($tempEventItem, 'item_value'));
            $tempSketch = !empty($value['target_step']) ? $value['target_step'] . '步' : $value['start_time'] . '-' . $value['end_time'];
            $sportFormatData[] = [
                'event_type' => "5",
                'event_target_id' => $value['id'],
                'cover_image' => $value['cover_image'],
                'name' => $value['name'],
                'sketch' => !empty($tempEventItemStr) ? $tempEventItemStr : $tempSketch,
                'event_timestamp' => $value['format_set_notice_time'],
                'event_time_text' => $value['set_notice_time'],
            ];
        }
        //数据
        $dataFormatData = [];
        foreach ($dataEventData as $key => $value) {
            $dataFormatData[] = [
                'event_type' => "6",
                'event_target_id' => $value['id'],
                'cover_image' => $value['cover_image'],
                'name' => $value['name'],
                'sketch' => $value['sketch'],
                'event_timestamp' => $value['format_set_notice_time'],
                'event_time_text' => $value['set_notice_time'],
            ];
        }
        $formatData = array_merge($formatData, $recipeFormatData, $sportFormatData, $dataFormatData);
        //todo 事件按时间排序
        $eventTimestampArr = array_column($formatData, 'event_timestamp');
        array_multisort($eventTimestampArr, SORT_ASC, $formatData);

        $this->returnmsg(200, 'success', $formatData);
    }

    /**
     * 事件设置稍后提醒
     * @param event_type
     * @param event_target_id
     */
    public function set_delay_notice()
    {
        $this->checkParam([
            'event_type' => 'require',
            'event_target_id' => 'require',
        ]);
        //todo 事件详情格式化 $event_type:1=基础事件-起床,2=基础事件-午休,3=基础事件-入睡,4=食谱,5=运动,6=数据
        Db::startTrans();
        try {
            $delayTime = 3600;
            $event_time_text = 0;
            switch ((int)$this->clientInfo['event_type']) {

                case 1:
                    //todo 计划基础数据
                    $planEventBaseModel = new PlanEventBaseModel;
                    $planEventBaseInfo = $planEventBaseModel->where('id', $this->clientInfo['event_target_id'])->limit(1)->find();
                    $planEventBaseInfo->format_wake_up_time = $planEventBaseInfo->format_wake_up_time + $delayTime;
                    $event_time_text = $planEventBaseInfo->wake_up_time = date('H:i', $planEventBaseInfo->format_wake_up_time);
                    $planEventBaseInfo->save();
                    break;
                case 2:
                    //todo 计划基础数据
                    $planEventBaseModel = new PlanEventBaseModel;
                    $planEventBaseInfo = $planEventBaseModel->where('id', $this->clientInfo['event_target_id'])->limit(1)->find();
                    $planEventBaseInfo->format_lunch_break_start = $planEventBaseInfo->format_lunch_break_start + $delayTime;
                    $event_time_text = $planEventBaseInfo->lunch_break_start = date('H:i', $planEventBaseInfo->format_lunch_break_start);
                    $planEventBaseInfo->save();
                    break;
                case 3:
                    //todo 计划基础数据
                    $planEventBaseModel = new PlanEventBaseModel;
                    $planEventBaseInfo = $planEventBaseModel->where('id', $this->clientInfo['event_target_id'])->limit(1)->find();
                    $planEventBaseInfo->format_fall_asleep_time = $planEventBaseInfo->format_fall_asleep_time + $delayTime;
                    $event_time_text = $planEventBaseInfo->fall_asleep_time = date('H:i', $planEventBaseInfo->format_fall_asleep_time);
                    $planEventBaseInfo->save();
                    break;
                case 4:
                    //todo 计划食谱
                    $planEventRecipeModel = new PlanEventRecipeModel;
                    $planEventRecipeInfo = $planEventRecipeModel->where('id', $this->clientInfo['event_target_id'])->limit(1)->find();
                    $planEventRecipeInfo->format_set_notice_time = $planEventRecipeInfo->format_set_notice_time + $delayTime;
                    $event_time_text = $planEventRecipeInfo->set_notice_time = date('H:i', $planEventRecipeInfo->format_set_notice_time);
                    $planEventRecipeInfo->save();
                    break;
                case 5:
                    //todo 计划运动
                    $planEventSportModel = new PlanEventSportModel;
                    $planEventSportInfo = $planEventSportModel->where('id', $this->clientInfo['event_target_id'])->limit(1)->find();
                    $planEventSportInfo->format_start_time = $planEventSportInfo->format_start_time + $delayTime;
                    $event_time_text = $planEventSportInfo->start_time = date('H:i', $planEventSportInfo->format_start_time);
                    $planEventSportInfo->save();
                    break;
                case 6:
                    //todo 创建数据类型
                    $planEventDataModel = new PlanEventDataModel;
                    $planEventDataInfo = $planEventDataModel->where('id', $this->clientInfo['event_target_id'])->limit(1)->find();
                    $planEventDataInfo->format_start_time = $planEventDataInfo->format_start_time + $delayTime;
                    $event_time_text = $planEventDataInfo->start_time = date('H:i', $planEventDataInfo->format_start_time);
                    $planEventDataInfo->save();
                    break;
                default:
                    break;
            }
            Db::commit();
        } catch (Exception $exception) {
            Db::rollback();
            $this->returnmsg(400, $exception->getMessage());
        }
        $this->returnmsg(200, 'success', compact('event_time_text'));
    }
}