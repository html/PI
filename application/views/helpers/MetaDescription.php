<?php
/**
 * @author Olexiy Zamkoviy
 */

class Zend_View_Helper_MetaDescription extends Zend_View_Helper_Abstract
{
    public function metaDescription()
    {
        $view = ($this->view);

        return $view->escape(
            ($view->data && is_array($view->data) && isset($view->data['description'])) ? $view->data['description']
                : ($view->description ? $view->description : $view->metaKeywords())
        );
    }
}
