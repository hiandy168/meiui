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
        }

        $paginator = new Paginator(array(
            "data"  => $search,
            "limit" => 10,
            "page"  => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
        $this->view->companies = $search;
    }

    public function indexAction()
    {
        $this->view->form = new MeiuiFeedbackForm;
    }

    /**
     * Saves the contact information in the database
     */
    public function sendAction()
    {
        if ($this->request->isPost() != true) {
            return $this->forward('feedback/index');
        }

        $form = new MeiuiFeedbackForm;
        $feedback = new MeiuiFeedback();
        $auth = $this->session->get('auth');
        if ($auth){
            $feedback-> username = $auth['username'];
        }
        $feedback->created_at = time();
        // Validate the form
        $data = $this->request->getPost();
        if (!$form->isValid($data, $feedback)) {
            foreach ($form->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('feedback/index');
        }

        if ($feedback->save() == false) {
            foreach ($feedback->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('feedback/index');
        }

        $this->flash->success('感谢你的反馈，我们会在一两个工作日内联系你');
        return $this->forward('feedback/index');
    }

    public function viewAction(){
        $id = $this->request->getQuery("id", "int");
        $feedback = $this->getFeedback($id);
        $feedback->pic_arr = explode(',', $feedback->pic_arr);

        $this->view->feedback = $feedback;

    }

    private  function getFeedback($id){
        // 用 phalcon 的方式查找该用户
        $conditions = " id = :id: AND msg_flag != :msg_flag:";
        $parameters = array(
            "id" => "$id",
            "msg_flag" => '2'
        );
        $feedback = MeiuiFeedback::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        return $feedback;
    }
}
