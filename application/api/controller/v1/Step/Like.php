<?php


namespace app\api\controller\v1\step;


use app\api\controller\Api;
use app\admin\model\app\StepLike as StepLikeModel;
use app\admin\model\app\Step as StepModel;
use think\Db;
use think\Exception;

class Like extends Api
{
    /**
     * 点赞/取消赞
     */
    public function operate()
    {
        $this->checkParam(['step_id' => 'require']);
        Db::startTrans();
        try {
            $stepData = StepModel::where(['id' => $this->clientInfo['step_id']])->find();
            $condition = [
                'step_id' => $this->clientInfo['step_id'],
                'operate_user_id' => $this->user_id,
                'target_user_id' => $stepData['user_id'],
            ];
            $data = StepLikeModel::where($condition)->limit(1)->find();
            if (empty($data)) {
                StepLikeModel::create($condition);
                $stepData->like_count = $stepData->like_count + 1;
                $stepData->save();
            } else {
                StepLikeModel::where($condition)->delete();
                $stepData->like_count = $stepData->like_count - 1;
                $stepData->save();
            }
            Db::commit();
        } catch (Exception $exception) {
            Db::rollback();
            $this->returnmsg(400, $exception->getMessage());
        }
        $this->returnmsg(200, 'success');
    }
}