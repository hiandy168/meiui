<?php
use Phalcon\Paginator\Adapter\Model as Paginator;
class Index extends Base
{
    public function __construct(){
        parent::__construct();
    }

    // TODO 修改成POST
    public function index(){
        $page = 1;
        if(isset($_GET['page'])){
            $page = intval($_GET['page']);
        }
        $app = MeiuiPic::find();
        $app_count = count($app);
        $paginator = new Paginator(array(
            "data"  => $app,
            "limit" => 8,
            "page"  => $page
        ));
        $all_pic = $paginator->getPaginate();
        $this -> main['status'] = '100200';
        $this -> main['data']['page'] = $all_pic-> current. '/' . $all_pic-> total_pages;
        $conditions = " rule_name = :rule_name: ";
        $parameters = array(
            "rule_name" => "index_order"
        );
        $index_order = MeiuiRule::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if($index_order->rule_value){
            $all_pic-> items = $this->get_rand_pic($app_count);
        }

        $user_id = intval($_GET['user_id']);
        $user_collection_pic_id = [];
        if($user_id){
            $conditions = "user_id = :user_id:  and  pic_flag = :pic_flag:";
            $parameters = array(
                "user_id" => $user_id,
                "pic_flag" => 1,
            );
            $user_collection = MeiuiUserCollection::find(array(
                $conditions,
                "bind" => $parameters
            ));
            foreach ($user_collection as $one_collection){
                $user_collection_pic_id[] = $one_collection->pic_id;
            }
        }
        foreach($all_pic-> items as $value){
            $user = MeiuiUser::findFirst('id='.$value->create_user);
            $tags = MeiuiPicLinkTag::find('pic_id='.$value->id);
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
            $o_item = array(
                'pic_id' => $value->id,
                'pic' => $value->pic_url,
                'pic_h' => $value->pic_h,
                'pic_w' => $value->pic_w,
                'app_id' => $value->app_id,
                'user_id' => $value->create_user,
                'user_name' => $user->username,
                'user_pic' => $user->user_pic,
                'app_name' => $value->app_name,
                'brief' => $value->brief,
                'sys_tag' => $sys_tag,
                'user_tag' => $user_tag,
            );
            if(in_array($value->id,$user_collection_pic_id)){
                $o_item['is_like'] = 1;
            } else {
                $o_item['is_like'] = 2;
            }
            $this -> main['data']['items'][] = $o_item;
        }
        $this -> main['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($this -> main));
    }
    // 获取随机图片
    public function get_rand_pic($app_count){
        $pic_where = '';
        for($rand_id_array = [] ; count($rand_id_array) < 8 ;){
            $rand_id = rand(1,$app_count);
            if(!in_array($rand_id, $rand_id_array)){
                $rand_id_array[] = $rand_id;
                if($pic_where){
                    $pic_where = $pic_where . ' , ' . $rand_id;
                } else {
                    $pic_where = $rand_id;
                }
            }
        }
        $rand_pic_array = MeiuiPic::find('id in (  ' . $pic_where . ' )');
        return $rand_pic_array;
    }

    public function get_pic_detail(){
        $pic_id = intval($_GET['pic_id']);
        $pic_item = MeiuiPic::find('id = ' . $pic_id );
        $user_id = intval($_GET['user_id']);
        $user_collection_pic_id = [];
        if($user_id){
            $conditions = "user_id = :user_id:  and  pic_flag = :pic_flag:";
            $parameters = array(
                "user_id" => $user_id,
                "pic_flag" => 1,
            );
            $user_collection = MeiuiUserCollection::find(array(
                $conditions,
                "bind" => $parameters
            ));
            foreach ($user_collection as $one_collection){
                $user_collection_pic_id[] = $one_collection->pic_id;
            }
        }
        if(count($pic_item)){
            foreach($pic_item as $value){
                $user = MeiuiUser::findFirst('id='.$value->create_user);
                $tags = MeiuiPicLinkTag::find('pic_id='.$value->id);
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
                $o_item = array(
                    'pic_id' => $value->id,
                    'pic' => $value->pic_url,
                    'pic_h' => $value->pic_h,
                    'pic_w' => $value->pic_w,
                    'app_id' => $value->app_id,
                    'user_id' => $value->create_user,
                    'user_name' => $user->nickname,
                    'user_pic' => $user->user_pic,
                    'app_name' => $value->app_name,
                    'brief' => $value->brief,
                    'sys_tag' => $sys_tag,
                    'user_tag' => $user_tag,
                );

                if(in_array($value->id,$user_collection_pic_id)){
                    $o_item['is_like'] = 1;
                } else {
                    $o_item['is_like'] = 2;
                }
                $this -> main['data']['items'][] = $o_item;
            }
            $this -> main['alert']['msg'] = $this->lang['request_success'];
        } else {
            $this -> main['alert']['msg'] = '不存在图片';
        }
        die(json_encode($this -> main));
    }
}