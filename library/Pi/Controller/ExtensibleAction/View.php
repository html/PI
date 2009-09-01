<?php

class Pi_Controller_ExtensibleAction_View extends Controller_ExtensibleAction_View
{

    public function _before()
    {
        $this->notFoundExceptionIfNot($this->get('data'));
    }

    public function getData()
    {
        return $this->getItem();
    }
}
