<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class ContentController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('内容管理');
        parent::initialize();
    }

    public function viewAction(){
        $conditions = " rule_name = :rule_name: ";
        $parameters = array(
            "rule_name" => "index_order"
        );
        $index_order = MeiuiRule::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if($_POST){
            $order_time = intval($_POST['order_time']);
            $index_order->rule_value = $order_time;
            $index_order->save();
        } else {
            $this->view->index_order = $index_order;
        }
    }
    public function addAction(){
        $alert_message = "暂停开放 <br/>请联系monkey";
        $this->flash->notice($alert_message);

        // TODO 注意标签分割字符串问题
//        if($_POST){
//            $img_url = 'http://' . Common::bucket .'.'. Common::endpoint . $_POST['img_url'];
//            $this->add_sys_pic($img_url);
//        }else{
//
//        }
    }

    public function add_sys_pic($img_url,$user_id){
        $array_url  = explode('http://' . Common::bucket .'.' . Common::endpoint . '/app/', $img_url);
        $img_value = explode('/', $array_url[1]);
        $url_value = getimagesize($img_url);
        if($url_value and isset($img_value[0]) and isset($img_value[1])){
            $this->insert_data($img_value[0], $img_value[1], $url_value, $img_url,$user_id);
        }
    }

    public function insert_data($app, $file, $file_info, $pic_url,$user_id){
        //先判断APP 是否存在，不存在新建APP
        $conditions = " app_name = :app_name: ";
        $parameters = array(
            "app_name" => $app,
        );
        $db_app = MeiuiApp::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if(!$db_app){
            $db_app = new MeiuiApp();
            $db_app-> app_name = $app;
            $db_app-> create_user = $user_id;
            $db_app-> create_time = time();
            $db_app->save();
        }

        //再判断PIC 是否存在，不存在新建PIC
        $tags = explode('.', $file);
//        $pic_url = 'http://img.meiui.me' . $_POST['img_url'];

        $conditions = " pic_url = :pic_url: ";
        $parameters = array(
            "pic_url" => $pic_url,
        );
        $db_pic = MeiuiPic::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if(!$db_pic){
            $db_pic = new MeiuiPic();
            $db_pic-> app_id = $db_app->id;
            $db_pic-> app_name = $db_app->app_name;
            $db_pic-> pic_url = $pic_url;
            $db_pic-> pic_w = $file_info[0];
            $db_pic-> pic_h = $file_info[1];
            $db_pic-> brief = (string)'' ;
            $db_pic-> create_user = $user_id;
            $db_pic-> create_time = time();
            $db_pic->save();
        }
        // 原本基础数据图片标签分隔符不同
//        $all_tag = explode('，',$tags[0]);
        $all_tag = explode(',',$tags[0]);
        // 判断标签 不存在则插入
        $last_num = count($all_tag) - 1;
        $last_tag = $all_tag[$last_num];
        if(intval(substr($last_tag, -10)) > 100000000) {
            $all_tag[$last_num] = substr($last_tag, 0, -10);
        }

        $all_tag[] = $app;
        foreach($all_tag as $one_tag){
            $this-> insert_tag_link_pic($one_tag, $db_pic->id,$user_id);
        }
        $alert_message = "添加成功 <br/>APP:" . $app . '<br/>标签:' . $tags[0] . '<br/>url:' . $pic_url;
        $this->flash->notice($alert_message);
    }

    public function insert_tag($tag,$user_id){
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

    public function insert_tag_link_pic($tag_name, $pic_id,$user_id){
        $tag = $this->insert_tag($tag_name,$user_id);
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