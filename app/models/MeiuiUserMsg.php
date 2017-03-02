<?php
/**
 * Created by PhpStorm.
 * User: xiaoyunqiang
 * Date: 17/2/28
 * Time: 下午2:45
 */

use Phalcon\Mvc\Model;

class MeiuiUserMsg extends Model
{
    public $id;
    public $user_id;
    public $created_at;
    public $msg_flag;
    public $msg;

}