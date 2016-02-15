<?php

class IndexController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Welcome');
        parent::initialize();
    }

    public function indexAction()
    {
        return $this->forward('session/index');die();
        if (!$this->request->isPost()) {
            $this->flash->notice('好消息！好消息！ 全新的MEIUI 上线了！');
        }
    }
}
