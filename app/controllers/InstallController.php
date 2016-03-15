<?php
error_reporting(E_ALL || ~E_NOTICE);
class InstallController extends ControllerBase
{
    public function initialize()
    {
        parent::initialize();
    }

    public function indexAction()
    {
        $this-> listDir(APP_PATH . "public/load/init_data/APP");
    }

    public function listDir($dir)
    {
        if(is_dir($dir))
        {
            if ($dh = opendir($dir))
            {
                while (($file = readdir($dh)) !== false)
                {
                    if((is_dir($dir."/".$file)) && $file!="." && $file!="..")
                    {
//                    echo "<b><font color='red'>文件名：</font></b>",$file,"<br><hr>";
                        $this-> listDir($dir."/".$file."/");
                    } else {
                        if($file!="." && $file!="..")
                        {
                            $file_info = getimagesize($dir.$file);
                            $file = iconv ('GBK', 'utf-8', $file);
                            $dir_arr = explode('APP/', $dir);
                            $app = iconv ('GBK', 'utf-8', rtrim($dir_arr[1], '/'));
                            $tags = explode('.', $file);
                            if($tags[1]=='jpg' or $tags[1]=='PNG'){
                                $this-> insert_data($app, $file , $file_info);
                            }
//                        $real_file =  $app_name . ',' .  $file."<br>";
                        }
                    }
                }
            }
        }
    }
    public function insert_data($app, $file, $file_info){
        //先判断APP 是否存在，不存在新建APP
        $conditions = " app_name = :app_name: ";
        $parameters = array(
            "app_name" => $app,
        );
        $db_app = MeiuiAPP::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if(!$db_app){
            $db_app = new MeiuiApp();
            $db_app-> app_name = $app;
            $db_app-> create_user = $_SESSION['auth']['id'];
            $db_app-> create_time = time();
            $db_app->save();
        }
        //再判断PIC 是否存在，不存在新建PIC
        $tags = explode('.', $file);
        $pic_url = 'http://www.meiui.me/load/init_data/APP/'.$app.'/'.$file;

        $conditions = " pic_url = :pic_url: ";
        $parameters = array(
            "pic_url" => $pic_url,
        );
        $db_pic = MeiuiPic::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if(!$db_pic){
            $db_pic = new MeiuiPic();
            $db_pic-> app_id = $db_app->id;
            $db_pic-> app_name = $db_app->app_name;
            $db_pic-> pic_url = $pic_url;
            $db_pic-> pic_w = $file_info[0];
            $db_pic-> pic_h = $file_info[1];
            $db_pic-> brief = 'brief default tag  ' . $app . ',' . $tags[0] ;
            $db_pic-> create_user = $_SESSION['auth']['id'];
            $db_pic-> create_time = time();
            $db_pic->save();
        }
        // 判断标签 不存在则插入
        $all_tag = explode('，',$tags[0]);
        $all_tag[] = $app;
        foreach($all_tag as $one_tag){
            $this-> insert_tag_link_pic($one_tag, $db_pic->id);
        }
    }

    public function insert_tag($tag){
        $conditions = " tag_name = :tag_name:";
        $parameters = array(
            "tag_name" => $tag,
        );
        $db_tag = MeiuiTag::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if(!$db_tag){
            $db_tag = new MeiuiTag();
            $db_tag-> tag_name = $tag;
            $db_tag-> tag_type = 2;
            $db_tag-> create_user = $_SESSION['auth']['id'];
            $db_tag-> create_time = time();
            $db_tag->save();
        }
        return $db_tag;
    }

    public function insert_tag_link_pic($tag_name, $pic_id){
        $tag = $this->insert_tag($tag_name);
        $conditions = " tag_name = :tag_name: and pic_id =:pic_id:";
        $parameters = array(
            "tag_name" => $tag->tag_name,
            "pic_id" => $pic_id,
        );
        $db_tag_link_pic = MeiuiPicLinkTag::findFirst(array(
            $conditions,
            "bind" => $parameters
        ));
        if(!$db_tag_link_pic){
            $db_tag_link_pic = new MeiuiPicLinkTag();
            $db_tag_link_pic-> pic_id = $pic_id;
            $db_tag_link_pic-> user_id = $_SESSION['auth']['id'];
            $db_tag_link_pic-> tag_id = $tag->id;
            $db_tag_link_pic-> tag_name = $tag->tag_name;
            $db_tag_link_pic->save();
        }
        return $db_tag_link_pic;
    }
}
