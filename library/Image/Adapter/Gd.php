<?php


class Image_Adapter_Gd extends Image_Adapter_Abstract
{
    protected $_phpImageSize;
    protected $_jpegQuality = 100;
    
    public function __construct($config = null)
    {
        if(isset($config['filename'])){
            $this->setFileName($config['filename']);

            $mime = $this->getMimeType();
            $type = end(explode('/', $mime));
            $func = 'imagecreatefrom' . $type;

            if(!function_exists($func)){
                throw new Exception("Unknown image mime type $mime for filename {$this->getFileName()}. Cannot create image");
            }

            $resource = $func($this->getFileName());

            if(!is_resource($resource)){
                throw new Exception("Cannot create image from {$this->getFileName()}");
            }

            $this->setResource($resource);
        }
    }

    public function scaleTo($width, $height)
    {
        $oldWidth = $this->getWidth();
        $oldHeight = $this->getHeight();

        $resource = $this->createResource($width, $height);

        $result = imagecopyresampled(
            $resource, $this->getResource(), 0, 0, 0, 0,
            $width, $height, $oldWidth, $oldHeight
        );

        if(!$result){
            throw new Exception("Filed to scale image");
        }

        $this->_phpImageSize = null;
        $this->setResource($resource);

        return $this;
    }

    public function getPhpImageSize()
    {
        if(is_null($this->_phpImageSize)){
            if(!Zend_Loader::isReadable($this->getFileName())){
                throw new Exception("Cannot read image information from {$this->getFileName()}");
            }
            $this->_phpImageSize = getimagesize($this->getFileName());
        }

        return $this->_phpImageSize;
    }

    public function getWidth()
    {
        $size = ($this->getPhpImageSize());
        return $size[0];
    }

    public function getHeight()
    {
        $size = ($this->getPhpImageSize());
        return $size[1];
    }

    public function __toString()
    {
        ob_start();
        call_user_func($this->getOutputFunc(), $this->getResource(), null);
        return ob_get_clean();
    }

    public function getMimeType()
    {
        if(!$this->_mimeType){

            $size = $this->getPhpImageSize();
            $this->_mimeType = $size['mime'];

        }

        return $this->_mimeType;
    }

    public function setMimeType($mime)
    {
        $this->_mimeType = $mime;
        return $this;
    }

    public function createResource($width, $height)
    {
        return call_user_func(
            function_exists("imagecreatetruecolor")
                ? "imagecreatetruecolor" 
                : "imagecreate",
            $width,
            $height
        );
    }

    public function output()
    {
        $func = $this->getOutputFunc();
        header("Content-type: " . $this->getMimeType());
        $func($this->getResource(), null);
        exit;
    }

    public function getOutputFunc()
    {
        $mime = $this->getMimeType();
        $type = end(explode('/', $mime));

        $func = 'image' . $type;

        if(!function_exists($func)){
            throw new Exception("Unknown type of image for mime $mime");
        }

        return $func;
    }

    public function save($filename = null)
    {
        $func = array(
            $this->getResource(),
            is_null($filename) ? $this->getFileName() : $filename
        );

        if ('jpeg' == end(explode('/', $mime))) {
            $func[]= $this->_jpegQuality;
        }

        return call_user_func_array($this->getOutputFunc(), $func);
    }

    public function setJpegQuality($q)
    {
        $this->_jpegQuality = $q;
        return $this;
    }
}
