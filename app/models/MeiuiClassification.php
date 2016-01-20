<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;

class MeiuiClassification extends Model
{
    public $id;
    public $parentid;
    public $arrparentid;
    public $child;
    public $arrchildid;
    public $catname;
    public $image_count;
    public $user_count;
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
