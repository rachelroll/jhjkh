<?php

namespace app\admin\model\app;

use think\Model;


class Article extends Model
{
    // 表名
    protected $name = 'app_article';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    // 追加属性
    protected $append = [
        'status_text',
        'create_time_text',
        'update_time_text',
        'label_arr',
        'content_strip',
    ];

    /**
     * 列表数据格式化
     */
    public static function formatList($data)
    {
        $result = [];
        foreach ($data as $item) {
            $result[] = self::formatOne($item);
        }
        return $result;
    }

    /**
     * 格式化单条
     */
    public static function formatOne($item)
    {
        return [
            'id' => $item['id'],
            'title' => $item['title'],
            'cover_file' => $item['cover_file'],
            'view_count' => $item['view_count'],
            'like_count' => $item['like_count'],
            'comment_count' => $item['comment_count'],
            'content_strip' => $item['content_strip'],
            'userInfo' => [
                'id' => $item['appuser']['id'],
                'name' => $item['appuser']['name'],
                'nickname' => $item['appuser']['nickname'],
                'avatar' => $item['appuser']['avatar'],
            ],
            'columnInfo' => [
                'id' => $item['appcolumn']['id'],
                'title' => $item['appcolumn']['title'],
                'subtitle' => $item['appcolumn']['subtitle'],
                'image' => $item['appcolumn']['image'],
            ],
            'labelInfo' => $item['label_arr'],
            'like_flag' => count($item['like_flag']),
            'create_time_text' => $item['create_time_text'],
        ];
    }

    public function getStatusList()
    {
        return ['0' => __('Status 0'), '1' => __('Status 1')];
    }

    /**
     * 文章摘要
     * @param $value
     * @param $data
     * @return string
     */
    public function getContentStripAttr($value, $data)
    {
        //<img>标签替换为[图片]
        $pregRule = "/<[img|IMG].*?src=[\'|\"](.*?(?:[\.jpg|\.jpeg|\.png|\.gif|\.bmp]))[\'|\"].*?[\/]?>/";
        $data['content'] = preg_replace($pregRule, '[图片]', $data['content']);
        //文章摘要
        $post_excerpt = strip_tags(htmlspecialchars_decode($data['content']));
        $post_excerpt = trim($post_excerpt);
        $patternArr = array('/\s/', '/ /');
        $replaceArr = array('', '');
        $post_excerpt = preg_replace($patternArr, $replaceArr, $post_excerpt);
        $value = mb_strcut($post_excerpt, 0, 350, 'utf-8');
        return $value;
    }

    public function getLabelArrAttr($value, $data)
    {
        $labelIdArr = ArticleLabel::where(['article_id' => $data['id']])->column('label_id');
        $arr = Label::where(['id' => ['in', $labelIdArr]])->field('id,name')->order(['id' => 'desc'])->select();
        return $arr;
    }

    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getCreateTimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['create_time']) ? $data['create_time'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getUpdateTimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['update_time']) ? $data['update_time'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setCreateTimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }

    protected function setUpdateTimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }

    public function likeFlag()
    {
        return $this->hasMany('app\admin\model\app\ArticleLike', 'article_id');
    }

    public function appuser()
    {
        return $this->belongsTo('app\admin\model\app\User', 'user_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }

    public function appcolumn()
    {
        return $this->belongsTo('app\admin\model\app\Column', 'column_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
