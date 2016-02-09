<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;

class MeiuiApp extends Model
{
    public $id;
    public $app_name;
    public $app_sys;
    public $using_pic;
    public $array_pic;
    public $description;
    public $app_classification;
    public $create_by;
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

    public function getFlagDetail(){
        switch($this-> using_flag){
            case 1:
                return '屏蔽';
            case 2:
                return '显示';
            case 3:
                return '通过审核';
        }
    }

}
