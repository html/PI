<?php



class Filter_File_ImageResize implements Zend_Filter_Interface
{
    const RESIZE_BY_WIDTH = 'resizeByWidth';
    const RESIZE_BY_HEIGHT = 'resizeByHeight';
    const RESIZE_BOTH = 'resizeBoth';

    /**
     * Returns the new filename where the content will be stored
     *
     * @return string
     */
    public function getFilename()
    {
        return $this->_filename;
    }

    /**
     * Sets the new filename where the content will be stored
     *
     * @param  string $filename (Optional) New filename to set
     * @return Zend_Filter_File_Encryt
     */
    public function setFilename($filename = null)
    {
        $this->_filename = $filename;
        return $this;
    }

    public function filter($value)
    {
        if (!file_exists($value)) {
            require_once 'Zend/Filter/Exception.php';
            throw new Zend_Filter_Exception("File '$value' not found");
        }

        if (!isset($this->_filename)) {
            $this->_filename = $value;
        }

        if (file_exists($this->_filename) and !is_writable($this->_filename)) {
            require_once 'Zend/Filter/Exception.php';
            throw new Zend_Filter_Exception("File '{$this->_filename}' is not writable");
        }

        $this->resizeBy2(self::RESIZE_BY_WIDTH, 1000);

        return $this->_filename;
    }

    public function resizeBy($type, $value)
    {
        $filename = $this->getFilename();

        list($width, $height) = getimagesize($filename);

        if($type == self::RESIZE_BY_WIDTH){

            if($value > $width){
                return;
            }

            $targetwidth = $value;
            $targetheight = $this->_calculateDimensions($height, $width, $value);
        }else if($type == self::RESIZE_BY_HEIGHT){

            if($value > $height){
                return;
            }

            $targetheight = $value;
            $targetwidth = $this->_calculateDimensions($width, $height, $value);
        }else{
            throw new Exception("Not implemented yet");
        }

        $targetImage = imagecreatetruecolor($targetwidth, $targetheight);
        $image = imagecreatefromjpeg($filename);

        imagecopyresampled(
            $targetImage, $image, 0, 0, 0, 0,
            $targetwidth, $targetheight, $width, $height
        );

        imagejpeg($targetImage, $filename, 100);
    }

    public function resizeBy2($type, $value)
    {
        $image = Image_Factory::factory($this->getFilename());

        $width = $image->getWidth();
        $height = $image->getHeight();

        if($type == self::RESIZE_BY_WIDTH){

            if($value > $width){
                return;
            }

            $targetwidth = $value;
            $targetheight = $this->_calculateDimensions($height, $width, $value);
        }else if($type == self::RESIZE_BY_HEIGHT){

            if($value > $height){
                return;
            }

            $targetheight = $value;
            $targetwidth = $this->_calculateDimensions($width, $height, $value);
        }else{
            throw new Exception("Not implemented yet");
        }


        $result = $image->scaleTo(
            $targetwidth,
            $targetheight
        )->save(
            $this->getFilename()
        );

        if(!$result){
            throw new Exception("Cannot save image");
        }
    }

    protected function _calculateDimensions($dim1, $dim2, $value)
    {
        return (int)@($dim1 / ($dim2 / $value));
    }
}
