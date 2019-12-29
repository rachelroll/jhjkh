<?php


namespace app\api\controller\v1;


use app\admin\model\app\Step;
use app\api\controller\Api;
use think\Loader;
use app\admin\model\app\User as UserModel;

class User extends Api
{
    protected $noNeedRight = ['get_user_phone'];

    /**
     * 获取用户手机号
     */
    public function get_user_phone()
    {
        $this->checkParam([
            'code' => 'require',
            'encryptedData' => 'require',
            'iv' => 'require',
        ]);
        $encryptedData = $this->clientInfo['encryptedData'];
        $iv = urldecode($this->clientInfo['iv']);
        $wx = config('wx');

        $url = "https://api.weixin.qq.com/sns/jscode2session?appid={$wx['app_id']}&secret={$wx['app_secret']}&js_code={$this->clientInfo['code']}&grant_type=authorization_code";
        //session_key、openid
        $result = json_decode(curl_get($url), true);
        Loader::import('wxphone.wxBizDataCrypt', EXTEND_PATH);

        $pc = new \WXBizDataCrypt($wx['app_id'], $result['session_key']);
        $errCode = $pc->decryptData($encryptedData, $iv, $data);

        if ($errCode == 0) {
            $data = json_decode($data, true);
            $this->returnmsg(200, $data);
        } else {
            $this->returnmsg(400, '授权手机号异常~');
        }
    }

    /**
     * 修改用户信息
     */
    public function edit_user_info()
    {
        (new UserModel)->allowField(true)->isUpdate(true)->save($this->clientInfo, ['id' => $this->user_id]);
        $this->returnmsg(200, 'success');
    }

    /**
     * 获取用户信息
     */
    public function get_user_info()
    {
        $data = UserModel::get($this->user_id);
        $this->returnmsg(200, 'success', $data);
    }


}