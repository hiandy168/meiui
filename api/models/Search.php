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

        foreach($all_pic-> items as $pic_value){
            $pic = MeiuiPic::findFirst('id='.$pic_value->pic_id);
            $user = MeiuiUser::findFirst('id='.$pic->create_user);
            $tags = MeiuiPicLinkTag::find('pic_id='.$pic->id);
            $tag = '';
            if (count($tags) > 0) {
                foreach($tags as $v){
                    $tag .= $v-> tag_name . ',';
                }
            }
            $data['data']['items'][] = array(
                'pic' => $pic->pic_url,
                'pic_h' => $pic->pic_h,
                'pic_w' => $pic->pic_w,
                'app_id' => $pic->app_id,
                'user_id' => $pic->create_user,
                'user_name' => $user->username,
                'user_pic' => $user->user_pic,
                'app_name' => $pic->app_name,
                'brief' => $pic->brief,
                'tag' => $tag,
            );
        }
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }
}