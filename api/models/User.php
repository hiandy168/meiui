<?php

class User extends Base
{
    public function __construct(){
        parent::__construct();
    }

    public function index(){
        $data = $this->main;
        $data['status'] = '400200';
        $data['data']['page'] = '1/15';
        $data['data']['user_name'] = '阿拉丁';
        $data['data']['user_id'] = '007';
        for($i=0; $i<6; $i++){
            $data['data']['items'][] = array(
                'pic' => 'www.baidu.com/img/baidu_jgylogo3.gif',
                'tag_title' => '标题',
                'tag_id' => '520',
            );
        }
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }

    public function collection(){
        $data = $this->main;
        $data['status'] = '400200';
        $data['data']['page'] = '1/15';
        $data['data']['user_name'] = '阿拉丁';
        $data['data']['user_id'] = '007';
        for($i=0; $i<10; $i++){
            $data['data']['items'][] = array(
                'pic' => 'www.baidu.com/img/baidu_jgylogo3.gif',
                'tag_title' => '标题',
                'brief' => '我是比较长的一段简介',
                'tag_id' => '520',
            );
        }
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }

    public function publish(){
        $data = $this->main;
        $data['status'] = '400200';
        $data['data']['page'] = '1/15';
        $data['data']['user_name'] = '阿拉丁';
        $data['data']['user_id'] = '007';
        for($i=0; $i<10; $i++){
            $data['data']['items'][] = array(
                'pic' => 'www.baidu.com/img/baidu_jgylogo3.gif',
                'tag_title' => '标题',
                'brief' => '我是比较长的一段简介',
                'tag_id' => '520',
            );
        }
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }

    public function upload(){
        $data = $this->main;
        $data['status'] = '400200';
        $data['data'] = array();
        $data['alert']['msg'] = $this->lang['upload_success'];
        die(json_encode($data));
    }

    public function feedback(){
        $data = $this->main;
        $data['status'] = '400200';
        $data['data'] = array();
        $data['alert']['msg'] = $this->lang['feedback_success'];
        die(json_encode($data));
    }

}