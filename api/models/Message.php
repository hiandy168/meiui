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
        $page = $_GET['page']?intval($_GET['page']):1;
        $limit = 8;
        $num = ($page - 1) * $limit;
        // 查询条件
        $conditions = " user_id = :user_id: and  msg_flag = :msg_flag:";
        $parameters = array(
            "user_id" => $user_id,
            "msg_flag" => 1,
        );
        // 用户信息数
        $user_msg_count = MeiuiUserMsg::count(array(
            $conditions,
            "bind" => $parameters
        ));
        $all_page = ceil($user_msg_count / $limit);
        // 去当前页的8条信息
        $user_msg = MeiuiUserMsg::find(array(
            'limit' => array('number' => $limit, 'offset' => $num),
            $conditions,
            "bind" => $parameters
        ));

        $data['data']['page'] = $page . '/' . $all_page;
        foreach ($user_msg as $item) {
            $data['data']['items'][] = array(
                'id' => $item->id,
                'msg' => $item->msg,
                'msg_flag' => $item->msg_flag,
                'msg_pic' => (string)$item->msg_pic,
                'created_at' => $item->created_at,
            );
        }
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }
    public function delete(){
        $data = $this->main;
        $data['status'] = '300200';
        $data['data'] = array();
        $id = isset($_GET['id']) ? $_GET['id'] : 0 ;
        $conditions = " id = :id:";
        $parameters = array(
            "id" => $id,
        );
        $user_msg = MeiuiUserMsg::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if($user_msg){
            $user_msg-> msg_flag = 2;
            $user_msg->save();
        }
        $data['alert']['msg'] = $this->lang['delete_success'];
        die(json_encode($data));
    }
}