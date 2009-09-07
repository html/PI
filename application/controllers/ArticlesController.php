<?php


class ArticlesController extends ControllerAction 
{
    protected $_genericActionsEnabled = array('listAction');
    protected $_formClassName = 'Zend_Dojo_Form';

    public function indexAction()
    {
        $this->_forward('list');
    }

    public function listAction()
    {
        $this->setTitle('Статті');
        $this->view->data = $this->getModel()->plistAll($this->_getParam('page', 1));
    }

    public function deleteAction()
    {
        $item = $this->getItem();
        $this->notFoundExceptionIfNot($item);
        $item->markDeleted();
        $this->redirect('list');
    }
}
