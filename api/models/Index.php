<?php

class Index extends Base
{
    public function __construct(){
        parent::__construct();
    }
    public function welcome(){
        $data = $this->main;
        $data['status'] = '100200';
        $data['data'] = array('content' => '帮助互联网从业者更好的微（chao）创（xi）新');
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }
    public function index(){
        $data = $this->main;
        $data['status'] = '100200';
        $data['data']['page'] = '1/15';
        for($i=0; $i<10; $i++){
            $data['data']['items'][] = array(
                    'pic' => 'www.baidu.com/img/baidu_jgylogo3.gif',
                    'brief' => '这是一个短很长很长的简介',
                    'pic_id' => '520',
                    'user_id' => '007',
                );
        }
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }
    public function detail(){
        $data = $this->main;
        $data['status'] = '100200';
        $data['data'] = array(
            'pic' => 'www.baidu.com/img/baidu_jgylogo3.gif',
            'content' => '这是一个短很长很长的内容',
            'pic_id' => '520',
            'user_id' => '007',
        );
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }
}