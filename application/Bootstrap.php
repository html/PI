<?php

function __autoload($className)
{
    require $className = str_replace('_', '/', $className) . '.php';
}

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
    public function _initView()
    {
        $view = new Zend_View;

        Zend_Controller_Action_HelperBroker::getStaticHelper('viewRenderer')->setView($view);
    }

    public function _initLayout()
    {
        $this->_initView();
        Zend_Layout::startMvc();
    }

    public function _initDbAdapter()
    {
        $configuration = Zend_Registry::get('configuration');
        $dbAdapter = Zend_Db::factory($configuration->database);

        Zend_Db_Table_Abstract::setDefaultAdapter($dbAdapter);
    }

    public function _initAutoload()
    {
        require_once 'Lsdev/Loader.php';
        Zend_Loader_Autoloader::getInstance()->pushAutoloader(array('Lsdev_Loader', 'autoload'));
    }

    public function _initPaginator()
    {
        Zend_Paginator::setDefaultItemCountPerPage(3);
        Zend_View_Helper_PaginationControl::setDefaultViewPartial('pagination.phtml');
    }
}

