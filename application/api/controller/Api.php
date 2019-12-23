<?php


namespace app\api\controller;


use Firebase\JWT\JWT;
use think\Controller;
use think\Exception;
use think\Request;
use \DomainException;
use \InvalidArgumentException;
use \UnexpectedValueException;

class Api extends Controller
{
    use Send;
    //不需要登录的方法
    protected $noNeedLogin = [];

    //无需鉴权的方法,但需要登录
    protected $noNeedRight = [];

    //用户ID
    protected $user_id = null;

    //请求参数
    protected $clientInfo;

    public function _initialize()
    {
        parent::_initialize();
        $this->clientInfo = $this->request->param();
        $this->checkJwtToken();
    }


    /**
     * 验证token
     */
    public function checkJwtToken()
    {
        $no_check_user_id = $this->match($this->noNeedLogin);
        $param = $this->request->param();

        // 判断是否需要验证权限;
        if ($this->match($this->noNeedRight)) return;
        if (empty($param['token'])) return $this->returnmsg(405, 'token is empty');

        $key = config('jwt.key');

        try {
            $info = JWT::decode($param['token'], $key, ['HS256']);
        } catch (Exception $exception) {
            $this->returnmsg(405, 'token error--' . $exception->getMessage());
        } catch (DomainException $exception) {
            $this->returnmsg(405, 'token error--' . $exception->getMessage());
        } catch (InvalidArgumentException $exception) {
            $this->returnmsg(405, 'token error--' . $exception->getMessage());
        } catch (UnexpectedValueException $exception) {
            $this->returnmsg(405, 'token error--' . $exception->getMessage());
        }

        if (empty($info)) $this->returnmsg(405, 'token error');
        //验证需要用户登录
        if (!$no_check_user_id) {
            if (empty($info->user_id)) return $this->returnmsg(405, 'need login');
            $this->user_id = $info->user_id;
        }

        return $info;
    }

    /**
     * 验证器检查接口中的参数
     */
    public function checkParam($rule, $message = [])
    {
        $result = $this->validate($this->request->param(), $rule, $message);
        if (true !== $result) {
            return $this->returnmsg(400, $result);
        }
    }

    public function match($arr = [])
    {
        $request = Request::instance();
        $arr = is_array($arr) ? $arr : explode(',', $arr);
        if (!$arr) {
            return false;
        }
        $arr = array_map('strtolower', $arr);
        // 是否存在
        if (in_array(strtolower($request->action()), $arr) || in_array('*', $arr)) {
            return true;
        }

        // 没找到匹配
        return false;
    }
}