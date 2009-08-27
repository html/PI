<?php


class Form_Element_ViewScript extends Zend_Form_Element_Xhtml
{
    protected $_viewScript;

    public function render(Zend_View_Interface $view = null)
    {
        $viewScript = $this->getViewScript();

        if(is_null($viewScript)){
            throw new Exception('Please set viewScript attribute for element');
        }

        return $this->getView()->render($this->getViewScript());
    }

    public function setViewScript($script)
    {
        $this->_viewScript = $script;
        return $this;
    }

    public function getViewScript()
    {
        return $this->_viewScript;
    }
}


