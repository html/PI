<?php

// Define path to application directory
defined('APPLICATION_PATH')
    || define('APPLICATION_PATH', (realpath(dirname(__FILE__) . '/../../application')));

// Define application environment
defined('APPLICATION_ENV')
    || define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'development'));

// Ensure library/ is on include_path
set_include_path(implode(PATH_SEPARATOR, array(
    realpath(APPLICATION_PATH . '/../library'),
    realpath(APPLICATION_PATH . '/models'),
    get_include_path(),
)));

/** Zend_Application */
require_once 'Zend/Application.php';  
require_once 'functions.php';
require_once 'phpbbhook.php';

// Create application, bootstrap, and run
require_once 'Zend/Config/Ini.php';
$config = new Zend_Config_Ini(APPLICATION_PATH . '/configs/application.ini');

require_once 'Zend/Registry.php';
Zend_Registry::set('configuration', $config->{APPLICATION_ENV});

$application = new Zend_Application(
    APPLICATION_ENV, 
    $config->{APPLICATION_ENV}
);

$application->bootstrap();
require_once 'Zend/Controller/Front.php';
Zend_Controller_Front::getInstance()->addControllerDirectory(APPLICATION_PATH . '/controllers');
Zend_Session::$_unitTestEnabled = true;
