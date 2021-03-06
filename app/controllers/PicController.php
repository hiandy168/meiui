<?php
require APP_PATH .  'api/sdk/aliyun-oss-php-sdk-master/samples/Common.php';
use OSS\OssClient;
use OSS\Core\OssException;
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
        $pic = MeiuiPic::find(array('order' => ' create_time desc'));
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
        $pic = MeiuiPicCache::find(array('order' => ' create_time desc'));
        if (count($pic) == 0) {
            $this->flash->notice("The user data did not find any pic");
        }

        $paginator = new Paginator(array(
            "data"  => $pic,
            "limit" => 10,
            "page"  => $numberPage
        ));
  
        $this->view->page = $paginator->getPaginate();
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

    public function edit_user_picAction(){
        $id = $_GET['id'] ? $_GET['id'] : $_POST['id'];
        $conditions = " id = :id: ";
        $parameters = array(
            "id" => $id
        );
        $pic_cache = MeiuiPicCache::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if(!$pic_cache){
            $this->flash->success("找不到这个用数据ID" . $id);
            return $this->forward("pic/user_list");
        }
        if($_POST){
            $pic_cache->pic_app = $_POST['pic_app'];
            $pic_cache->pic_tag = $_POST['pic_tag'];
            $pic_cache->pic_desc = $_POST['pic_desc'];
            $pic_cache->pic_flag = $_POST['pic_flag'];
            $pic_cache->back_msg = $_POST['back_msg'];
            if ($pic_cache->save()) {
                $this->picCacheToOss($pic_cache);
                $this->picCacheToSys($pic_cache);
                $this->flash->success("修改用户数据成功 图片ID" . $id);
                return $this->forward("pic/user_list");
            } else {
                return $this->forward("pic/user_list");
            }
        } else {
            if(isset($_GET['pic_flag']) and $_GET['pic_flag']){
                $pic_cache->pic_flag = $_GET['pic_flag'];
                if ($pic_cache->save()) {
                    $this->picCacheToOss($pic_cache);
                    $this->picCacheToSys($pic_cache);
                    $this->flash->success("修改用户数据成功 图片ID" . $id);
                    return $this->forward("pic/user_list");
                }
            } else {
                $this->view->pic_cache = $pic_cache;
            }
        }
    }


    public function picCacheToSys($pic_cache){
        // 1审核未通过   2审核通过
        if($pic_cache->pic_flag == 2){
            $content_ctl = new ContentController();
            $content_ctl->add_sys_pic('http://' . Common::bucket .'.'. Common::endpoint . '/' . $pic_cache->pic_sys_url,$pic_cache->user_id);
        }
        if($pic_cache->pic_flag == 1){
            $conditions = " user_id = :user_id: and msg_pic = :msg_pic:";
            $parameters = array(
                "user_id" => $pic_cache->user_id,
                "msg_pic" => $pic_cache->pic_sys_url,
            );
            $user_msg = MeiuiUserMsg::findFirst(array(
                $conditions,
                "bind" => $parameters
            ));
            if($user_msg){

            } else {
                //给用户发消息
                $user_msg = new MeiuiUserMsg();
                $user_msg-> user_id = $pic_cache->user_id;
                $user_msg-> created_at = time();
                $user_msg-> msg_flag = 3;
                $user_msg-> msg = '图片审核拒绝' . $pic_cache->back_msg;
                $user_msg-> msg_pic = $pic_cache->pic_sys_url;
                $user_msg->save();
            }
        }
    }

    /**
     *
     * 通过图片缓存表 存到阿里oss
     *
     * */
    public function picCacheToOss($pic_cache){
        // 1审核未通过   2审核通过
        if($pic_cache->pic_flag == 2 and !$pic_cache->pic_sys_url){
            $bucket = Common::getBucketName();
            $ossClient = Common::getOssClient();
            $uri = explode(Common::endpoint . '/', $pic_cache->pic_url);
            $fromBucket = $bucket;
            $fromObject = $uri[1];
            $ext_array = explode('.', $fromObject);
            $ext_num = count($ext_array) - 1;
            $toBucket = $bucket;
            $toObject = 'app/' . $pic_cache->pic_app . '/' . $pic_cache-> pic_tag . ',' . time() . '.' . $ext_array[$ext_num];
            $options = array();
            $rs = $ossClient->copyObject($fromBucket, $fromObject, $toBucket, $toObject, $options);
            // 保存系统图片URL
            $pic_cache->pic_sys_url = $toObject;
            $pic_cache->save();
        }

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
