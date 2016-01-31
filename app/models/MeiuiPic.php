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
    public $create_by;
    public $create_time;
    public $using_flag;
}
