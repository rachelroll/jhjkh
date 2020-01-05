<?php


namespace app\api\controller\v1\article;


use app\admin\model\app\Dynamic as DynamicModel;
use app\api\controller\Api;
use app\admin\model\app\Comment as CommentModel;
use app\admin\model\app\CommentLike as CommentLikeModel;
use app\admin\model\app\Article as ArticleModel;
use think\Db;
use think\Exception;

class Comment extends Api
{
    /**
     * 发布评论
     */
    public function create()
    {
        $this->checkParam([
            'article_id' => 'require',
            'content' => 'require',
        ]);
        Db::startTrans();
        try {
            $commentData = CommentModel::create([
                'article_id' => $this->clientInfo['article_id'],
                'content' => $this->clientInfo['content'],
                'user_id' => $this->user_id,
            ]);
            $articleData = ArticleModel::where([
                'id' => $this->clientInfo['article_id'],
            ])->find();
            $articleData->setInc('comment_count');
            $articleData->save();
            DynamicModel::create([
                'description' => $this->clientInfo['content'],
                'user_id' => $this->user_id,
                'article_type_id' => $articleData['type_id'],
                'article_column_id' => $articleData['column_id'],
                'article_id' => $articleData['id'],
                'comment_id' => $commentData['id'],
                'type_id' => 2,
            ]);
            Db::commit();
        } catch (Exception $exception) {
            Db::rollback();
            $this->returnmsg(400, $exception->getMessage());
        }
        $this->returnmsg(200, 'success');
    }

    /**
     * 回复评论
     */
    public function create_reply()
    {
        $this->checkParam([
            'article_id' => 'require',
            'content' => 'require',
            'pid' => 'require',
        ]);
        Db::startTrans();
        try {
            CommentModel::create([
                'article_id' => $this->clientInfo['article_id'],
                'content' => $this->clientInfo['content'],
                'user_id' => $this->user_id,
                'pid' => $this->clientInfo['pid'],
            ]);
            CommentModel::where([
                'id' => $this->clientInfo['pid']
            ])->setInc('reply_count');
            ArticleModel::where([
                'id' => $this->clientInfo['article_id'],
            ])->setInc('comment_count');
            Db::commit();
        } catch (Exception $exception) {
            Db::rollback();
            $this->returnmsg(400, $exception->getMessage());
        }
        $this->returnmsg(200, 'success');
    }

    /**
     * 查看评论列表
     * @param article_id
     */
    public function fetch_list()
    {
        $user_id = $this->user_id;
        $this->checkParam(['article_id' => 'require']);
        $data = CommentModel::with([
            'appuser',
            'likeFlag' => function ($query) use ($user_id) {
                $query->where('operate_user_id', $user_id);
            },
        ])
            ->where([
                'article_id' => $this->clientInfo['article_id']
            ])->order([
                'like_count' => 'desc',
                'reply_count' => 'desc',
                'id' => 'desc',
            ])->select();
        $formaterData = [];
        foreach ($data as $key => $value) {
            $formaterData[] = [
                'id' => $value['id'],
                'content' => $value['content'],
                'like_count' => $value['like_count'],
                'reply_count' => $value['reply_count'],
                'create_time_text' => $value['create_time_text'],
                'userInfo' => [
                    'id' => $value['appuser']['id'],
                    'nickname' => $value['appuser']['nickname'],
                    'name' => $value['appuser']['name'],
                    'avatar' => $value['appuser']['avatar'],
                ],
                'like_flag' => count($value['like_flag'])
            ];
        }
        $data = $formaterData;
        $this->returnmsg(200, 'success', $data);
    }

    /**
     * 查看评论回复列表
     * @param article_id
     */
    public function fetch_reply_list()
    {
        $user_id = $this->user_id;
        $this->checkParam(['pid' => 'require']);
        $data = CommentModel::with([
            'appuser',
            'likeFlag' => function ($query) use ($user_id) {
                $query->where('operate_user_id', $user_id);
            },
        ])
            ->where([
                'pid' => $this->clientInfo['pid']
            ])->order([
                'like_count' => 'desc',
                'reply_count' => 'desc',
                'id' => 'desc',
            ])->select();
        $formaterData = [];
        foreach ($data as $key => $value) {
            $formaterData[] = [
                'id' => $value['id'],
                'content' => $value['content'],
                'like_count' => $value['like_count'],
                'reply_count' => $value['reply_count'],
                'create_time_text' => $value['create_time_text'],
                'userInfo' => [
                    'id' => $value['appuser']['id'],
                    'nickname' => $value['appuser']['nickname'],
                    'name' => $value['appuser']['name'],
                    'avatar' => $value['appuser']['avatar'],
                ],
                'like_flag' => count($value['like_flag'])
            ];
        }
        $data = $formaterData;
        $this->returnmsg(200, 'success', $data);
    }

    /**
     * 点赞/取消赞
     */
    public function like_operate()
    {
        $this->checkParam(['comment_id' => 'require']);
        Db::startTrans();
        try {
            $commentData = CommentModel::where(['id' => $this->clientInfo['comment_id']])->find();
            $condition = [
                'comment_id' => $this->clientInfo['comment_id'],
                'operate_user_id' => $this->user_id,
                'target_user_id' => $commentData['user_id'],
            ];
            $data = CommentLikeModel::where($condition)->limit(1)->find();
            if (empty($data)) {
                CommentLikeModel::create($condition);
                $commentData->like_count = $commentData->like_count + 1;
                $commentData->save();

            } else {

                CommentLikeModel::where($condition)->delete();
                $commentData->like_count = $commentData->like_count - 1;
                $commentData->save();
            }
            Db::commit();
        } catch (Exception $exception) {
            Db::rollback();
            $this->returnmsg(400, $exception->getMessage());
        }
        $this->returnmsg(200, 'success');
    }

}