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
        $this->hasMany('id', 'MeiuiTag', 'create_user');
        $this->hasMany('id', 'MeiuiApp', 'create_user');
        $this->hasMany('id', 'MeiuiPic', 'create_user');
        $this->hasMany('id', 'MeiuiPicCache', 'create_user');
    }

    public function getSourceDetail()
    {
        if ($this->source == '1') {
            return '微信用户';
        } else if($this->source == '3'){
            return '系统用户';
        } else if($this->source == '2'){
            return '手机用户';
        } else {
            return '未知来源';
        }
    }

    public function getUserPhone(){
        if($this->nickname && $this->phone ){
            if($this->nickname == $this->phone ){
                return $this->nickname;
            } else {
                return $this->nickname . '(' . $this->phone . ')';
            }
        } else {
            return $this->nickname;
        }
    }
}
