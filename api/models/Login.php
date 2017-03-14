<?php

class Login extends Base
{
    public function __construct(){
        parent::__construct();
    }

    public function weixin(){
        $data = $this->main;
        session_destroy();
        session_start();
        $sessionId = session_id();
        if(!empty($_GET['username']) and !empty($_GET['user_pic'])){
            $conditions = " username = :username: ";
            $parameters = array(
                "username" => $_GET['username'],
            );
            $user = MeiuiUser::findFirst(array(
                $conditions,
                "bind" => $parameters
            ));
            if(!$user){
                $user = new MeiuiUser();
                $user->username = $_GET['username'];
                $user->nickname = $_GET['nickname'];
                $user->user_pic = $_GET['user_pic'];
                $user->created_at = time();
                $user->password = sha1('meiui');
                $name_len = strlen($user->username);
                if($name_len < 20 ){
                    $user->phone = $user->username;
                } else {
                    $user->phone = '';
                }
                $user->email = $_GET['username'] . '@meiui.com';
                if ($user->save() == false) {
                    $data['status'] = $this-> status['save_user_error'];
                    $data['data'] = array();
                    $data['alert']['msg'] = $this-> lang['save_user_error'];
                    die(json_encode($data));
                } else {
                    $user_data = new MeiuiUserData();
                    $user_data->user_id = $user->id;
                    if ($user_data->save() == false) {
                        $data['status'] = $this-> status['save_user_error'];
                        $data['data'] = array();
                        $data['alert']['msg'] = $this-> lang['save_user_error'];
                        die(json_encode($data));
                    }
                    $_SESSION['app_auth'] = array(
                        'app_user_id'=> $user->id,
                        'app_user_name'=> $user->nickname,
                        'app_user_pic'=>$user->user_pic
                    );
                }
            } else {
                $_SESSION['app_auth'] = array(
                    'app_user_id'=> $user->id,
                    'app_user_name'=> $user->nickname,
                    'app_user_pic'=>$user->user_pic
                );
            }
            $data['status'] = '500200';
            $data['data'] = array(
                'user_id' => $user->id,
                'nickname' => $user->nickname,
                'username' => $user->username,
                'user_pic' => $user->user_pic,
                'access_token' => $sessionId,
            );
            $data['alert']['msg'] = $this->lang['request_success'];
            $this->set_user_tag();
            $this->set_user_tag_arr();
            die(json_encode($data));
        } else {
            $data['status'] = $this -> status['lack_user_info'];
            $data['data'] = array();
            $data['alert']['msg'] = $this->lang['lack_user_info'];
            die(json_encode($data));
        }

   }

    public function mobile(){
        $data = $this->main;
        $sessionId = session_id();
        if(!empty($_GET['username']) and !empty($_GET['password'])){
            $conditions = " username = :username:";
            $parameters = array(
                "username" => $_GET['username'],
            );
            $user = MeiuiUser::findFirst(array(
                $conditions,
                "bind" => $parameters
            ));
            if(!$user){
                $user = new MeiuiUser();
                $user->username = $_GET['username'];
                if($_GET['nickname']){
                    $user->nickname = $_GET['nickname'];
                } else {
                    $user->nickname = $_GET['username'];
                }
                $user->user_pic = 'http://www.meiui.me/img/head.jpg';
                $user->created_at = time();
                $user->password = sha1(addslashes($_GET['password']));
                $user->phone = 15068159661;
                $user->email = $_GET['username'] . '@meiui.com';
                if ($user->save() == false) {
                    $data['status'] = $this-> status['save_user_error'];
                    $data['data'] = array();
                    $data['alert']['msg'] = $this-> lang['save_user_error'];
                    die(json_encode($data));
                } else {
                    $user_data = new MeiuiUserData();
                    $user_data->user_id = $user->id;
                    if ($user_data->save() == false) {
                        $data['status'] = $this-> status['save_user_error'];
                        $data['data'] = array();
                        $data['alert']['msg'] = $this-> lang['save_user_error'];
                        die(json_encode($data));
                    }
                }
            } else {
                if($user->password != sha1($_GET['password'])){
                    $data['status'] = $this -> status['pwd_user_error'];
                    $data['data'] = array();
                    $data['alert']['msg'] = $this->lang['pwd_user_error'];
                    die(json_encode($data));
                }
            }
            $data['status'] = '500200';
            $data['data'] = array(
                'user_id' => $user->id,
                'nickname' => $user->nickname,
                'username' => $user->username,
                'user_pic' => $user->user_pic,
                'access_token' => $sessionId,
            );
            $data['alert']['msg'] = $this->lang['request_success'];
            $this->set_user_tag();
            $this->set_user_tag_arr();
            die(json_encode($data));
        } else {
            $data['status'] = $this -> status['lack_user_info'];
            $data['data'] = array();
            $data['alert']['msg'] = $this->lang['lack_user_info'];
            die(json_encode($data));
        }

    }

    public function login_mobile(){
        $data = $this->main;
        $sessionId = session_id();
        if(!empty($_GET['username']) and !empty($_GET['password'])){
            $conditions = " username = :username:";
            $parameters = array(
                "username" => $_GET['username'],
            );
            $user = MeiuiUser::findFirst(array(
                $conditions,
                "bind" => $parameters
            ));
            if(!$user){
                $data['status'] = $this -> status['lack_user_info'];
                $data['data'] = array();
                $data['alert']['msg'] = $this->lang['lack_user_info'];
                die(json_encode($data));
            } else {
                if($user->password != sha1($_GET['password'])){
                    $data['status'] = $this -> status['pwd_user_error'];
                    $data['data'] = array();
                    $data['alert']['msg'] = $this->lang['pwd_user_error'];
                    die(json_encode($data));
                }
            }
            $data['status'] = '500200';
            $data['data'] = array(
                'user_id' => $user->id,
                'nickname' => $user->nickname,
                'username' => $user->username,
                'user_pic' => $user->user_pic,
                'access_token' => $sessionId,
            );
            $data['alert']['msg'] = $this->lang['request_success'];
            $this->set_user_tag();
            $this->set_user_tag_arr();
            die(json_encode($data));
        } else {
            $data['status'] = $this -> status['lack_user_info'];
            $data['data'] = array();
            $data['alert']['msg'] = $this->lang['lack_user_info'];
            die(json_encode($data));
        }
    }

    public function get_msg(){
        $data = $this->main;
        header("Content-Type:text/html;charset=utf-8");
        $apikey = "6974b9344296ea1410a285905c766960"; //修改为您的apikey(https://www.yunpian.com)登陆官网后获取
        $mobile = "15068159661"; //请用自己的手机号代替
        $mobile = $_GET['mobile'];
        if(preg_match("/^1[34578]{1}\d{9}$/",$mobile)){
            $rand_text = rand(1000,9999);
            $text="验证码：" . $rand_text;
            $ch = curl_init();

            /* 设置验证方式 */

            curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept:text/plain;charset=utf-8', 'Content-Type:application/x-www-form-urlencoded','charset=utf-8'));

            /* 设置返回结果为流 */
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

            /* 设置超时时间*/
            curl_setopt($ch, CURLOPT_TIMEOUT, 10);

            /* 设置通信方式 */
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

            // 发送短信
            $send_data = array('text'=>$text,'apikey'=>$apikey,'mobile'=>$mobile);
//            echo '<pre>';print_r($send_data);
            curl_setopt ($ch, CURLOPT_URL, 'https://sms.yunpian.com/v2/sms/single_send.json');
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($send_data));
            $json_data = curl_exec($ch);
            $array = json_decode($json_data,true);
//            echo '<pre>';print_r($array);
            if(isset($array['msg']) and  $array['msg'] == '发送成功'){
                $data['data']['code'] = $rand_text;
            } else {
                $data['data']['code'] = 0;
                $data['alert']['msg'] = $array['detail'];
            }
            // 发送模板短信
            curl_close($ch);
//            $conditions = " username = :username:";
//            $parameters = array(
//                "username" => $mobile,
//            );
//            $user = MeiuiUser::findFirst(array(
//                $conditions,
//                "bind" => $parameters
//            ));
//            if($user){
//                $data['data']['user_info'] = array(
//                    'user_id' => $user->id,
//                    'user_name' => $user->nickname,
//                    'user_pic' => $user->user_pic,
//                );
//            }
        } else {
            $data['status'] = $this -> status['lack_user_info'];
            $data['data'] = array();
            $data['alert']['msg'] = $this->lang['lack_user_info'];
        }
        die(json_encode($data));
    }

    public function pwd_back(){
        $data = $this->main;
        if(!empty($_GET['username']) and !empty($_GET['password'])){
            $conditions = " username = :username:";
            $parameters = array(
                "username" => $_GET['username'],
            );
            $user = MeiuiUser::findFirst(array(
                $conditions,
                "bind" => $parameters
            ));
            if(!$user){
                $data['status'] = $this-> status['save_user_error'];
                $data['data'] = array();
                $data['alert']['msg'] = $this-> lang['save_user_error'];
                die(json_encode($data));
            } else {
                $user->password = sha1($_GET['password']);
                $user->save();
            }
            $data['status'] = '500200';
            $data['data']['user_info'] = array(
                'user_id' => $user->id,
                'username' => $user->username,
                'nickname' => $user->nickname,
                'user_pic' => $user->user_pic,
            );
            $data['alert']['msg'] = $this->lang['request_success'];
            die(json_encode($data));
        } else {
            $data['status'] = $this -> status['lack_user_info'];
            $data['data'] = array();
            $data['alert']['msg'] = $this->lang['lack_user_info'];
            die(json_encode($data));
        }

    }

    public function upload_pic(){
        $data = $this->main;
        if(isset($_FILES['file']["name"])){
            move_uploaded_file($_FILES['file']['tmp_name'], "./upload/" . time() . $_FILES["file"]["name"]);
            $data['data']['img_url'] = 'meiui.me' . "/upload/" . time() . $_FILES["file"]["name"];
        } else {
            $data['status'] = $this-> status['save_user_error'];
            $data['alert']['msg'] = '缺少文件数据';
        }
        die(json_encode($data));
    }

    public function inner_upload_pic(){
        if(isset($_FILES['user_pic']["name"])){
            move_uploaded_file($_FILES['user_pic']['tmp_name'], "./upload/" . time() . $_FILES["user_pic"]["name"]);
            $url = 'meiui.me' . "/upload/" . time() . $_FILES["user_pic"]["name"];
            return $url;
        } else {
            $data['status'] = $this-> status['save_user_error'];
            $data['alert']['msg'] = '缺少文件数据';
            die(json_encode($data));
        }
    }

    public function edit_user(){
        $data = $this->main;
        $conditions = " id = :user_id:";
        $parameters = array(
            "user_id" => $_GET['user_id'],
        );
        $user = MeiuiUser::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if(!$user){
            $data['status'] = $this-> status['save_user_error'];
            $data['data'] = array();
            $data['alert']['msg'] = $this-> lang['save_user_error'];
            die(json_encode($data));
        } else {
            if($_GET['nickname']){
                $user->nickname = addslashes($_GET['nickname']);
            }
            if($_GET['user_pic']){
//                $user->user_pic = $this->inner_upload_pic();
                $user->user_pic = addslashes($_GET['user_pic']);
            }
            if($user->save()){
                $data['status'] = '500200';
//                $data['data'] = array(
//                    'user_id' => $user->id,
//                    'user_name' => $user->nickname,
//                    'user_pic' => $user->user_pic,
//                );
                $data['alert']['msg'] = $this->lang['request_success'];
            } else {
                $data['status'] = $this-> status['save_user_error'];
                $data['data'] = array();
                $data['alert']['msg'] = $this-> lang['save_user_error'];
            }
            die(json_encode($data));
        }

    }
}