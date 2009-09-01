<?php

class Controller_ExtensibleAction
{
    protected $_controller;
    protected $_params;

    public function setController($controller)
    {
        $this->_controller = $controller;
        return $this;
    }

    public function __construct($controller)
    {
        $this->setController($controller)->dispatch();
    }

    public function dispatch(){
    }

    public function getController()
    {
        return $this->_controller;
    }

    public function __call($func, $args)
    {
        return $this->_controller->exe($func, $args);
    }

    public function __get($key)
    {
        return $this->_controller->get($key);
    }

    public function __set($key, $val)
    {
        return $this->_controller->set($key, $val);
    }

    public function get($param)
    {
        return $this->_params[$param];
    }

    public function set($name, $val)
    {
        $this->_params[$name] = $val;
        return $this;
    }
}
