<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class SearchController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('分类管理');
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

        $search = MeiuiSearch::find($parameters);
        if (count($search) == 0) {
            $this->flash->notice("The search did not find any classification");
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



    /**
     * Creates a new company
     */
    public function createAction()
    {
        if ($this->request->isPost()) {
            $form = new SearchForm;
            $company = new MeiuiSearch();

            $data = $this->request->getPost();
            if (!$form->isValid($data, $company)) {
                foreach ($form->getMessages() as $message) {
                    $this->flash->error($message);
                }
                return $this->forward('search/create');
            }

            if ($company->save() == false) {
                foreach ($company->getMessages() as $message) {
                    $this->flash->error($message);
                }
                return $this->forward('search/create');
            }

            $form->clear();

            $this->flash->success("search was created successfully");
            return $this->forward("search/list");
        } else {
            $this->view->form = new SearchForm(null, array('edit' => true));
        }
    }


}
