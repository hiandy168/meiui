<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class ContentController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('内容管理');
        parent::initialize();
    }

    public function viewAction(){
        $conditions = " rule_name = :rule_name: ";
        $parameters = array(
            "rule_name" => "index_order"
        );
        $index_order = MeiuiRule::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if($_POST){
            $order_time = intval($_POST['order_time']);
            $index_order->rule_value = $order_time;
            $index_order->save();
        } else {
            $this->view->index_order = $index_order;
        }
    }
    public function addAction(){

    }

}
