<?php
/**
 * @author Olexiy Zamkoviy
 */

class MboardController extends ControllerAction
{
    protected $_formClassName = 'Zend_Dojo_Form';

    public function indexAction()
    {
        $this->view->data = $this->getModel()->plistAll();
    }
}
