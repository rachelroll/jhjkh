<?php


namespace app\api\controller\v1\activity;


use app\admin\model\app\Dynamic as DynamicModel;
use app\api\controller\Api;
use app\admin\model\app\ActivityLike as ActivityLikeModel;
use app\admin\model\app\Activity as ActivityModel;
use think\Db;
use think\Exception;

class Like extends Api
{
    /**
     * 点赞/取消赞
     */
    public function operate()
    {
        $this->checkParam(['activity_id' => 'require']);
        Db::startTrans();
        try {
            $activityData = ActivityModel::where(['id' => $this->clientInfo['activity_id']])->find();
            $condition = [
                'activity_id' => $this->clientInfo['activity_id'],
                'operate_user_id' => $this->user_id,
            ];
            $data = ActivityLikeModel::where($condition)->limit(1)->find();
            if (empty($data)) {
                $dynamicLikeData = ActivityLikeModel::create($condition);
                $activityData->like_count = $activityData->like_count + 1;
                $activityData->save();

//                $dynamicCount = DynamicModel::where([
//                    'type_id' => 4,
//                    'activity_id' => $activityData['id'],
//                ])->count();
//                if (!$dynamicCount) {
//                    DynamicModel::create([
//                        'description' => '点赞活动',
//                        'user_id' => $this->user_id,
//                        'activity_id' => $activityData['id'],
//                        'article_like_id' => $dynamicLikeData['id'],
//                        'type_id' => 4,
//                    ]);
//                }
            } else {

                ActivityLikeModel::where($condition)->delete();
                $activityData->like_count = $activityData->like_count - 1;
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