<?php

class Lsdev_Loader extends Zend_Loader {

    public static function loadClass($class, $dirs = null)
    {
        if (substr($class, -5) == 'Model') {
            self::loadModel($class);
        }
        elseif (substr($class, -4) == 'Form') {
            self::loadForm($class);
        }
        else {
            parent::loadClass($class, $dirs);
        }
    }
    
    
    public static function loadModel($class)
    {
        self::loadCustom($class, 'models');
    }
    
    public static function loadForm($class)
    {
        self::loadCustom($class, 'forms');
    }
    
    public static function loadCustom($class, $type)
    {
        $basePath = APPLICATION_PATH;
        
        $parts = self::__explodeCase($class);

        switch (count($parts)) {
            case 2 :
                parent::loadClass($class, "$basePath/$type/");
                break;

            case 3 :
                parent::loadClass($class, "$basePath/modules/{$parts[0]}/$type/");
                break;

            default :
                throw new Zend_Exception("Lsdev_Loader::loadCustom() Invalid class "
                                       . "name specified: <b>$class</b>");
                break;
        }
    }

    private static function __explodeCase($string, $lower = true)
    {
        $array = preg_split('/([A-Z][^A-Z]*)/', $string, -1, PREG_SPLIT_NO_EMPTY | PREG_SPLIT_DELIM_CAPTURE);
        if ($lower) {
            $array = array_map('strtolower', $array);
        }
        return $array;
    }

    public static function autoload($class)
    {
        try {
            self::loadClass($class);
            return $class;
        } catch (Exception $e) {
            return false;
        }
    }
} 
