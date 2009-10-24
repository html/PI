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
                
                if($errors->exception instanceof Controller_Plugin_AclIntegration_Exception){
                    $this->getResponse()->setHttpResponseCode(403);
                    $this->view->assign('code', 403);
                    $this->setTitle('Доступ заборонено');
                    $this->view->message = "У Вас немає доступу до цієї сторінки";

                    $action = $this->_getParam('action');
                    $controller = $this->_getParam('controller');

                    if($controller == 'mboard' && $action == 'add'){
                        $this->_helper->viewRenderer->setScriptAction('register');
                    }

                    break;
                }
                // application error 
                $this->getResponse()->setHttpResponseCode(500);
                $this->setTitle('Сталася помилка');
                $this->view->message = "Сталась помилка будь ласка повідомте адміністратора сайту про неї. <br><br>Так, всі помиляються але для програмістів помилка - професійне право :)";
                break;
        }
        
        $this->view->exception = $errors->exception;
        $this->view->request   = $errors->request;

        $this->view->cDebugAreaVisible = !!$this->getRequest()->getCookie('DebugAreaVisible', true);
        __exit();
    }


}

