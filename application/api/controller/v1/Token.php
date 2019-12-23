<?php

namespace app\api\controller\v1;


use app\api\controller\Api;
use Firebase\JWT\JWT;
use app\admin\model\app\User as UserModel;

class Token extends Api
{
    protected $noNeedLogin = [];
    protected $noNeedRight = ['*'];

    /**
     * 获取jwt的token信息
     */
    public static function getJwtToken($userId = null)
    {
        $config = config('jwt');
        $jwtData = [
            'lat' => $config['lat'],
            'nbf' => $config['nbf'],
            'exp' => $config['exp'],
            'user_id' => $userId,
        ];

        $jwtToken = JWT::encode($jwtData, $config['key']);

        return array_merge($jwtData, ['token' => $jwtToken]);

    }

    private function check_key()
    {
        $this->checkParam([
            'key' => 'require'
        ]);
        $config = config('jwt');
        if ($this->request->param('key') != $config['key']) $this->returnmsg(405, 'key error');
    }

    /**
     * 获取token
     */
    public function get_token()
    {
        $this->check_key();
        $token = self::getJwtToken();
        $this->returnmsg(200, 'success', $token);
    }

    /**
     * 微信授权登录
     */
    public function login()
    {
        $this->check_key();
        $this->checkParam([
            'code' => 'require',
            'avatar' => 'require',
            'nickname' => 'require',
            'gender' => 'require',
        ]);
        $param = $this->request->param();
        $wx = config('wx');
        $url = "https://api.weixin.qq.com/sns/jscode2session?appid={$wx['app_id']}&secret={$wx['app_secret']}&js_code={$param['code']}&grant_type=authorization_code";
        //session_key、openid
        $result = json_decode(curl_get($url), true);
        if (empty($result['openid'])) $this->returnmsg(400, '授权失败请联系管理员');
        $userInfo = UserModel::where(['openid' => $result['openid']])->find();
        if (!$userInfo) {
            $userInfo = UserModel::create([
                'phone_number' => !empty($this->clientInfo['phone_number']) ? $this->clientInfo['phone_number'] : '',
                'openid' => $result['openid'],
                'unionid' => !empty($result['unionid']) ? $result['unionid'] : '',
                'session_key' => $result['session_key'],
                'avatar' => $param['avatar'],
                'nickname' => $param['nickname'],
                'gender' => $param['gender'],
            ]);
        } else {
            $userInfo->avatar = $param['avatar'];
            $userInfo->nickname = $param['nickname'];
            $userInfo->gender = $param['gender'];
            $userInfo->save();
        }
        $param['userInfo'] = $userInfo;

        $token = self::getJwtToken($userInfo['id']);

        $this->returnmsg(200, 'success', $token);
    }

    /**
     * 刷新token
     */
    public function refresh()
    {
        $this->check_key();
        $this->checkParam([
            'avatar' => 'require',
            'nickname' => 'require',
            'gender' => 'require',
        ]);
        $param = $this->request->param();
        if (!empty($param['user_id'])) {
            $userInfo = UserModel::where(['id' => $param['user_id']])->find();

            $userInfo->avatar = $param['avatar'];
            $userInfo->nickname = $param['nickname'];
            $userInfo->gender = $param['gender'];
            $userInfo->save();

            $token = self::getJwtToken($userInfo['id']);
        } else {
            $token = self::getJwtToken();
        }

        $this->returnmsg(200, 'success', $token);
    }


    public function get_user_info()
    {
        $result = $this->checkJwtToken();
        $this->returnmsg(200, '', $result);
    }
}