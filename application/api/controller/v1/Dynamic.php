<?php


namespace app\api\controller\v1;

use app\admin\model\app\Column as ColumnModel;
use app\admin\model\app\Dynamic as DynamicModel;
use app\admin\model\app\Article as ArticleModel;
use app\api\controller\Api;

class Dynamic extends Api
{
    /**
     * 动态分类
     */
    public function fetch_category()
    {
        $columnData = ColumnModel::where([
            'status' => 1,
        ])->order([
            'sort' => 'desc',
            'id' => 'desc',
        ])->select();
        $return = [
            [
                'name' => '全部',
                'condition' => [],
            ], [
                'name' => '健康秀',
                'condition' => [
                    'article_type_id' => 0
                ],
            ],
        ];
        foreach ($columnData as $key => $value) {
            $return = array_merge($return, [
                [
                    'name' => $value['title'],
                    'condition' => [
                        'article_column_id' => $value['id']
                    ],

                ]
            ]);
        }
        $this->returnmsg(200, 'success', $return);
    }

    /**
     * 动态列表
     * @param condition
     */
    public function fetch_list()
    {
        $user_id = $this->user_id;
        $condition = !empty($this->clientInfo['condition']) ? $this->clientInfo['condition'] : [];
        $condition = array_merge($condition, ['user_id' => $user_id]);
        $data = DynamicModel::where($condition)->order(['id' => 'desc'])->paginate();
        $data = json_decode(json_encode($data), true);
        $returnData = [];
        foreach ($data['data'] as $key => $value) {
            $articleInfo = ArticleModel::with([
                'appuser',
                'appcolumn',
                'likeFlag' => function ($query) use ($user_id) {
                    $query->where('operate_user_id', $user_id);
                },
            ])->limit(1)->find();
            $formatRes = ArticleModel::formatOne($articleInfo);
            $returnData[] = [
                'id' => $value['id'],
                'description' => $value['description'],
                'type_id' => $value['type_id'],
                'create_time_text' => $value['create_time_text'],
                'article' => $formatRes
            ];
        }
        $data['data'] = $returnData;
        $this->returnmsg(200, 'success', $data);
    }
}