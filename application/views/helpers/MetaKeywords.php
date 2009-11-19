<?php
/**
 * @author Olexiy Zamkoviy
 */

class Zend_View_Helper_MetaKeywords extends Zend_View_Helper_Abstract
{
    public function metaKeywords()
    {
        $view = ($this->view);

        return $view->escape(
            ($view->data && is_array($view->data) && isset($view->data['keywords'])) ? $view->data['keywords']
                : ($view->keywords ? $view->keywords : '')
        );
    }
}
