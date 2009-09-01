<?php

class Articles_View extends Pi_Controller_ExtensibleAction_View
{
    public function _before()
    {
        parent::_before();
        $this->setTitle(($this->get('data')->title));
    }
}
