<?php


namespace app\api\controller\v1\article;


use app\api\controller\Api;
use app\admin\model\app\Comment as CommentModel;
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
            CommentModel::create([
                'article_id' => $this->clientInfo['article_id'],
                'content' => $this->clientInfo['content'],
                'user_id' => $this->user_id,
            ]);
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
        $this->checkParam(['article_id' => 'require']);
        $data = CommentModel::with(['appuser'])
            ->where([
                'article_id' => $this->clientInfo['article_id']
            ])->order([
                'like_count' => 'desc',
                'reply_count' => 'desc',
                'id' => 'desc',
            ])->select();
        $this->returnmsg(200, 'success', $data);
    }

    /**
     * 查看评论列表
     * @param article_id
     */
    public function fetch_reply_list()
    {
        $this->checkParam(['pid' => 'require']);
        $data = CommentModel::with(['appuser'])
            ->where([
                'pid' => $this->clientInfo['pid']
            ])->order([
                'like_count' => 'desc',
                'reply_count' => 'desc',
                'id' => 'desc',
            ])->select();
        $this->returnmsg(200, 'success', $data);
    }

}