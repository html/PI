<?php

class Controller_Plugin_AclIntegration extends Zend_Controller_Plugin_Abstract
{
    protected static $_navigation;
    protected static $_currentRole;
    protected static $_defaultPrivilege;
    protected static $_acl;
    protected static $_role;

    public function preDispatch()
    {
        if(!self::$_acl->isAllowed(self::$_role, $this->getPrivilege())){
            throw new Controller_Plugin_AclIntegration_Exception;
        }
    }

    public static function setNavigation($nav)
    {
        self::$_navigation = $nav;
    }

    public function getPrivilege()
    {
        $request = $this->getRequest();
        $pages = self::$_navigation->findAllBy('controller', $request->getControllerName());

        foreach($pages as $page){
            if($neededPage = $page->findBy('action', $request->getActionName())){
                break;
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

    public function setRole($role)
    {
        self::$_role = $role;
    }
}
