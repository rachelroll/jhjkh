<?php


namespace app\api\controller\v1;


use app\admin\model\app\Banner as BannerModel;
use app\admin\model\app\Theme as ThemeModel;
use app\admin\model\app\Column as ColumnModel;
use app\api\controller\Api;

class System extends Api
{
    protected $noNeedLogin = [];
    protected $noNeedRight = ['*'];

    /**
     * 首页轮播图列表
     */
    public function fetch_banner_list()
    {
        $data = BannerModel::where([
            'status' => 1,
        ])->order([
            'sort' => 'desc',
            'id' => 'desc',
        ])->select();
        $this->returnmsg(200, 'success', $data);
    }

    /**
     * 首页轮播图详情
     * @params id
     */
    public function fetch_banner_detail()
    {
        $data = BannerModel::where([
            'status' => 1,
            'id' => $this->clientInfo['id'],
        ])->find();
        $this->returnmsg(200, 'success', $data);
    }

    /**
     * 获取主题列表
     */
    public function fetch_theme_list()
    {
        $data = ThemeModel::where([
            'status' => 1,
        ])->order([
            'sort' => 'desc',
            'id' => 'desc',
        ])->select();
        $this->returnmsg(200, 'success', $data);
    }
    /**
     * 获取栏目列表
     */
    public function fetch_column_list()
    {
        $data = ColumnModel::where([
            'status' => 1,
        ])->order([
            'sort' => 'desc',
            'id' => 'desc',
        ])->select();
        $this->returnmsg(200, 'success', $data);
    }

    /**
     * 获取自定义扩展配置
     */
    public function get_config()
    {
        $this->checkParam([
            'key' => 'require'
        ]);
        $config = config('site.' . $this->request->param('key'));
        $this->returnmsg(200, 'success', $config);
    }

}