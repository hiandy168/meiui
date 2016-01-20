<?php

/**
 * SessionController
 *
 * Allows to authenticate users
 */
class SessionController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('登陆/注册');
        parent::initialize();
    }

    public function indexAction()
    {
        if (!$this->request->isPost()) {
            $this->tag->setDefault('email', 'meiui@163.com');
            $this->tag->setDefault('password', '1aaaaaaa');
        }
    }

    /**
     * Register an authenticated user into session data
     *
     * @param MeiuiUsers $user
     */
    private function _registerSession(MeiuiUsers $user)
    {
        $this->session->set('auth', array(
            'id' => $user->id,
            'name' => $user->name
        ));
    }

    /**
     * This action authenticate and logs an user into the application
     *
     */
    public function startAction()
    {
        if ($this->request->isPost()) {

            $email = $this->request->getPost('email');
            $password = $this->request->getPost('password');

            $user = MeiuiUsers::findFirst(array(
                "(email = :email: OR username = :email:) AND password = :password: AND del_flag = '1'",
                'bind' => array('email' => $email, 'password' => sha1($password))
            ));
            if ($user != false) {
                $this->_registerSession($user);
                $this->flash->success('Welcome ' . $user->name);
                return $this->forward('invoices/index');
            }

            $this->flash->error('Wrong email/password');
        }

        return $this->forward('user/list');
    }

    /**
     * Finishes the active session redirecting to the index
     *
     * @return unknown
     */
    public function endAction()
    {
        $this->session->remove('auth');
        $this->flash->success('Goodbye!');
        return $this->forward('index/index');
    }
}
