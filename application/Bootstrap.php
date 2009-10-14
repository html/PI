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

        Zend_Dojo::enableView($view);
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

    public function _initNavigation()
    {
        $this->_initCache();
        $config = APPLICATION_PATH . '/configs/navigation.php';
        $cache = Zend_Cache::factory('File', 'File', array('automatic_serialization' => true, 'master_file' => $config), array());

        if(!($navigation = $cache->load('navigation'))){
            $navigation = new Zend_Navigation(require $config);
            $cache->save($navigation, 'navigation');
        }

        Zend_Registry::set('nav', $navigation);
    }

    public function _initCache()
    {
        Zend_Registry::set('cache', Zend_Cache::factory('Core', 'File', array('automatic_serialization' => true), array()));
    }

    public function _initAcl()
    {
        $this->_initNavigation();
        $acl = new Zend_Acl;
        $acl->addRole(new Zend_Acl_Role('guest'))
            ->addRole(new Zend_Acl_Role('user'))
            ->addRole(new Zend_Acl_Role('admin'))
            ->add(new Zend_Acl_Resource('add'))
            ->add(new Zend_Acl_Resource('edit'))
            ->add(new Zend_Acl_Resource('delete'))
            ->add(new Zend_Acl_Resource('view'))
            ->allow('admin', array('view', 'add', 'edit', 'delete'))
            ->allow('guest', 'view')
            ->allow('user', 'view');

        Controller_Plugin_AclIntegration::setNavigation(Zend_Registry::get('nav'));
        Controller_Plugin_AclIntegration::setDefaultPrivilege('view');
        Controller_Plugin_AclIntegration::setAcl($acl);

        if (Zend_Auth::getInstance()->hasIdentity()) {
            $data = (Zend_Auth::getInstance()->getStorage()->read());
            Controller_Plugin_AclIntegration::setRole($data['group_id'] == 5 ? 'admin' : 'user');
        }else{
            Controller_Plugin_AclIntegration::setRole('guest');
        }

        (Zend_Controller_Front::getInstance()->registerPlugin(new Controller_Plugin_AclIntegration));
    }

}

