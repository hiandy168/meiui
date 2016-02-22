<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class AppController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('意见反馈');
        parent::initialize();
    }
    public function listAction()
    {
        if ($this->request->getQuery("page", "int")){
            $numberPage = $this->request->getQuery("page", "int");
        } else {
            $numberPage = 1;
        }

        $where = "using_flag != 3";
        $app = MeiuiApp::find();
        if (count($app) == 0) {
            $this->flash->notice("The search did not find any feedback");
        }

        $paginator = new Paginator(array(
            "data"  => $app,
            "limit" => 10,
            "page"  => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
        $this->view->companies = $app;
    }

    public function unpassAction()
    {
        if ($this->request->getQuery("page", "int")){
            $numberPage = $this->request->getQuery("page", "int");
        } else {
            $numberPage = 1;
        }
        $where = "using_flag = 3";
        $app = MeiuiApp::find($where);
        if (count($app) == 0) {
            $this->flash->notice("The search did not find any feedback");
            return $this->forward("search/list");
        }

        $paginator = new Paginator(array(
            "data"  => $app,
            "limit" => 10,
            "page"  => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
        $this->view->companies = $app;
    }
}
