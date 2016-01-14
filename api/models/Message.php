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
                'sys_rs' => '你发布的图片并未审核通过',
                'pic_id' => '520',
                'user_id' => '007',
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