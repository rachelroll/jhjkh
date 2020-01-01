<?php


namespace app\api\controller\v1\article;


use app\admin\model\app\Dynamic as DynamicModel;
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
                $articleLikeData = ArticleLikeModel::create($condition);
                $articleData->like_count = $articleData->like_count + 1;
                $articleData->save();
                $dynamicCount = DynamicModel::where([
                    'type_id' => 3,
                    'article_id' => $articleData['id'],
                ])->count();
                if (!$dynamicCount) {
                    DynamicModel::create([
                        'description' => '点赞文章',
                        'user_id' => $this->user_id,
                        'article_type_id' => $articleData['type_id'],
                        'article_column_id' => $articleData['column_id'],
                        'article_id' => $articleData['id'],
                        'article_like_id' => $articleLikeData['id'],
                        'type_id' => 3,
                    ]);
                }
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