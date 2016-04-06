<?php
use Phalcon\Paginator\Adapter\Model as Paginator;
class Search extends Base
{
    public function __construct(){
        parent::__construct();
    }

    public function index(){
        $data = $this->main;
        $data['status'] = '200200';
        $all_search = MeiuiSearch::find();
        foreach($all_search as $search){
            $data['data']['items'][] = array(
                'tag_title' => $search->keyword,
            );
        }
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }

    public function search(){
        $data = $this->main;
        $page = 1;
        if(isset($_GET['page'])){
            $page = intval($_GET['page']);
        }
        $this->set_search_history();
        $keyword = $_GET['keyword'];
        $conditions = " tag_name LIKE :tag_name: group by pic_id";
        $parameters = array(
            "tag_name" => '%' .$keyword. '%',
        );
        $all_pic = MeiuiPicLinkTag::find(array(
            $conditions,
            "bind" => $parameters
        ));
        $paginator = new Paginator(array(
            "data"  => $all_pic,
            "limit" => 10,
            "page"  => $page
        ));
        $all_pic = $paginator->getPaginate();
        $data['status'] = '200200';
        $data['data']['page'] = $all_pic-> current. '/' . $all_pic-> total_pages;
        $login_user_id = intval($_GET['user_id']);
        $login_user_collect = MeiuiUserTag::find('user_id = '.$login_user_id . '  and del_flag = 1 ');
        $login_collect_tag = [];
        if (count($login_user_collect) > 0) {
            foreach($login_user_collect as $collect){
                $login_collect_tag[] = $collect->tag_id;
            }
        }
        foreach($all_pic-> items as $pic_value){
            $pic = MeiuiPic::findFirst('id='.$pic_value->pic_id);
            if($pic){
                $user = MeiuiUser::findFirst('id='.$pic->create_user);
                $tags = MeiuiPicLinkTag::find('pic_id='.$pic->id);
                $sys_tag = [];
                $user_tag = [];
                if (count($tags) > 0) {
                    foreach($tags as $v){
                        if(in_array($v->tag_id, $login_collect_tag)){
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
                    'user_name' => $user->username,
                    'user_pic' => $user->user_pic,
                    'app_name' => $pic->app_name,
                    'brief' => $pic->brief,
                    'sys_tag' => $sys_tag,
                    'user_tag' => $user_tag,
                );
            }
        }
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }

    public function set_search_history(){
        $keyword = $_GET['keyword'];
        $conditions = " keyword = :keyword: and del_flag = 3 ";
        $parameters = array(
            "keyword" => $keyword,
        );
        $search = MeiuiSearch::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if($search){
            $search-> image_count = $search->image_count + 1;
        } else {
            $search = new MeiuiSearch();
            $search-> keyword = $keyword;
            $search-> image_count = 1;
            $search-> del_flag = 3;
        }
        $search->save();
    }
}