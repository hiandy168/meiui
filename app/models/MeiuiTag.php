<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;

class MeiuiTag extends Model
{
    public $id;
    public $tag_name;
    public $create_user;
    public $create_time;
    public $tag_type;
    public $using_flag;

    public function validation()
    {
//        $this->validate(new UniquenessValidator(array(
//            'field' => 'username',
//            'message' => 'Sorry, That username is already taken'
//        )));
//        if ($this->validationHasFailed() == true) {
//            return false;
//        }
    }

    public function getFlagDetail()
    {
        if ($this->using_flag == '1') {
            return array('前台显示','屏蔽');
        } else {
            return array('前台已屏蔽','取消屏蔽');
        }
    }
}
