<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class FeedbackController extends ControllerBase
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

        $parameters = array();

        $search = MeiuiFeedback::find($parameters);
        if (count($search) == 0) {
            $this->flash->notice("The search did not find any feedback");
            return $this->forward("search/list");
        }

        $paginator = new Paginator(array(
            "data"  => $search,
            "limit" => 10,
            "page"  => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
        $this->view->companies = $search;
    }
}
