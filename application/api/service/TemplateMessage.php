<?php


namespace app\api\service;


use think\Cache;
use think\Exception;

class TemplateMessage
{
    private function getAccessToken()
    {
        $wechat = config('wechat');
        $accessToken = Cache::get('AccessToken' . $wechat['app_id']);
        if ($accessToken) return $accessToken;
        $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={$wechat['app_id']}&secret={$wechat['app_secret']}";
        $result = json_decode(curl_get($url), true);
        if (!empty($result['errcode'])) throw new Exception('获取access_token失败');
        else {
            Cache::set('AccessToken' . $wechat['app_id'], $result['access_token'], $result['expires_in'] - 360);
            return $result['access_token'];
        }
    }

    public function Send()
    {
        $wx = config('wx');
        $url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token={$this->getAccessToken()}";
        $param = [
            'touser' => 'OPENID',
            'template_id' => 'ngqIpbwh8bUfcSsECmogfXcV14J0tQlEpBO27izEYtY',
            'miniprogram' => [
                'appid' => $wx['app_id'],
                'pagepath' => '/pages/index/index',
            ],
            'data' => [
                'keyword1' => [
                    'value' => '恭喜你购买成功！'
                ],
                'keyword2' => [
                    'value' => '2014年9月22日'
                ],
            ]
        ];
        return curl_post($url, $param);
    }
}