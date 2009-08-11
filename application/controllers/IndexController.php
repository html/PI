<?php

class IndexController extends ControllerAction
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $this->setTitle("Головна сторінка");
      // $this->_redirect('/forum');
    }


}

