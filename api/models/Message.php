<?php

class Message extends Base
{
    public function __construct(){
        parent::__construct();
    }

    public function index(){
        $data = $this->main;
        $data['status'] = '300200';
        $data['data']['page'] = '1/15';
        for($i=0; $i<10; $i++){
            $data['data']['items'][] = array(
                'pic' => 'www.baidu.com/img/baidu_jgylogo3.gif',
                'pic_h' => '12',
                'pic_w' => '24',
                'msg_flag' => '1',
                'user_id' => '13',
                'msg_id' => '13',
                'sys_rs' => '你发布的图片并未审核通过',
                'msg_time' => time(),
            );
        }
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }
    public function delete(){
        $data = $this->main;
        $data['status'] = '300200';
        $data['data'] = array();
        $data['alert']['msg'] = $this->lang['delete_success'];
        die(json_encode($data));
    }
}