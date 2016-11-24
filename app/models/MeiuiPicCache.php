<?php

use Phalcon\Mvc\Model;

class MeiuiPicCache extends Model
{
    public $id;
    public $pic_url;
    public $pic_tag;
    public $pic_app;
    public $pic_desc;
    public $user_id;
    public $create_time;
    public $pic_flag;
    public function get_pic_flag(){
        if($this->pic_flag == 1){
            return '审核未通过';
        } else {
            return '审核通过';
        }
    }
}
