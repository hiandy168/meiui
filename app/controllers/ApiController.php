<?php

class ApiController extends ControllerBase
{
    public function initialize()
    {
        parent::initialize();
    }

    public function indexAction()
    {
        if (!$this->request->isPost()) {
            $function = $_GET['function'];
            $function_mean = explode('/', $function);
            $reflectionMethod = new ReflectionMethod($function_mean[0], $function_mean[1]);
            $reflectionMethod->invoke(new $function_mean[0]);
            die();
        } else {
            echo 'no post';
            die();
        }
    }
}
