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
            $user->created_at = time();
            $user->phone = '1';
            $user->del_flag = '1';
            $user->group = '1';
            $user->source = '2';
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
        } else {
            $form = new MeiuiUserForm;
            $this->view->form = $form;
        }
    }

    public function listAction(){
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "MeiuiUsers", $this->request->getPost());
            $this->persistent->searchParams = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
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
