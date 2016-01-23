<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;

class MeiuiFeedback extends Model
{
    public $id;
    public $username;
    public $phone;
    public $email;
    public $pic_arr;
    public $created_at;
    public $msg_flag;
    public $msg;

    public function beforeCreate()
    {
        $this->created_at = time();
    }

    public function getUsernameDetail(){
        if($this->username){
            return $this->username;
        } else {
            return '非注册用户';
        }
    }

    public function getFlagDetail(){
        switch($this->msg_flag){
            case 1:
                return '未处理';
            case 2:
                return '已处理';
        }
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

}
