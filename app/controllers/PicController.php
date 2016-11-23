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

    public function user_listAction()
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
                return $this->forward('pic/create');
            }

            if ($company->save() == false) {
                foreach ($company->getMessages() as $message) {
                    $this->flash->error($message);
                }
                return $this->forward('pic/create');
            }

            $form->clear();

            $this->flash->success("pic was created successfully");
            return $this->forward("pic/list");
        } else {
            $this->view->form = new ClassificationForm(null, array('edit' => true));
        }
    }

    public function deleteAction(){
        $id = $this->request->getQuery("id", "int");
        if($id){
            $user = $this->getPic($id);
            if($user){
                $chang = array('1'=>3,'3'=>2, '2'=>3);
                $user->using_flag = $chang[$user->using_flag];
                if (!$user->save()) {
                    $this->flash->error('保存失败');
                    return $this->forward("pic/list");
                }else{
                    $this->flash->success('保存成功');
                    return $this->forward("pic/list");
                }
            } else {
                $this->flash->error('保存失败');
                return $this->forward("pic/list");
            }
        } else {
            $this->flash->error('保存失败');
            return $this->forward("pic/list");
        }

    }

    private  function getPic($id){
        $conditions = " id = :id: ";
        $parameters = array(
            "id" => "$id"
        );
        $changeClassification = MeiuiPic::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        return $changeClassification;
    }

    public function changeBriefAction(){
        $id = intval($_POST['id']);
        $data['type'] = false;
        if($id){
            $pic = $this->getPic($id);
            if($pic){
                $chang = addslashes($_POST['brief']);
                $pic->brief = $chang;
                if ($pic->save()) {
                    $data['type'] = true;
                }
            }
       }
       die(json_encode($data));
    }
}
