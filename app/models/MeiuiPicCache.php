<?php

use Phalcon\Mvc\Model;

class MeiuiPicCache extends Model
{
    public $id;
    public $pic_url;
    public $pic_sys_url;
    public $pic_tag;
    public $pic_app;
    public $pic_desc;
    public $pic_w;
    public $pic_h;
    public $user_id;
    public $create_time;
    public $pic_flag;

    public function initialize()
    {
        $this->belongsTo('user_id', 'MeiuiUser', 'id');
    }

    public function get_pic_flag(){
        if($this->pic_flag == 1){
            return '未审核';
        } else if($this->pic_flag == 2){
            return '审核通过';
        } else if($this->pic_flag == 3){
            return '审核拒绝';
        }
    }

    public function getFlagCheck($pic_flag){
        if ($pic_flag == $this->pic_flag){
            return ' checked ';
        }
    }
}
