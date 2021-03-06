<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class TagController extends ControllerBase
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

        $parameters = array('order' => ' create_time desc');

        $classification = MeiuiTag::find($parameters);
        if (count($classification) == 0) {
            $this->flash->notice("The search did not find any classification");
        }

        $paginator = new Paginator(array(
            "data"  => $classification,
            "limit" => 10,
            "page"  => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
        $this->view->companies = $classification;
    }

    /**
     * Creates a new company
     */
    public function createAction()
    {
        if ($this->request->isPost()) {
            $form = new ClassificationForm;
            $company = new MeiuiTag();
            $company->create_time = time();
            $company->create_user = $_SESSION['auth']['id'];
            $data = $this->request->getPost();
            if (!$form->isValid($data, $company)) {
                foreach ($form->getMessages() as $message) {
                    $this->flash->error($message);
                }
                return $this->forward('tag/create');
            }

            if ($company->save() == false) {
                foreach ($company->getMessages() as $message) {
                    $this->flash->error($message);
                }
                return $this->forward('tag/create');
            }

            $form->clear();

            $this->flash->success("tag was created successfully");
            return $this->forward("tag/list");
        } else {
            $this->view->form = new ClassificationForm(null, array('edit' => true));
        }
    }

    public function deleteAction(){
        $id = $this->request->getQuery("id", "int");
        if($id){
            $user = $this->getClassification($id);
            if($user){
                $chang = array('1'=>2,'2'=>1);
                $user->using_flag = $chang[$user->using_flag];
                if (!$user->save()) {
                    $this->flash->error('屏蔽失败');
                    return $this->forward("tag/list");
                }else{
                    $this->flash->success('屏蔽成功');
                    return $this->forward("tag/list");
                }
            } else {
                $this->flash->error('屏蔽失败');
                return $this->forward("tag/list");
            }
        } else {
            $this->flash->error('屏蔽失败');
            return $this->forward("tag/list");
        }

    }

    private  function getClassification($id){
        $conditions = " id = :id: ";
        $parameters = array(
            "id" => "$id"
        );
        $changeClassification = MeiuiTag::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        return $changeClassification;
    }
}
