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
                $len_tag = strlen($tag_name);
                if($len_tag > 99){
                    $data['status'] = '401200';
                    // 用户名过长
                    $data['alert']['msg'] = $this->lang['lack_user_info'];
                } else {
                    if($one_tag_name){
                        $tag_link_pic = $this->insert_tag_link_pic($one_tag_name, $pic_id, $user_id);
                        $this->collection($tag_link_pic->tag_id, $user_id, $pic_id);
                        $data['alert']['msg'] = $this->lang['request_success'];
                    }
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
        $pic_id = intval($_GET['pic_id']);
        $conditions = " user_id = :user_id: and  pic_id = :pic_id: ";
        $parameters = array(
            "user_id" => $user_id,
            "pic_id" => $pic_id,
        );
        $user_tag = MeiuiUserTag::find(array(
            $conditions,
            "bind" => $parameters
        ));
        if($user_tag){
            foreach($user_tag as $one_tag){
                $one_tag->del_flag = 2;
                $one_tag->save();
                $this->del_tag_link_pic($pic_id, $one_tag->tag_id);
            }
        }
    }

    private function collection($tag_id, $user_id, $pic_id){
        $conditions = " tag_id = :tag_id: and  user_id = :user_id:  and  pic_id = :pic_id: ";
        $parameters = array(
            "tag_id" => $tag_id,
            "user_id" => $user_id,
            "pic_id" => $pic_id,
        );
        $user_tag = MeiuiUserTag::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if(!$user_tag){
            $user_tag = new MeiuiUserTag();
            $user_tag-> tag_id = $tag_id;
            $user_tag-> user_id = $user_id;
            $user_tag-> pic_id = $pic_id;
            $user_tag-> created_at = time();
        } else {
            $user_tag->del_flag = 1;
        }
        $user_tag->save();
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
            $data['data']['user_pic'] = $user->user_pic;
            $data['data']['user_name'] = $user->nickname;
            $data['data']['user_id'] = $user->id;
        } else {
            $data['alert']['msg'] = $this->lang['lack_user_info'];
            die(json_encode($data));
        }
        $conditions = " user_id = :user_id: and del_flag = 1";
        $parameters = array(
            "user_id" => intval($_GET['user_id']),
        );
        $user_tag = MeiuiUserTag::find(array(
            $conditions,
            "bind" => $parameters
        ));
        $tag_tree = [];
        $login_collect_tag = [];
        foreach($user_tag as $tag){
            $tag_tree[$tag->tag_id][] = $tag;
            $login_collect_tag[] = $tag->tag_id;
        }
        krsort($tag_tree);
        // 遍历用户标签
        foreach($tag_tree as $tag_key => $tag_value){
            $tag_arr = array();
            foreach($tag_value as $one_pic){
                $pic = MeiuiPic::findFirst('id='.$one_pic->pic_id);
                $user = MeiuiUser::findFirst('id='.$pic->create_user);
                $tags = MeiuiPicLinkTag::find('pic_id='.$pic->id);
                $sys_tag = [];
                $user_tag = [];
                $tag_name = '';
                if (count($tags) > 0) {
                    foreach($tags as $v){
                        if($v-> tag_id == $tag_key){
                            $tag_name =  $v-> tag_name;
                        }
                        if(in_array($v->pic_id, $this->user_tag_array['del_flag'][$v->tag_id])){
                            $user_tag[] = $v-> tag_name ;
                            if($v->tag_type == 2){
                                $sys_tag[] = $v-> tag_name ;
                            }
                        } else if($v->tag_type == 2){
                            $sys_tag[] = $v-> tag_name ;
                        }
                    }
                }
                $tag_arr['tag_name'] = $tag_name;
                $tag_arr['items'][] = array(
                    'pic_id' => $pic->id,
                    'pic' => $pic->pic_url,
                    'pic_h' => $pic->pic_h,
                    'pic_w' => $pic->pic_w,
                    'app_id' => $pic->app_id,
                    'user_id' => $pic->create_user,
                    'user_name' => $user->nickname,
                    'user_pic' => $user->user_pic,
                    'app_name' => $pic->app_name,
                    'brief' => $pic->brief,
                    'sys_tag' => $sys_tag,
                    'user_tag' => $user_tag,
                );
            }
            $data['data']['tags'][] = $tag_arr;
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
                $data['alert']['msg'] = $this->lang['request_success'];
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

    private function del_tag_link_pic($pic_id, $tag_id){
        $conditions = " tag_id = :tag_id: and  pic_id = :pic_id: and del_flag = 1 ";
        $parameters = array(
            "tag_id" => $tag_id,
            "pic_id" => $pic_id,
        );
        $user_tag = MeiuiUserTag::find(array(
            $conditions,
            "bind" => $parameters
        ));
        if($user_tag){
            $conditions = " tag_id = :tag_id: and pic_id =:pic_id:";
            $parameters = array(
                "tag_id" => $tag_id,
                "pic_id" => $pic_id,
            );
            $db_tag_link_pic = MeiuiPicLinkTag::findFirst(array(
                $conditions,
                "bind" => $parameters
            ));
            if($db_tag_link_pic){
                $db_tag_link_pic->delete();
            }
        }
    }

    public function add_collection(){
        $data = $this->main;
        $user_id = intval($_GET['user_id']);
        $pic_id = intval($_GET['pic_id']);
        $conditions = "user_id = :user_id:  and  pic_id = :pic_id: ";
        $parameters = array(
            "user_id" => $user_id,
            "pic_id" => $pic_id,
        );
        $user_collection = MeiuiUserCollection::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if(!$user_collection){
            $user_collection = new MeiuiUserCollection();
            $user_collection-> user_id = $user_id;
            $user_collection-> pic_id = $pic_id;
            $user_collection-> create_time = time();
            $user_collection-> pic_flag = 1;
        } else {
            $user_collection->pic_flag = 1;
        }
        $user_collection->save();
        die(json_encode($data));
    }
    public function del_collection(){
        $data = $this->main;
        $user_id = intval($_GET['user_id']);
        $pic_id = intval($_GET['pic_id']);
        $conditions = "user_id = :user_id:  and  pic_id = :pic_id: ";
        $parameters = array(
            "user_id" => $user_id,
            "pic_id" => $pic_id,
        );
        $user_collection = MeiuiUserCollection::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if($user_collection){
            $user_collection->pic_flag = 2;
            $user_collection->save();
        }
        die(json_encode($data));
    }
    public function list_collection(){
        $data = $this->main;
        $user_id = intval($_GET['user_id']);
        $conditions = "user_id = :user_id:  and  pic_flag = :pic_flag:";
        $parameters = array(
            "user_id" => $user_id,
            "pic_flag" => 1,
        );
        $user_collection = MeiuiUserCollection::find(array(
            $conditions,
            "bind" => $parameters
        ));
        if($user_collection){
            foreach($user_collection as $value){
                $pic = MeiuiPic::findFirst('id='.$value->pic_id);
                $user = MeiuiUser::findFirst('id='.$value->user_id);
                $tags = MeiuiPicLinkTag::find('pic_id='.$value->pic_id);
                $sys_tag = [];
                $user_tag = [];
                if (count($tags) > 0) {
                    foreach($tags as $v){
                        if(in_array($v->pic_id, $this->user_tag_array['del_flag'][$v->tag_id])){
                            $user_tag[] = $v-> tag_name ;
                            if($v->tag_type == 2){
                                $sys_tag[] = $v-> tag_name ;
                            }
                        } else if($v->tag_type == 2){
                            $sys_tag[] = $v-> tag_name ;
                        }
                    }
                }
                $data['data']['items'][] = array(
                    'pic_id' => $pic->id,
                    'pic' => $pic->pic_url,
                    'pic_h' => $pic->pic_h,
                    'pic_w' => $pic->pic_w,
                    'app_id' => $pic->app_id,
                    'user_id' => $pic->create_user,
                    'user_name' => $user->nickname,
                    'user_pic' => $user->user_pic,
                    'app_name' => $pic->app_name,
                    'brief' => $pic->brief,
                    'sys_tag' => $sys_tag,
                    'user_tag' => $user_tag,
                );
            }
        }
        die(json_encode($data));
    }
    public function my_upload(){
        $data = $this->main;
        $pic_url = $_GET['pic_url'];
        $pic_tag = $_GET['pic_tag'];
        $pic_app = $_GET['pic_app'];
        $pic_desc = $_GET['pic_desc'];
        $user_id = $_GET['user_id'];
        if($pic_app and $pic_tag and $user_id and $pic_url){
            $file_info = getimagesize($pic_url);
            $meiui_pic_cache = new MeiuiPicCache();
            $meiui_pic_cache->pic_url = addslashes($pic_url);
            $meiui_pic_cache->pic_tag = addslashes($pic_tag);
            $meiui_pic_cache->pic_app = addslashes($pic_app);
            $meiui_pic_cache->pic_desc = addslashes($pic_desc);
            $meiui_pic_cache->user_id = intval($user_id);
            $meiui_pic_cache->create_time = time();
            $meiui_pic_cache->pic_flag = 1;
            $meiui_pic_cache->pic_w = intval($file_info[0]);
            $meiui_pic_cache->pic_h = intval($file_info[1]);
            if(!$meiui_pic_cache->save()){
                $data['status'] = 410200;
                $data['alert']['msg'] = '保存失败';
            } else {
//                $data['data']['pic_id'] = $meiui_pic_cache-> id;
            }
        } else {
            $data['alert']['msg'] = '缺少参数';
        }
        die(json_encode($data));
    }

    public function my_upload_list(){
        $data = $this->main;
        $user_id = $_GET['user_id'];
        $conditions = "user_id = :user_id:";
        $parameters = array(
            "user_id" => $user_id
        );
        $user_upload = MeiuiPicCache::find(array(
            $conditions,
            "bind" => $parameters
        ));

        $user = MeiuiUser::findFirst('id='.$user_id);
        foreach($user_upload as $one_upload){
            $tag = explode(',',$one_upload->pic_tag);
            $tag = array_filter($tag);
            if($one_upload-> pic_flag == 2){
                $data['data']['items']['pass_pic'][] = array(
                    'user_id' => $user->id,
                    'user_name' => $user->nickname,
                    'pic_url' => $one_upload->pic_url,
                    'pic_tag' => $tag,
                    'pic_app' => $one_upload->pic_app,
                    'pic_desc' => $one_upload->pic_desc,
                    'create_time' => $one_upload->create_time,
                    'pic_flag' => $one_upload-> pic_flag,
                    'pic_w' => $one_upload-> pic_w,
                    'pic_h' => $one_upload-> pic_h,
                );
            } else if($one_upload-> pic_flag == 1){
                $data['data']['items']['unpass_pic'][] = array(
                    'user_id' => $user->id,
                    'user_name' => $user->nickname,
                    'pic_url' => $one_upload->pic_url,
                    'pic_tag' => $tag,
                    'pic_app' => $one_upload->pic_app,
                    'pic_desc' => $one_upload->pic_desc,
                    'create_time' => $one_upload->create_time,
                    'pic_flag' => $one_upload-> pic_flag,
                    'pic_w' => $one_upload-> pic_w,
                    'pic_h' => $one_upload-> pic_h,
                );
            }

        }
        die(json_encode($data));
    }


}