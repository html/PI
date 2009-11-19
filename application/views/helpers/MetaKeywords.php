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
            ($view->data && ($view->data instanceof Zend_Db_Table_Row_Abstract) && isset($view->data->keywords)) ? $view->data->keywords
                : ($view->keywords ? $view->keywords : '')
        );
    }
}
