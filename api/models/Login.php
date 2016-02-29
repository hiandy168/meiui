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
                            'app_user_name'=> $user->username,
                            'app_user_pic'=>$user->user_pic
                        );
                    }
                } else {
                    $_SESSION['app_auth'] = array(
                        'app_user_id'=> $user->id,
                        'app_user_name'=> $user->username,
                        'app_user_pic'=>$user->user_pic
                    );
                }
                $data['status'] = '500200';
                $data['data'] = array(
                    'user_id' => $user->id,
                    'user_name' => $user->username,
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
}