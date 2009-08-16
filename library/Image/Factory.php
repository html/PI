<?php


class Image_Factory
{
    protected static $_defaultAdapterType = 'Gd';

    public function factory($config)
    {
        if($config instanceof Zend_Config){
            $config = $config->toArray();
        }

        $adapterNamespace = 'Image_Adapter_';

        if(is_string($config)){
            $config = array('filename' => $config);
        }

        $className = $adapterNamespace . self::getDefaultAdapterType();

        if(!class_exists($className)){
            require_once 'Zend/Loader.php';
            Zend_Loader::loadClass($adapterName);
        }

        $class = new $className($config);

        if(!($class instanceof Image_Adapter_Abstract)){
            throw new Image_Factory_Exception("$class must be instance of Image_Adapter_Abstract");
        }

        return $class;
    }

    public static function setDefaultAdapterType($type)
    {
        self::$_defaultAdapterType = (string)$type;
    }

    public static function getDefaultAdapterType()
    {
        return self::$_defaultAdapterType;
    }
}
