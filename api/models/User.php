<?php

class User extends Base
{
    public function __construct(){
        parent::__construct();
    }

    public function init(){

    }

    public function edit_tag_link(){
        $data = $this->main;
        $data['status'] = '400200';
        $user_id = intval($_GET['user_id']);
        $pic_id = intval($_GET['pic_id']);
        $tag_name = addslashes($_GET['tag_name']);
        if($user_id and $pic_id){
            $this->del_tag_link();
            $tag_name = explode(',', $tag_name);
            foreach($tag_name as $one_tag_name){
                if($one_tag_name){
                    $tag_link_pic = $this->insert_tag_link_pic($one_tag_name, $pic_id, $user_id);
                    $this->collection($tag_link_pic->tag_id, $user_id);
                    $data['alert']['msg'] = $this->lang['request_success'];
                }
            }
        } else {
            $data['status'] = '401200';
            $data['alert']['msg'] = $this->lang['lack_user_info'];
        }
        die(json_encode($data));
    }

    private function del_tag_link(){
        $data = $this->main;
        $data['status'] = '400200';
        $user_id = intval($_GET['user_id']);
        $conditions = " user_id = :user_id: ";
        $parameters = array(
            "user_id" => $user_id,
        );
        $user_tag = MeiuiUserTag::find(array(
            $conditions,
            "bind" => $parameters
        ));
        if($user_tag){
            $user_tag->delete();
        }
    }
    private function collection($tag_id, $user_id){
        $conditions = " tag_id = :tag_id: and  user_id = :user_id: ";
        $parameters = array(
            "tag_id" => $tag_id,
            "user_id" => $user_id,
        );
        $user_tag = MeiuiUserTag::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if(!$user_tag){
            $user_tag = new MeiuiUserTag();
            $user_tag-> tag_id = $tag_id;
            $user_tag-> user_id = $user_id;
            $user_tag-> created_at = time();
            $user_tag->save();
        }
        return $user_tag;
    }

    public function center(){
        $data = $this->main;
        $data['status'] = '400200';
        $conditions = " id = :id: ";
        $parameters = array(
            "id" => intval($_GET['user_id']),
        );
        $user = MeiuiUser::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if ($user) {
            $data['data']['user_pic'] = $user->pic;
            $data['data']['user_name'] = $user->username;
            $data['data']['user_id'] = $user->id;
        } else {
            $data['alert']['msg'] = $this->lang['lack_user_info'];
            die(json_encode($data));
        }
        $conditions = " user_id = :user_id: ";
        $parameters = array(
            "user_id" => intval($_GET['user_id']),
        );
        $user_tag = MeiuiUserTag::find(array(
            $conditions,
            "bind" => $parameters
        ));
        // 遍历用户标签
        foreach($user_tag as $tag){
            $conditions = " tag_id = :tag_id: group by pic_id";
            $parameters = array(
                "tag_id" => $tag->tag_id,
            );
            $all_pic = MeiuiPicLinkTag::find(array(
                $conditions,
                "bind" => $parameters
            ));
            $tag_tree = array();
            foreach($all_pic as $pic_value){
                $pic = MeiuiPic::findFirst('id='.$pic_value->pic_id);
                $user = MeiuiUser::findFirst('id='.$pic->create_user);
                $tags = MeiuiPicLinkTag::find('pic_id='.$pic->id);
                $sys_tag = [];
                $user_tag = [];
                if (count($tags) > 0) {
                    foreach($tags as $v){
                        if($v->user_id == intval($_GET['user_id'])){
                            $user_tag[] = $v-> tag_name ;
                        } else {
                            $sys_tag[] = $v-> tag_name ;
                        }
                    }
                }
                $tag_tree['tag_name'] = $pic_value->tag_name;
                $tag_tree['items'][] = array(
                    'pic_id' => $pic->id,
                    'pic' => $pic->pic_url,
                    'pic_h' => $pic->pic_h,
                    'pic_w' => $pic->pic_w,
                    'app_id' => $pic->app_id,
                    'user_id' => $pic->create_user,
                    'user_name' => $user->username,
                    'user_pic' => $user->user_pic,
                    'app_name' => $pic->app_name,
                    'brief' => $pic->brief,
                    'sys_tag' => $sys_tag,
                    'user_tag' => $user_tag,
                );
            }
            $data['data']['tags'][] = $tag_tree;
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

    public function add_feedback(){
        $data = $this->main;
        $data['status'] = '400200';
        if(addslashes($_GET['msg']) and intval($_GET['user_id'])){
            $feedback = new MeiuiFeedback();
            $feedback->msg = addslashes($_GET['msg']);
            $feedback->username = intval($_GET['user_id']);
            $feedback->phone = '15068159661';
            $feedback->created_at = time();
            if ($feedback->save() == false) {
                $data['alert']['msg'] = $this->lang['feedback_fail'];
            } else {
                $data['alert']['msg'] = $this->lang['feedback_success'];
            }
        } else {
            $data['alert']['msg'] = $this->lang['feedback_fail'];
        }
        die(json_encode($data));
    }

    private function insert_tag($tag, $user_id){
        $conditions = " tag_name = :tag_name:";
        $parameters = array(
            "tag_name" => $tag,
        );
        $db_tag = MeiuiTag::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if(!$db_tag){
            $db_tag = new MeiuiTag();
            $db_tag-> tag_name = $tag;
            $db_tag-> tag_type = 1;
            $db_tag-> create_user = $user_id;
            $db_tag-> create_time = time();
            $db_tag->save();
        }
        return $db_tag;
    }

    private function insert_tag_link_pic($tag_name, $pic_id, $user_id){
        $tag = $this->insert_tag($tag_name, $user_id);
        $conditions = " tag_name = :tag_name: and pic_id =:pic_id:";
        $parameters = array(
            "tag_name" => $tag->tag_name,
            "pic_id" => $pic_id,
        );
        $db_tag_link_pic = MeiuiPicLinkTag::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if(!$db_tag_link_pic){
            $db_tag_link_pic = new MeiuiPicLinkTag();
            $db_tag_link_pic-> pic_id = $pic_id;
            $db_tag_link_pic-> user_id = $user_id;
            $db_tag_link_pic-> tag_id = $tag->id;
            $db_tag_link_pic-> tag_type = 1;
            $db_tag_link_pic-> tag_name = $tag->tag_name;
            $db_tag_link_pic->save();
        }
        return $db_tag_link_pic;
    }
}