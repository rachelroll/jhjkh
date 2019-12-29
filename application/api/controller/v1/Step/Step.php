<?php

namespace app\api\controller\v1\step;

use app\api\controller\Api;
use think\Loader;
use app\admin\model\app\Step as StepModel;

class Step extends Api
{
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
            $timeStampArr = StepModel::where([
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

            (new StepModel())->saveAll($insertData);
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
     * 运动走势
     */
    public function fetch_chart_info()
    {
        $data = StepModel::where([
            'user_id' => $this->user_id,
        ])->order(['timestamp' => 'desc'])
            ->limit(7)
            ->select();
        $this->returnmsg(200, 'success', $data);
    }

    /**
     * 步数排行
     */
    public function fetch_list()
    {
        $user_id = $this->user_id;
        $data = StepModel::where([
            'timestamp' => strtotime(date('Y-m-d'))
        ])
            ->with([
                'appuser',
                'likeFlag' => function ($query) use ($user_id) {
                    $query->where('operate_user_id', $user_id)->field('id');
                }
            ])
            ->order([
                'step_number' => 'desc'
            ])->paginate();
        $data = json_decode(json_encode($data), true);
        $formaterData = [];
        foreach ($data['data'] as $key => $value) {
            $formaterData[] = [
                'id' => $value['id'],
                'step_number' => $value['step_number'],
                'target_step' => $value['target_step'],
                'like_count' => $value['like_count'],
                'timestamp_text' => $value['timestamp_text'],
                'create_time_text' => $value['create_time_text'],
                'userInfo' => [
                    'id' => $value['appuser']['id'],
                    'nickname' => $value['appuser']['nickname'],
                    'name' => $value['appuser']['name'],
                    'avatar' => $value['appuser']['avatar'],
                ],
                'like_flag' => count($value['like_flag'])
            ];
        }
        $data['data'] = $formaterData;
        $this->returnmsg(200, 'success', $data);
    }
}