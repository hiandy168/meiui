<?php

class Search extends Base
{
    public function __construct(){
        parent::__construct();
    }

    public function index(){
        $data = $this->main;
        $data['status'] = '200200';
        for($i=0; $i<9; $i++){
            $data['data']['items'][] = array(
                'tag_title' => '默认标签',
            );
        }
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }

    public function search(){
        $data = $this->main;
        $data['status'] = '200200';
        $data['data']['page'] = '1/15';
        for($i=0; $i<10; $i++){
            $data['data']['items'][] = array(
                'pic' => 'www.baidu.com/img/baidu_jgylogo3.gif',
                'pic_detail' => 'www.baidu.com/img/baidu_jgylogo3.gif',
                'pic_h' => '12',
                'pic_w' => '24',
                'pic_detail_h' => '12',
                'pic_detail_w' => '24',
                'brief' => '这是一个短很长很长的简介',
                'app_id' => '520',
                'user_id' => '007',
                'user_name' => 'aaa',
                'user_pic' => 'www.baidu.com/img/baidu_jgylogo3.gif',
                'app_name' => 'aaa',
                'classification' => 'biaoqian'
            );
        }
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }
}