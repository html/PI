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
                && $this->set('data', $data)->_save();

            if($success){
                $this->_success();
            }

        }

        $this->view->form = $form;
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
}
