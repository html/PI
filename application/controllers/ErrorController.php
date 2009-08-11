<?php

class ErrorController extends ControllerAction
{
    protected $_modelClass = false;

    public function errorAction()
    {
        $errors = $this->_getParam('error_handler');
        $this->setTitle("Помилка");
        
        switch ($errors->type) {
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_CONTROLLER:
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ACTION:
        
                // 404 error -- controller or action not found
                $this->getResponse()->setHttpResponseCode(404);
                $this->view->assign('code', 404);
                $this->setTitle('Сторінку не знайдено');
                break;
            default:
                // application error 
                $this->getResponse()->setHttpResponseCode(500);
                $this->setTitle('Сталася помилка');
                break;
        }
        
        $this->view->exception = $errors->exception;
        $this->view->request   = $errors->request;

        $this->view->cDebugAreaVisible = !!$this->getRequest()->getCookie('DebugAreaVisible', true);
        __exit();
    }


}

