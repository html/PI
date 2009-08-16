<?php


abstract class Image_Adapter_Abstract
{
    protected $_filename;
    protected $_resource;

    public function getFilename()
    {
        return $this->_filename;
    }

    public function setFilename($file)
    {
        $this->_filename = $file;
        return $this;
    }

    public function output()
    {
        header("Content-type: " . $this->getMimeType());
        echo $this;
    }

    public function getResource()
    {
        return $this->_resource;
    }

    public function setResource($resource)
    {
        $this->_resource = $resource;
        return $this;
    }

    public function getFileExtension()
    {
        return pathinfo($this->getFilename(), PATHINFO_EXTENSION);
    }

    abstract public function __toString();
    abstract public function getMimeType();
    abstract public function setMimeType($mime);
    abstract function getWidth();
    abstract function getHeight();
    abstract function save($filename = null);
}
