<?php


namespace app\api\controller\v1;


use app\admin\model\shop\order\Address as AddressModel;
use app\api\controller\Api;
use think\Db;
use think\Exception;

class Address extends Api
{
    /**
     * 获取地址列表
     * @param default 1
     */
    public function get_list()
    {
        
        $data = AddressModel::where([
            'user_id' => $this->user_id,
            'status' => 'normal'
        ])->order([
            'default' => 'desc',
            'id' => 'desc'
        ])->select();
        $this->returnmsg(200, 'success', $data);
    }

    /**
     * 获取地址数量
     */
    public function get_count()
    {
        $data = AddressModel::where([
            'user_id' => $this->user_id,
            'status' => 'normal'
        ])->order([
            'default' => 'desc',
            'id' => 'desc'
        ])->count();
        $this->returnmsg(200, 'success', $data);
    }

    /**
     * 获取默认收货地址
     */
    public function get_default()
    {
        $data = AddressModel::where([
            'user_id' => $this->user_id,
            'status' => 'normal'
        ])->order([
            'default' => 'desc',
            'id' => 'asc'
        ])->find();
        $this->returnmsg(200, 'success', $data);
    }

    /**
     * 更改、新增地址
     */
    public function save()
    {
        $this->checkParam([
            'name' => 'require',
            'phone_number' => 'require|number|/^1[3456789]\d{9}$/',
            'address_city' => 'require',
            'address_more' => 'require',
            'longitude' => 'require',
            'latitude' => 'require',
            'default' => 'require',
        ]);
        if (is_array($this->request->param()['address_city'])) {
            $addr = implode('/', $this->request->param()['address_city']);
        } else {
            $addr = $this->request->param()['address_city'];
        }
        Db::startTrans();
        try {

            if ($this->request->param()['default'] == 1) {
                AddressModel::where([
                    'user_id' => $this->user_id,
                    'default' => 1
                ])->update([
                    'default' => 0
                ]);
            }

            $result = (new AddressModel())->isUpdate(!empty($this->request->param()['id']))->save([
                'id' => !empty($this->request->param()['id']) ? $this->request->param()['id'] : '',
                'user_id' => $this->user_id,
                'name' => $this->request->param()['name'],
                'phone_number' => $this->request->param()['phone_number'],
                'address_city' => $addr,
                'address_more' => $this->request->param()['address_more'],
                'longitude' => $this->request->param()['longitude'],
                'latitude' => $this->request->param()['latitude'],
                'default' => $this->request->param()['default'],
                'status' => 'normal',
            ]);

        } catch (Exception $exception) {
            Db::rollback();
            $this->returnmsg(400, $exception->getMessage());
        }
        Db::commit();
        $this->returnmsg(200, 'success', $result);

    }

    /**
     * 获取地址详情
     * @param id
     */
    public function get_detail()
    {
        $this->checkParam([
            'id' => 'require|number'
        ]);
        $res = AddressModel::where([
            'id' => $this->request->param()['id'],
            'user_id' => $this->user_id,
        ])->limit(1)->find();
        $this->returnmsg(200, 'success', $res);
    }

    /**
     * 删除地址
     * @param id
     */
    public function delete()
    {
        $this->checkParam([
            'id' => 'require',
        ]);
        $res = AddressModel::where([
            'user_id' => $this->user_id,
            'id' => $this->request->param()['id'],
        ])->delete();
        $res ? $this->returnmsg(200, '删除成功') : $this->returnmsg(400, '删除失败');
    }

    /**
     * 单独将某一地址设为默认
     * @param id
     */
    public function set_default()
    {
        $this->checkParam([
            'id' => 'require',
        ]);
        Db::startTrans();
        try {
            AddressModel::where([
                'user_id' => $this->user_id,
                'id' => $this->request->param()['id'],
            ])->update([
                'default' => 1
            ]);

            AddressModel::where([
                'user_id' => $this->user_id,
                'id' => ['neq', $this->request->param()['id']],
            ])->update([
                'default' => 0
            ]);
        } catch (Exception $exception) {
            Db::rollback();
            $this->returnmsg(400, $exception->getMessage());
        }
        Db::commit();
        $this->returnmsg(200, 'success');
    }
}