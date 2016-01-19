<?php

use Phalcon\Mvc\Model;

/**
 * Products
 */
class MeiuiUserData extends Model
{
	/**
	 * @var integer
	 */
	public $id;
	public $user_id;
	public $user_collection_count;
	public $user_classification_count;
	public $user_upload_count;

	/**
	 * Products initializer
	 */
	public function initialize()
	{
		$this->hasMany('user_id', 'MeiuiUsers', 'id');
	}
}
