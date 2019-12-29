<?php


namespace app\api\controller\v1\article;


use app\api\controller\Api;
use app\admin\model\app\ArticleLike as ArticleLikeModel;
use app\admin\model\app\Article as ArticleModel;
use think\Db;
use think\Exception;

class Like extends Api
{
    /**
     * 点赞/取消赞
     */
    public function operate()
    {
        $this->checkParam(['article_id' => 'require']);
        Db::startTrans();
        try {
            $articleData = ArticleModel::where(['id' => $this->clientInfo['article_id']])->find();
            $condition = [
                'article_id' => $this->clientInfo['article_id'],
                'operate_user_id' => $this->user_id,
                'target_user_id' => $articleData['user_id'],
            ];
            $data = ArticleLikeModel::where($condition)->limit(1)->find();
            if (empty($data)) {
                ArticleLikeModel::create($condition);
                $articleData->like_count = $articleData->like_count + 1;
                $articleData->save();
            } else {
                ArticleLikeModel::where($condition)->delete();
                $articleData->like_count = $articleData->like_count - 1;
                $articleData->save();
            }
            Db::commit();
        } catch (Exception $exception) {
            Db::rollback();
            $this->returnmsg(400, $exception->getMessage());
        }
        $this->returnmsg(200, 'success');
    }
}