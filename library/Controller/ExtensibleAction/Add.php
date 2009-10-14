<?php


class Controller_ExtensibleAction_Add extends Controller_ExtensibleAction
{
    public function dispatch()
    {
        $form = $this->getForm();
        $request = $this->getRequest();
        $data = $request->getPost();

        $this->_before();

        if($request->isPost()){

            $success = 
                $form->isValid($data)
                && $this->set('data', $form->getValues())->_save();

            if($success){
                $this->_success();
            }else{
                $this->_failure();
            }

        }

        $this->_after();
    }

    public function _before()
    {
    }

    public function _success()
    {
    }

    public function _save()
    {
    }

    public function _after()
    {
        $this->view->form = $this->getForm();
    }

    public function _failure()
    {
    }
}
