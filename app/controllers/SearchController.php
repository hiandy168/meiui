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

        $search = MeiuiSearch::find("del_flag = 1");
        if (count($search) == 0) {
            $this->flash->notice("The search did not find any data");
        }

        $paginator = new Paginator(array(
            "data"  => $search,
            "limit" => 10,
            "page"  => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
        $this->view->companies = $search;
    }

    public function userSearchListAction()
    {
        if ($this->request->getQuery("page", "int")){
            $numberPage = $this->request->getQuery("page", "int");
        } else {
            $numberPage = 1;
        }

        $search = MeiuiSearch::find("del_flag = 3");
        if (count($search) == 0) {
            $this->flash->notice("The search did not find any data");
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

    public function deleteAction(){
        $id = $this->request->getQuery("id", "int");
        if($id){
            $user = $this->getSearch($id);
            if($user){
                $user->del_flag = 2;
                if (!$user->save()) {
                    $this->flash->error('删除失败');
                    return $this->forward("search/list");
                }else{
                    $this->flash->success('删除成功');
                    return $this->forward("search/list");
                }
            } else {
                $this->flash->error('删除失败');
                return $this->forward("search/list");
            }
        } else {
            $this->flash->error('删除失败');
            return $this->forward("search/list");
        }

    }

    private  function getSearch($id){
        // 用 phalcon 的方式查找该用户
        $conditions = " id = :id: AND del_flag != :del_flag:";
        $parameters = array(
            "id" => "$id",
            "del_flag" => '2'
        );
        $changeUser = MeiuiSearch::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        return $changeUser;
    }


}
