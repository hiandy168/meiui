<?php
error_reporting(E_ALL || ~E_NOTICE);
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
        $app_auth = $_SESSION['app_auth'];
        foreach($all_pic-> items as $value){
            $user = MeiuiUsers::findFirst('id='.$value->create_user);
            $tags = MeiuiPicLinkTag::find('pic_id='.$value->id);
            $sys_tag = [];
            $user_tag = [];
            if (count($tags) > 0) {
                foreach($tags as $v){
                    if($v->user_id == $app_auth['app_user_id']){
                        $user_tag[] = $v-> tag_name ;
                    } else {
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
    public function index_data(){
        $data = $this->main;
        $data['status'] = '100200';
        $data['data']['page'] = '1/15';
        for ($i=0;$i<10;$i++){
            $data['data']['items'][] = array(
                'pic' => 'http://7nar8n.com1.z0.glb.clouddn.com/%E6%9E%81%E7%AE%80%EF%BC%8C%E5%A4%B4%E5%83%8F%E8%AE%BE%E7%BD%AE.jpg',
                'pic_h' => '1334',
                'pic_w' => '750',
                'app_id' => '520',
                'user_id' => '007',
                'user_name' => '小李',
                'user_pic' => 'http://7nar8n.com1.z0.glb.clouddn.com/11.png%3Ab7tnvih4dzs7gq5uq9gi',
                'app_name' => 'aaa',
                'brief' => '这是一个短很长很长的简介',
                'classification' => '标签,个人资料'
            );

        }
        $a = 'ae7b155ebd33acb4e69b70446c800d91';
        $data['alert']['msg'] = $this->lang['request_success'];
        die(json_encode($data));
    }
}