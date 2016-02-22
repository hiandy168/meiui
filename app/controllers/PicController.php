<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class PicController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('图片管理');
        parent::initialize();
    }
    public function listAction()
    {
        if ($this->request->getQuery("page", "int")){
            $numberPage = $this->request->getQuery("page", "int");
        } else {
            $numberPage = 1;
        }
        $pic = MeiuiPic::find();
        if (count($pic) == 0) {
            $this->flash->notice("The search did not find any pic");
        }

        $paginator = new Paginator(array(
            "data"  => $pic,
            "limit" => 10,
            "page"  => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
        $this->view->companies = $pic;
    }
}
