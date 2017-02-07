<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;

class MeiuiApp extends Model
{
    public $id;
    public $app_name;
    public $app_sys;
    public $description;
    public $create_user;
    public $create_time;
    public $using_flag;

    public function initialize()
    {
        $this->belongsTo('create_user', 'MeiuiUser', 'id');
    }

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

    public function getAppSysDetail(){
        switch($this-> app_sys){
            case 1:
                return 'android';
            case 2:
                return 'ios';
        }
    }

}
