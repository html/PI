<?php

class Zend_View_Helper_LinkTo extends Zend_View_Helper_Abstract 
{
    public function linkTo($id)
    {
        $page = ($this->view->navigation()->getContainer()->findOneBy('id', $id));

        if(is_null($page)){
            throw new Exception("Page with id $id does not exist");
        }

        return ($page->getHref());
    }
}
