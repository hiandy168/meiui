<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;

class MeiuiPic extends Model
{
    public $id;
    public $app_id;
    public $app_name;
    public $pic_sys;
    public $pic_url;
    public $pic_w;
    public $pic_h;
    public $brief;
    public $create_user;
    public $create_time;
    public $using_flag;

    public function initialize()
    {
        $this->belongsTo('create_user', 'MeiuiUser', 'id');
    }

    public function getFlagDetail()
    {
        if ($this->using_flag == '1') {
            return array('未审核通过','通过');
        } else if($this->using_flag == '2'){
            return array('删除','显示');
        } else {
            return array('显示','删除');
        }
    }
}
