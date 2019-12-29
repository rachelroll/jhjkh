<?php

namespace app\api\controller\v1\activity;

use app\api\controller\Api;
use app\admin\model\app\Activity as ActivityModel;
use app\admin\model\app\ActivityApply as ActivityApplyModel;
use app\admin\model\app\ActivityView as ActivityViewModel;
use think\Db;
use think\Exception;

class Activity extends Api
{
    /**
     * 活动列表
     */
    public function fetch_list()
    {
        $time = time();
        $condition = [
            'status' => 1,
            'start_time' => ['>=', $time],
            'end_time' => ['<=', $time],
        ];
        $condition = [];
        $data = ActivityModel::where($condition)->paginate();
        $this->returnmsg(200, 'success', $data);
    }

    /**
     * 活动详情
     */
    public function fetch_detail()
    {
        $this->checkParam(['id' => 'require']);
        $condition = [
            'id' => $this->clientInfo['id']
        ];
        $user_id = $this->user_id;
        $data = ActivityModel::withCount([
            'likeFlag' => function ($query) use ($user_id) {
                $query->where('operate_user_id', $user_id);
            },
            'applyFlag' => function ($query) use ($user_id) {
                $query->where('user_id', $user_id);
            }])->where($condition)->find();

        $viewCondition = [
            'activity_id' => $this->clientInfo['id'],
            'operate_user_id' => $this->user_id
        ];
        $count = ActivityViewModel::where($viewCondition)->count();

        if (empty($count)) {
            ActivityViewModel::create($viewCondition);
            $data->view_count = $data->view_count + 1;
            $data->save();
        }
        $this->returnmsg(200, 'success', $data);
    }

    /**
     * 报名
     */
    public function apply()
    {
        $this->checkParam(['id' => 'require']);
        Db::startTrans();
        try {
            $condition = [
                'user_id' => $this->user_id,
                'activity_id' => $this->clientInfo['id'],
            ];
            $activityData = ActivityModel::where(['id' => $this->clientInfo['id']])->find();
            $count = ActivityApplyModel::where($condition)->count();
            if (empty($count)) {
                ActivityApplyModel::create($condition);
                $activityData->apply_count = $activityData->apply_count + 1;
                $activityData->save();
            }
            Db::commit();
        } catch (Exception $exception) {
            Db::rollback();
            $this->returnmsg(400, $exception->getMessage());
        }

        $this->returnmsg(200, 'success');
    }
}