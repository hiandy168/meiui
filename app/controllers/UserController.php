<?php
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

/**
 * SessionController
 *
 * Allows to register new users
 */
class UserController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('注册/登陆');
        parent::initialize();
    }

    /**
     * Action to register a new user
     */
    public function registerAction()
    {
        if ($this->request->isPost()) {
            $username = $this->request->getPost('username');
            $phone = $this->request->getPost('phone');
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
            $user->phone = $phone;
            $user->email = $email;
            $user->created_at = time();
            if ($user->save() == false) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $user_data = new MeiuiUserData();
                $user_data->user_id = $user->id;
                if ($user_data->save() == false) {
                    foreach ($user_data->getMessages() as $message) {
                        $this->flash->error((string) $message);
                    }
                } else {
                    $this->tag->setDefault('email', '');
                    $this->tag->setDefault('password', '');
                    $this->flash->success('欢迎加入Meiui');
                    return $this->forward('session/index');
                }
            }
        }
        $form = new MeiuiUserForm;
        $this->view->form = $form;
    }

    public function listAction(){
        if ($this->request->getQuery("page", "int")){
            $numberPage = $this->request->getQuery("page", "int");
        } else {
            $numberPage = 1;
        }

        $parameters = array();
        if ($this->persistent->searchParams) {
            $parameters = $this->persistent->searchParams;
        }

        $Users = MeiuiUsers::find($parameters);
        if (count($Users) == 0) {
            $this->flash->notice("The search did not find any user");
            return $this->forward("user/index");
        }

        $paginator = new Paginator(array(
            "data"  => $Users,
            "limit" => 10,
            "page"  => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
    }
}
