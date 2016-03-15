<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;

class MeiuiUser extends Model
{
    public $id;
    public $username;
    public $nickname;
    public $password;
    public $phone;
    public $email;
    public $created_at;
    public $del_flag;
    public $source;
    public $user_pic;

    public function validation()
    {
        $this->validate(new EmailValidator(array(
            'field' => 'email'
        )));
        $this->validate(new UniquenessValidator(array(
            'field' => 'email',
            'message' => 'Sorry, The email was registered by another user'
        )));
        $this->validate(new UniquenessValidator(array(
            'field' => 'username',
            'message' => 'Sorry, That username is already taken'
        )));
        if ($this->validationHasFailed() == true) {
            return false;
        }
    }

    public function initialize()
    {
        $this->belongsTo('id', 'MeiuiUserData', 'user_id');
    }

    public function getSourceDetail()
    {
        if ($this->source == '1') {
            return '微信';
        } else if($this->source == '3'){
            return '后台用户';
        } else {
            return '网站注册';
        }
    }
}
