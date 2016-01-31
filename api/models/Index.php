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
            "limit" => 10,
            "page"  => $page
        ));
        $all_pic = $paginator->getPaginate();
        $data['status'] = '100200';
        $data['data']['page'] = $all_pic-> current. '/' . $all_pic-> total_pages;
        foreach($all_pic-> items as $value){
            $user = MeiuiUsers::findFirst('id='.$value->create_by);
            $tags = MeiuiPicLinkTag::find('pic_id='.$value->id);
            $tag = '';
            if (count($tags) > 0) {
                foreach($tags as $v){
                    $tag .= $v-> tag_name . ',';
                }
            }
            $data['data']['items'][] = array(
                'pic' => $value->pic_url,
                'pic_h' => $value->pic_h,
                'pic_w' => $value->pic_w,
                'app_id' => $value->app_id,
                'user_id' => $value->create_by,
                'user_name' => $user->username,
                'user_pic' => $user->user_pic,
                'app_name' => $value->app_name,
                'brief' => $value->brief,
                'tag' => $tag,
            );
        }
        die(json_encode($data));
    }
    public function index_data(){
        $data = $this->main;
        $data['status'] = '100200';
        $data['data']['page'] = '1/15';
        $data['data']['items'][] = array(
                    'pic' => 'www.baidu.com/img/baidu_jgylogo3.gif',
                    'pic_h' => '12',
                    'pic_w' => '24',
                    'app_id' => '520',
                    'user_id' => '007',
                    'user_name' => 'aaa',
                    'user_pic' => 'www.baidu.com/img/baidu_jgylogo3.gif',
                    'app_name' => 'aaa',
                    'brief' => '这是一个短很长很长的简介',
                    'classification' => 'biaoqian'
                );
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }
}