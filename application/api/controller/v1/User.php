<?php


namespace app\api\controller\v1;


use app\admin\model\app\Step;
use app\api\controller\Api;
use think\Loader;

class User extends Api
{
    protected $noNeedRight = ['get_user_phone'];

    /**
     * 获取微信运动数据
     */
    public function get_run_data()
    {
        $this->checkParam([
            'code' => 'require',
            'encryptedData' => 'require',
            'iv' => 'require',
        ]);
        $encryptedData = urldecode($this->clientInfo['encryptedData']);
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
            $timeStampArr = Step::where([
                'user_id' => $this->user_id
            ])->column('timestamp');
            $insertData = [];
            foreach ($data['stepInfoList'] as $key => $value) {
                if (in_array($value['timestamp'], $timeStampArr)) continue;
                $insertData[] = [
                    'user_id' => $this->user_id,
                    'step_number' => $value['step'],
                    'timestamp' => $value['timestamp'],
                ];
            }

            (new Step())->saveAll($insertData);
            $this->returnmsg(200, $data);
        } else {
            dump([
                $errCode,
                $data,
                $encryptedData,
                $iv,
                $result,
                $this->user_id
            ]);
            $this->returnmsg(400, '授权微信运动数据异常~');
        }
    }

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

}