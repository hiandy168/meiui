<?php

class User extends Base
{
    public function __construct(){
        parent::__construct();
    }

    public function init(){

    }
    public function add_tag_link(){
        $data = $this->main;
        $data['status'] = '400200';
        $user_id = intval($_GET['user_id']);
        $pic_id = intval($_GET['pic_id']);
        $tag_name = addslashes($_GET['tag_name']);
        if($user_id and $pic_id and $tag_name){
            $tag_link_pic = $this->insert_tag_link_pic($tag_name, $pic_id, $user_id);
            $rs = $this->collection($tag_link_pic->tag_id, $user_id);
            if($rs){
                $data['alert']['msg'] = $this->lang['request_success'];
            } else {
                $data['status'] = '402200';
                $data['alert']['msg'] = $this->lang['user_link_fail'];
            }
        } else {
            $data['status'] = '401200';
            $data['alert']['msg'] = $this->lang['lack_user_info'];
        }

        die(json_encode($data));
    }

    public function del_tag_link(){
        $data = $this->main;
        $data['status'] = '400200';
        $tag_id = intval($_GET['tag_id']);
        $user_id = intval($_GET['user_id']);
        $conditions = " tag_id = :tag_id: and  user_id = :user_id: ";
        $parameters = array(
            "tag_id" => $tag_id,
            "user_id" => $user_id,
        );
        $user_tag = MeiuiUserTag::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if($user_tag){
            $user_tag->delete();
        }
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
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

    public function publish(){
        $data = $this->main;
        $data['status'] = '400200';
        $data['data']['page'] = '1/15';
        $data['data']['user_name'] = '阿拉丁';
        $data['data']['user_id'] = '007';
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
            $db_tag_link_pic-> tag_name = $tag->tag_name;
            $db_tag_link_pic->save();
        }
        return $db_tag_link_pic;
    }
}