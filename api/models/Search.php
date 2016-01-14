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
                'pic' => 'www.baidu.com/img/baidu_jgylogo3.gif',
                'tag_title' => '标签名字',
                'pic_id' => '520',
                'tag_id' => '007',
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
                'brief' => '这是一个搜索结果',
                'pic_id' => '520',
                'user_id' => '007',
            );
        }
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }
}