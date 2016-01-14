<?php
use Phalcon\Config\Adapter\Ini as ConfigIni;
class Base
{
    public $main = array();
    public $lang = array();
    // 添加验证逻辑
    public function __construct(){
        $this -> main = array(
            'status' => '', // 前三位表示业务逻辑（100：主页，200：搜索默认页，300：消息，400：用户信息，500：登陆） 后三位尽量HTTP 协议一致，有待完善
            'data' => array( // 详细业务数据
            ),
            'alert' => array( // 返回消息格式
                'msg' => ''
            ),
        );
        $this -> lang = require(APP_PATH . 'api/config/lang.php');
    }
}