<?php


class Image_Adapter_Gd extends Image_Adapter_Abstract
{
    protected $_phpImageSize;
    protected $_jpegQuality = 100;
    
    public function __construct($config = null)
    {
        if(isset($config['filename'])){
            $this->setFilename($config['filename']);

            $mime = $this->getMimeType();
            $type = end(explode('/', $mime));
            $func = 'imagecreatefrom' . $type;

            if(!function_exists($func)){
                throw new Exception("Unknown image mime type $mime for filename {$this->getFilename()}. Cannot create image");
            }

            $resource = $func($this->getFilename());

            if(!is_resource($resource)){
                throw new Exception("Cannot create image from {$this->getFilename()}");
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

        $scaledImage = new self(compact('width', 'height'));

        return $scaledImage
            ->setMimeType($this->getMimeType())
            ->setResource($resource);
    }

    public function getPhpImageSize()
    {
        if(is_null($this->_phpImageSize)){
            $this->_phpImageSize = getimagesize($this->getFilename());
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
            is_null($filename) ? $this->getFilename() : $filename
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
