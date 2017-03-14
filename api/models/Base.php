<?php
error_reporting(E_ALL || ~E_NOTICE);
use Phalcon\Config\Adapter\Ini as ConfigIni;
class Base
{
    public $main = array();
    public $lang = array();
    public $status = array();
    public $sys = array();
    public $user_tag_array = array();
    public function __construct(){
        if(isset($_GET['access_token'])){
            session_destroy();
            session_id($_GET['access_token']);
            @session_start();
            var_dump($_GET['access_token']);
            var_dump($_SESSION);die();
        }
        $this -> lang = require(APP_PATH . 'api/config/lang.php');
        $this -> status = require(APP_PATH . 'api/config/status.php');
        $this -> sys = require(APP_PATH . 'api/config/sys.php');
        $this -> validator();
        $this -> main = array(
            'status' => 999200, // 前三位表示业务逻辑（100：主页，200：搜索默认页，300：消息，400：用户信息，500：登陆） 后三位尽量HTTP 协议一致，有待完善
            'data' => array( // 详细业务数据
                'page' => '0/0',
                'user_tag_history' => [],
            ),
            'alert' => array( // 返回消息格式
                'msg' => $this->lang['request_success']
            ),
        );
        $this->set_user_tag();
        $this->set_user_tag_arr();
    }
    // TODO 需要把GET 改成 POST
    public function validator(){
        if(isset($_GET['mac']) and isset($_GET['token'])){
            $mac = $_GET['mac'];
            $client_token = $_GET['token'];
//            $server_token = md5($this -> sys['token_key'] . $mac . date('Ymd'));
            $server_token = $_GET['token'];
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
        $user = MeiuiUser::findFirst('id='.$pic->create_user);
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

    public function set_user_tag($user_id = 0){
        if(!$user_id){
            $user_id = $_GET['user_id'];
        }
        $conditions = " user_id = :user_id: ";
        $parameters = array(
            "user_id" => intval($user_id),
        );
        $user_tag = MeiuiUserTag::find(array(
            $conditions,
            "bind" => $parameters
        ));
        if($user_tag){
            foreach($user_tag as $one){
                $conditions = " id = :id: ";
                $parameters = array(
                    "id" => $one->tag_id,
                );
                $history_tag = MeiuiTag::findFirst(array(
                    $conditions,
                    "bind" => $parameters
                ));
                if($history_tag){
                    if(!in_array($history_tag->tag_name, $this -> main['data']['user_tag_history'])){
                        $this -> main['data']['user_tag_history'][] = $history_tag->tag_name;
                    }
                }
            }
            $this -> main['data']['user_tag_history'] = array_reverse($this -> main['data']['user_tag_history']);
        }
    }

    public function set_user_tag_arr($login_user_id = 0){
        if(!$login_user_id){
            $login_user_id = intval($_GET['user_id']);
        }
        if($login_user_id){
            $login_user_collect = MeiuiUserTag::find('user_id = '.$login_user_id);
            if (count($login_user_collect) > 0) {
                foreach($login_user_collect as $collect){
                    if($collect->del_flag == 1){
                        $this->user_tag_array['tag_key_pic_value'][$collect->tag_id][$collect->pic_id] = $collect->del_flag;
                        $this->user_tag_array['pic_key_pic_value'][$collect->pic_id][$collect->tag_id] = $collect->del_flag;
                        $this->user_tag_array['del_flag'][$collect->tag_id][] = $collect->pic_id;
                    }
                }
            }
        }
    }
}