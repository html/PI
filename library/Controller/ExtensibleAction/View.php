<?php

class Controller_ExtensibleAction_View extends Controller_ExtensibleAction
{
    protected $_dataKey = 'item';
    public function dispatch()
    {
        $data = $this->getData();
        $this->set('data', $data);
        $this->_before();
        $this->view->assign($this->_dataKey, $data);
    }

    public function getData(){
        throw new Exception('Not implemented');
    }

    public function _before()
    {
    }
}
