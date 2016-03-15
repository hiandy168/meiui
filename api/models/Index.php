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
        $paginator = new Paginator(array(
            "data"  => $app,
            "limit" => 8,
            "page"  => $page
        ));
        $all_pic = $paginator->getPaginate();
        $data['status'] = '100200';
        $data['data']['page'] = $all_pic-> current. '/' . $all_pic-> total_pages;
        $login_user_id = intval($_GET['user_id']);
        $login_user_collect = MeiuiUserTag::find('user_id='.$login_user_id);
        $login_collect_tag = [];
        if (count($login_user_collect) > 0) {
            foreach($login_user_collect as $collect){
                $login_collect_tag[] = $collect->tag_id;
            }
        }
        foreach($all_pic-> items as $value){
            $user = MeiuiUser::findFirst('id='.$value->create_user);
            $tags = MeiuiPicLinkTag::find('pic_id='.$value->id);
            $sys_tag = [];
            $user_tag = [];
            if (count($tags) > 0) {
                foreach($tags as $v){
                    if(in_array($v->tag_id, $login_collect_tag)){
                        $user_tag[] = $v-> tag_name ;
                    } else if($v->tag_type == 2){
                        $sys_tag[] = $v-> tag_name ;
                    }
                }
            }
            $data['data']['items'][] = array(
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
        }
        die(json_encode($data));
    }
}