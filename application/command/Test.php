<?php


namespace app\command;


use think\Controller;
use think\Cache;
use think\Db;
use think\Exception;
use think\exception\PDOException;
use think\exception\ValidateException;

use app\admin\model\app\User as UserModel;
use app\admin\model\app\PlanSport as PlanSportModel;
use app\admin\model\app\PlanRecipe as PlanRecipeModel;
use app\admin\model\app\PlanData as PlanDataModel;
use app\admin\model\app\PlanEventBase as PlanEventBaseModel;
use app\admin\model\app\PlanEventRecipe as PlanEventRecipeModel;
use app\admin\model\app\PlanEventRecipeList as PlanEventRecipeListModel;
use app\admin\model\app\PlanEventSport as PlanEventSportModel;
use app\admin\model\app\PlanEventSportList as PlanEventSportListModel;
use app\admin\model\app\PlanEventData as PlanEventDataModel;
use app\admin\model\app\PlanEventDataList as PlanEventDataListModel;
use app\admin\model\app\Message as MessageModel;

class Test extends Controller
{
    /**
     * 处理基础事件提醒
     */
    public static function planEventBase()
    {
        $time = 1578495653;
        $date = 1578412800;
        //$time = time();
        //$date = strtotime(date('Y-m-d', $time));
        $userList = UserModel::where([
            'current_plan_id' => ['neq', 0]
        ])->select();
        foreach ($userList as $userInfo) {
            $planEventBaseInfo = PlanEventBaseModel::where([
                'user_id' => $userInfo['id'],
                'date' => $date,
                'plan_id' => $userInfo['current_plan_id'],
                'format_wake_up_time|format_fall_asleep_time|format_lunch_break_start' => ['<=', $time]
            ])->limit(1)->find();
            if ($planEventBaseInfo['format_wake_up_time'] <= $time) {
                $conditionWakeUp = [
                    'user_id' => $userInfo['id'],
                    'type_id' => 3,
                    'event_target_id' => $planEventBaseInfo['id'],
                    'event_type' => 1,
                ];
                if (MessageModel::where($conditionWakeUp)->count() == 0) {
                    MessageModel::create(array_merge($conditionWakeUp, [
                        'title' => '起床啦',
                        'content' => '快来迎接美好的一天',
                    ]));
                    //todo 模板消息
                }
            }

            if ($planEventBaseInfo['format_lunch_break_start'] <= $time) {
                $conditionLunchBreak = [
                    'user_id' => $userInfo['id'],
                    'type_id' => 3,
                    'event_target_id' => $planEventBaseInfo['id'],
                    'event_type' => 2,
                ];
                if (MessageModel::where($conditionLunchBreak)->count() == 0) {
                    MessageModel::create(array_merge($conditionLunchBreak, [
                        'title' => '午间发送一下吧',
                        'content' => '合理放松，事半功倍！',
                    ]));
                    //todo 模板消息
                }
            }
            if ($planEventBaseInfo['format_fall_asleep_time'] <= $time) {
                $conditionFallAsleep = [
                    'user_id' => $userInfo['id'],
                    'type_id' => 3,
                    'event_target_id' => $planEventBaseInfo['id'],
                    'event_type' => 3,
                ];
                if (MessageModel::where($conditionFallAsleep)->count() == 0) {
                    MessageModel::create(array_merge($conditionFallAsleep, [
                        'title' => '休息啦',
                        'content' => '忙碌了一天，早点休息吧~',
                    ]));
                    //todo 模板消息
                }
            }
        }
    }

    /**
     * 处理食谱事件提醒
     */
    public static function planEventRecipe()
    {
        $time = 1578495653;
        $date = 1578412800;
        //$time = time();
        //$date = strtotime(date('Y-m-d', $time));
        $userList = UserModel::where([
            'current_plan_id' => ['neq', 0]
        ])->select();
        foreach ($userList as $userInfo) {
            $planEventRecipeInfo = PlanEventRecipeModel::where([
                'user_id' => $userInfo['id'],
                'date' => $date,
                'plan_id' => $userInfo['current_plan_id'],
                'format_set_notice_time' => ['<=', $time]
            ])->limit(1)->find();
            $conditionRecipe = [
                'user_id' => $userInfo['id'],
                'type_id' => 3,
                'event_target_id' => $planEventRecipeInfo['id'],
                'event_type' => 4,
            ];
            if (MessageModel::where($conditionRecipe)->count() == 0) {
                $recipeInfo = PlanRecipeModel::get($planEventRecipeInfo['recipe_id']);
                MessageModel::create(array_merge($conditionRecipe, [
                    'title' => '食谱消息' . $recipeInfo['name'],
                    'content' => '食谱消息的正文内容',
                ]));
                //todo 模板消息
            }
        }
    }

    /**
     * 处理运动事件提醒
     */
    public static function planEventSport()
    {
        $time = 1578495653;
        $date = 1578412800;
        //$time = time();
        //$date = strtotime(date('Y-m-d', $time));
        $userList = UserModel::where([
            'current_plan_id' => ['neq', 0]
        ])->select();
        foreach ($userList as $userInfo) {
            $planEventSportInfo = PlanEventSportModel::where([
                'user_id' => $userInfo['id'],
                'date' => $date,
                'plan_id' => $userInfo['current_plan_id'],
                'format_start_time' => [['<=', $time], ['neq', 0], 'and']
            ])->limit(1)->find();
            $conditionSport = [
                'user_id' => $userInfo['id'],
                'type_id' => 3,
                'event_target_id' => $planEventSportInfo['id'],
                'event_type' => 5,
            ];
            if (MessageModel::where($conditionSport)->count() == 0) {
                $sportInfo = PlanSportModel::get($planEventSportInfo['sport_id']);
                MessageModel::create(array_merge($conditionSport, [
                    'title' => '运动消息' . $sportInfo['name'],
                    'content' => '运动消息的正文内容',
                ]));
                //todo 模板消息
            }
        }
    }

    /**
     * 处理数据事件提醒
     */
    public static function planEventData()
    {
        $time = 1578495653;
        $date = 1578412800;
        //$time = time();
        //$date = strtotime(date('Y-m-d', $time));
        $userList = UserModel::where([
            'current_plan_id' => ['neq', 0]
        ])->select();
        foreach ($userList as $userInfo) {
            $planEventDataInfo = PlanEventDataModel::where([
                'user_id' => $userInfo['id'],
                'date' => $date,
                'plan_id' => $userInfo['current_plan_id'],
                'format_start_time' => ['<=', $time]
            ])->limit(1)->find();
            $conditionData = [
                'user_id' => $userInfo['id'],
                'type_id' => 3,
                'event_target_id' => $planEventDataInfo['id'],
                'event_type' => 6,
            ];
            if (MessageModel::where($conditionData)->count() == 0) {
                $dataInfo = PlanDataModel::get($planEventDataInfo['data_id']);
                MessageModel::create(array_merge($conditionData, [
                    'title' => '数据消息' . $dataInfo['name'],
                    'content' => '运动消息的正文内容',
                ]));
                //todo 模板消息
            }
        }
    }


}