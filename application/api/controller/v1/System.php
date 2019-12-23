<?php


namespace app\api\controller\v1;


use app\admin\model\shop\Banner;
use app\admin\model\shop\order\Address;
use app\admin\model\shop\Setting;
use app\api\controller\Api;

class System extends Api
{
    protected $noNeedLogin = [];
    protected $noNeedRight = ['*'];

    /**
     * 首页轮播图
     */
    public function get_banner()
    {
        $data = Banner::where([
            'status' => 'normal',
        ])->order([
            'sort' => 'desc'
        ])->select();
        $this->returnmsg(200, 'success', $data);
    }

    /**
     * 用户收货地址
     */
    public function get_default_address()
    {
        $data = Address::where([
            'status' => 'normal',
            'user_id' => 0,
        ])->order([
            'sort' => 'desc'
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

    /**
     * 小程序设置
     */
    public function setting()
    {
        $data = Setting::limit(1)->find();

        $data['finish_time_timestamp'] = strtotime(date('Y-m-d') . ' ' . $data['finish_time']);
        $data['start_time_timestamp'] = strtotime(date('Y-m-d') . ' ' . $data['start_time']);
        $this->returnmsg(200, 'success', $data);
    }

}