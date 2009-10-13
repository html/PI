<?php

class IndexController extends ControllerAction
{

    protected $_modelClass = false;

    public function indexAction()
    {
        $this->setTitle("Головна сторінка");
      // $this->_redirect('/forum');
    }


}

