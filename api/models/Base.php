<?php
use Phalcon\Config\Adapter\Ini as ConfigIni;
class Base
{
    public $main = array();
    public $lang = array();
    public $status = array();
    public $sys = array();

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
        $this -> status = require(APP_PATH . 'api/config/status.php');
        $this -> sys = require(APP_PATH . 'api/config/sys.php');
        $this -> validator();
    }
    // TODO 需要把GET 改成 POST
    public function validator(){
        if(isset($_GET['mac']) and isset($_GET['token'])){
            $mac = $_GET['mac'];
            $client_token = $_GET['token'];
            $server_token = md5($this -> sys['token_key'] . $mac . date('Ymd'));
//            echo $server_token ;die();
            if($client_token !== $server_token){
                $this ->main['status'] = $this -> status['token_error'];
                $this ->main['alert']['msg'] = $this -> lang['token_error'];
                die(json_encode($this ->main));
            }
        } else {
            $this ->main['status'] = $this -> status['no_mac'];
            $this ->main['alert']['msg'] = $this -> lang['no_mac'];
            die(json_encode($this ->main));
        };
    }
}