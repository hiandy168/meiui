<?php

class Login extends Base
{
    public function __construct(){
        parent::__construct();
    }
    public function weixin(){
        $data = $this->main;
        $data['status'] = '500200';
        $data['data'] = array();
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }
}