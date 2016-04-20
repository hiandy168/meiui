<?php

class Login extends Base
{
    public function __construct(){
        parent::__construct();
    }
    public function weixin(){
        $data = $this->main;
        $_SESSION['app_auth'] = '';
        if (empty($_SESSION['app_auth'])){
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
                    'user_name' => $user->nickname,
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
        } else {
            $data['status'] = '500200';
            $data['data'] = array();
            $data['alert']['msg'] = $this->lang['request_success'];
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
            // 发送模板短信
            curl_close($ch);
            $data['data']['code'] = $rand_text;
        } else {
            $data['status'] = $this -> status['lack_user_info'];
            $data['data'] = array();
            $data['alert']['msg'] = $this->lang['lack_user_info'];
        }
        die(json_encode($data));
    }
}