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

    public function pic_item($pic_id){
        $pic = MeiuiPic::findFirst('id='.$pic_id);
        $user = MeiuiUsers::findFirst('id='.$pic->create_user);
        $tags = MeiuiPicLinkTag::find('pic_id='.$pic_id);
        $tag = '';
        if (count($tags) > 0) {
            foreach($tags as $v){
                $tag .= $v-> tag_name . ',';
            }
        }
        $pic_item = array(
            'user_id' => $pic->create_user,
            'user_name' => $user->username,
            'user_pic' => $user->user_pic,
            'pic' => $pic->pic_url,
            'pic_h' => $pic->pic_h,
            'pic_w' => $pic->pic_w,
            'app_id' => $pic->app_id,
            'app_name' => $pic->app_name,
            'brief' => $pic->brief,
            'tag' => $tag,
        );
        return $pic_item;
    }
}