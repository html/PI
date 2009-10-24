<?php

class Controller_Plugin_AclIntegration extends Zend_Controller_Plugin_Abstract
{
    protected static $_navigation;
    protected static $_currentRole;
    protected static $_defaultPrivilege;
    protected static $_acl;
    protected static $_role;
    protected static $_isDispatched;

    public function preDispatch(Zend_Controller_Request_Abstract $request)
    {
        if(!self::$_isDispatched && !self::$_acl->isAllowed(self::$_role, $this->getPrivilege())){
            //(Zend_Controller_Front::getInstance()->getResponse()->renderExceptions(true));
            //(Zend_Controller_Front::getInstance()->resetInstance());
            $error            = new ArrayObject(array(), ArrayObject::ARRAY_AS_PROPS);
            $error->exception = new Controller_Plugin_AclIntegration_Exception(
                sprintf('"%s" is not allowed to "%s"', self::$_role, $this->getPrivilege())
            );

            $error->request = $request;
            $request
                ->setActionName('error')
                ->setControllerName('error')
                ->setParam('error_handler', $error)
                ->setDispatched(false);
            self::$_isDispatched = true;
        }
    }

    public static function setNavigation($nav)
    {
        self::$_navigation = $nav;
    }

    public function getPrivilege()
    {

        $neededPage = (self::$_navigation->findOneBy('active', true));

        if(!$neededPage){
            $request = $this->getRequest();
            $pages = self::$_navigation->findAllBy('controller', $request->getControllerName());

            foreach($pages as $page){
                if($page->action == $request->getActionName()){
                    $neededPage = $page;
                    break;
                }

                if($neededPage = $page->findBy('action', $request->getActionName())){
                    break;
                }
            }
        }

        return $neededPage && ($privilege = $neededPage->getPrivilege()) ? $privilege : self::$_defaultPrivilege;
    }

    public static function setDefaultPrivilege($privilege)
    {
        self::$_defaultPrivilege = $privilege;
    }

    public static function setAcl($acl)
    {
        self::$_acl = $acl;
    }

    public static function setRole($role)
    {
        self::$_role = $role;
    }
}
