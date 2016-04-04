<?php

use Phalcon\Mvc\User\Component;

/**
 * Elements
 *
 * Helps to build UI elements for the application
 */
class Elements extends Component
{

    private $_headerMenu = array(
        'navbar-left' => array(
//            'index' => array(
//                'caption' => '首页',
//                'action' => 'index'
//            ),
//            'about' => array(
//                'caption' => '关于MEIUI',
//                'action' => 'index'
//            ),
//            'feedback' => array(
//                'caption' => '意见反馈',
//                'action' => 'index'
//            ),
        ),
        'navbar-right' => array(
            'session' => array(
                'caption' => '登陆/注册',
                'action' => 'index'
            ),
        )
    );

    private $_tabs = array(
        '用户管理' => array(
            'controller' => 'user',
            'action' => 'list',
            'any' => false
        ),
        '标签管理' => array(
            'controller' => 'tag',
            'action' => 'list',
            'any' => true
        ),
        'APP管理' => array(
            'controller' => 'app',
            'action' => 'list',
            'any' => true
        ),
        '图片管理' => array(
            'controller' => 'pic',
            'action' => 'list',
            'any' => true
        ),
        '搜索管理' => array(
            'controller' => 'search',
            'action' => 'list',
            'any' => false
        ),
        '意见反馈' => array(
            'controller' => 'feedback',
            'action' => 'list',
            'any' => true
        ),
        '内容管理' => array(
            'controller' => 'content',
            'action' => 'view',
            'any' => true
        ),

    );

    /**
     * Builds header menu with left and right items
     *
     * @return string
     */
    public function getMenu()
    {

        $auth = $this->session->get('auth');
        if ($auth) {
            $this->_headerMenu['navbar-right']['session'] = array(
                'caption' => '注销',
                'action' => 'end'
            );
            $this->_headerMenu['navbar-left']['user'] = array(
                'caption' => '后台管理',
                'action' => 'list'
            );
        } else {
            unset($this->_headerMenu['navbar-left']['invoices']);
        }

        $controllerName = $this->view->getControllerName();
        foreach ($this->_headerMenu as $position => $menu) {
            echo '<div class="nav-collapse">';
            echo '<ul class="nav navbar-nav ', $position, '">';
            foreach ($menu as $controller => $option) {
                if ($controllerName == $controller) {
                    echo '<li class="active">';
                } else {
                    echo '<li>';
                }
                echo $this->tag->linkTo($controller . '/' . $option['action'], $option['caption']);
                echo '</li>';
            }
            echo '</ul>';
            echo '</div>';
        }

    }

    /**
     * Returns menu tabs
     */
    public function getTabs()
    {
        $controllerName = $this->view->getControllerName();
        $actionName = $this->view->getActionName();
        echo '<ul class="nav nav-tabs">';
        foreach ($this->_tabs as $caption => $option) {
            if ($option['controller'] == $controllerName && ($option['action'] == $actionName || $option['any'])) {
                echo '<li class="active">';
            } else {
                echo '<li>';
            }
            echo $this->tag->linkTo($option['controller'] . '/' . $option['action'], $caption), '</li>';
        }
        echo '</ul>';
    }
}
