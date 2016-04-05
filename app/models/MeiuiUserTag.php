<?php

use Phalcon\Mvc\Model;

class MeiuiUserTag extends Model
{
    public $id;
    public $user_id;
    public $tag_id;
    public $pic_id;
    public $del_flag;
    public $created_at;
}
