<?php

/**
 * SessionController
 *
 * Allows to register new users
 */
class RegisterController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('注册/登陆');
        parent::initialize();
    }

    /**
     * Action to register a new user
     */
    public function indexAction()
    {
        $form = new MeiuiUserForm;

        if ($this->request->isPost()) {

            $username = $this->request->getPost('username');
            $email = $this->request->getPost('email', 'email');
            $password = $this->request->getPost('password');
            $repeatPassword = $this->request->getPost('repeatPassword');

            if ($password != $repeatPassword) {
                $this->flash->error('Passwords are different');
                return false;
            }

            $user = new MeiuiUsers();
            $user->username = $username;
            $user->password = sha1($password);
            $user->email = $email;
            $user->created_at = new Phalcon\Db\RawValue('now()');
            $user->phone = '1';
            $user->active = 'Y';
            $user->group = '1';
            if ($user->save() == false) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $this->tag->setDefault('email', '');
                $this->tag->setDefault('password', '');
                $this->flash->success('Thanks for sign-up, please log-in to start generating invoices');
                return $this->forward('session/index');
            }
        }

        $this->view->form = $form;
    }
}
