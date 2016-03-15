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
            $user = new MeiuiUser();
            $user->username = $username;
            $user->user_pic = 'http://www.meiui.me/img/head.jpg';
            $user->source = 2;
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
        $Users = MeiuiUser::find("del_flag = 1");
        if (count($Users) == 0) {
            $this->flash->notice("The search did not find any user");
            return $this->forward("user/index");
        }
        $paginator = new Paginator(array(
            "data"  => $Users,
            "limit" => 8,
            "page"  => $numberPage
        ));
        $this->view->page = $paginator->getPaginate();
    }


    public function deleteAction(){
        $id = $this->request->getQuery("id", "int");
        if($id){
            $user = $this->getUser($id);
            if($user){
                $user->del_flag = 2;
                if (!$user->save()) {
                    foreach ($user->getMessages() as $message) {
                        $this->flash->error($message);
                    }
                    $this->flash->error('删除失败');
                    return $this->forward("user/list");
                }else{
                    $this->flash->success('删除成功');
                    return $this->forward("user/list");
                }
            } else {
                $this->flash->error('删除失败');
                return $this->forward("user/list");
            }
        } else {
            $this->flash->error('删除失败');
            return $this->forward("user/list");
        }

    }

    private  function getUser($id){
        // 用 phalcon 的方式查找该用户
        $conditions = " id = :id: AND del_flag != :del_flag:";
        $parameters = array(
            "id" => "$id",
            "del_flag" => '2'
        );
        $changeUser = MeiuiUser::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        return $changeUser;
    }
}
