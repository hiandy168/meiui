<?php

class Message extends Base
{
    public function __construct(){
        parent::__construct();
    }

    public function index(){
        $data = $this->main;
        $data['status'] = '300200';
        $user_id = intval($_GET['user_id']);
        $page = intval($_GET['page']);
        $limit = 8;
        $num = ($page - 1) * $limit;
        // 查询条件
        $conditions = " user_id = :user_id:";
        $parameters = array(
            "user_id" => $user_id,
        );
        // 用户信息数
        $user_msg_count = MeiuiUserMsg::count(array(
//            'limit' => array('number' => $limit, 'offset' => $num),
            $conditions,
            "bind" => $parameters
        ));
        $all_page = ceil($user_msg_count / $limit);
        // 去当前页的8条信息
        $user_msg = MeiuiUserMsg::find(array(
//            'limit' => array('number' => $limit, 'offset' => $num),
            $conditions,
            "bind" => $parameters
        ));

        $data['data']['page'] = $page . '/' . $all_page;
        foreach ($user_msg as $item) {
            $data['data']['items'][] = array(
                'msg' => $item['msg'],
                'msg_flag' => $item['msg_flag'],
                'created_at' => $item['created_at'],
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