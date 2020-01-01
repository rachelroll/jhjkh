<?php


namespace app\api\controller\v1\article;


use app\api\controller\Api;
use think\Db;
use think\Exception;
use app\admin\model\app\Article as ArticleModel;
use app\admin\model\app\ArticleLabel as ArticleLabelModel;
use app\admin\model\app\User as UserModel;
use app\admin\model\app\Theme as ThemeModel;
use app\admin\model\app\Label as LabelModel;
use app\admin\model\app\ArticleView as ArticleViewModel;
use app\admin\model\app\Dynamic as DynamicModel;

class Article extends Api
{
    /**
     * 发布文章
     * @param title 标题
     * @param cover_file 封面图/视频
     * @param content  正文
     * @param column_id 类型
     * @param label_arr 标签（多选）
     */
    public function create()
    {
        $this->checkParam([
            'title' => 'require',
            'cover_file' => 'require',
            'content' => 'require',
            'label_arr' => 'array',
        ]);
        Db::startTrans();
        try {
            $userInfo = UserModel::get($this->user_id);
            $type_id = $userInfo['role'] == 0 ? 2 : 1;
            if ($type_id == 1) $this->checkParam(['column_id' => 'require', 'label_arr' => 'require']);
            $createData = [
                'title' => $this->clientInfo['title'],
                'cover_file' => $this->clientInfo['cover_file'],
                'content' => $this->clientInfo['content'],
                'column_id' => !empty($this->clientInfo['column_id']) ? $this->clientInfo['column_id'] : 0,
                'type_id' => $type_id,
                'user_id' => $userInfo['id'],
            ];

            $articleData = ArticleModel::create($createData);
            if (!empty($this->clientInfo['label_arr'])) {
                $labelArrData = [];
                foreach ($this->clientInfo['label_arr'] as $key => $value) {
                    $labelArrData[] = [
                        'label_id' => $value,
                        'article_id' => $articleData['id'],
                    ];
                }
                (new ArticleLabelModel)->saveAll($labelArrData);
            }
            DynamicModel::create([
                'description' => '发布文章',
                'user_id' => $this->user_id,
                'article_type_id' => $articleData['type_id'],
                'article_column_id' => $articleData['column_id'],
                'article_id' => $articleData['id'],
                'type_id' => 1,
            ]);

            Db::commit();
        } catch (Exception $exception) {
            Db::rollback();
            $this->returnmsg(400, $exception->getMessage());
        }
        $this->returnmsg(200, 'success');
    }

    /**
     * 获取文章列表
     * @params type_id 类型:0=健康秀,1=达人
     * @params theme_id 主题
     * @params column_id 栏目
     */
    public function fetch_list()
    {
        $this->checkParam([
            'type_id' => 'require|in:0,1'
        ]);
        $condition = ['type_id' => $this->clientInfo['type_id']];
        if (!empty($this->clientInfo['theme_id'])) {
            $label_id = ThemeModel::where(['id' => $this->clientInfo['theme_id']])->value('label_id');
            $condition['id'] = [
                'in',
                ArticleLabelModel::where(compact('label_id'))->column('article_id'),
            ];
        }

        $condition['column_id'] = !empty($this->clientInfo['column_id']) ? $this->clientInfo['column_id'] : 0;

        $user_id = $this->user_id;
        $model = new ArticleModel();
        $data = $model
            ->with([
                'appuser',
                'appcolumn',
                'likeFlag' => function ($query) use ($user_id) {
                    $query->where('operate_user_id', $user_id);
                },
            ])
            ->where($condition)
            ->order(['sort' => 'desc', 'id' => 'desc'])
            ->paginate();
        $data = ArticleModel::formatList($data);
        $this->returnmsg(200, 'success', $data);
    }

    /**
     * 文章详情
     * @param id
     */
    public function fetch_detail()
    {
        $this->checkParam(['id' => 'require']);
        $user_id = $this->user_id;
        $model = new ArticleModel();
        $data = $model
            ->with([
                'appuser',
                'appcolumn',
                'likeFlag' => function ($query) use ($user_id) {
                    $query->where('operate_user_id', $user_id);
                },
            ])
            ->limit(1)
            ->find();
        $condition = [
            'article_id' => $this->clientInfo['id'],
            'operate_user_id' => $this->user_id,
            'target_user_id' => $data['user_id'],
        ];
        $count = ArticleViewModel::where($condition)->count();
        if (empty($count)) {
            ArticleViewModel::create($condition);
            $data->view_count = $data->view_count + 1;
            $data->save();
        }
        $data = json_decode(json_encode($data), true);
        $data['like_flag'] = count($data['like_flag']);
        $this->returnmsg(200, 'success', $data);
    }

    /**
     * 转发文章分享至个人动态
     */
    public function share()
    {
        $this->checkParam(['id' => 'require']);
        $articleData = ArticleModel::where(['id' => $this->clientInfo['id']])->find();
        $dynamicCount = DynamicModel::where([
            'type_id' => 5,
            'article_id' => $articleData['id'],
        ])->count();
        if (!$dynamicCount) {
            DynamicModel::create([
                'description' => '转发文章',
                'user_id' => $this->user_id,
                'article_type_id' => $articleData['type_id'],
                'article_column_id' => $articleData['column_id'],
                'article_id' => $articleData['id'],
                'type_id' => 5,
            ]);
        }
        $this->returnmsg(200, 'success');
    }
}