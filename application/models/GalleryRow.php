<?php

class GalleryRow extends Zend_Db_Table_Row_Abstract
{
    protected $_filesDirectory;
    protected $_form;
    protected $_defaultValues = array(
        'description' => 'Опис відсутній'
    );

    protected $_galleryInfoTable;

    public function setForm(Zend_Form $form)
    {
        $this->_form = $form;
        return $this;
    }

    public function setFilesDirectory($dir)
    {
        $this->_filesDirectory = $dir;
        return $this;
    }

    public function getFilesDirectory()
    {
        if(is_null($this->_filesDirectory)){
            throw new Exception("Files directory is not set");
        }

        return $this->_filesDirectory;
    }

    protected function _insert()
    {
        if(is_null($this->_form)){
            throw new Exception("Form is not set");
        }

        $file = $this->_form->getElement('file');

        $info = $file->getFileInfo();
        $filebasename = $info['file']['name'];
        $file->setDestination($this->_filesDirectory)->receive();

        #XXX Doesn't work
        #$filename = $file->getFileName();
        #

        $info = $file->getFileInfo();
        $filename = $info['file']['tmp_name'];
        
        $this->__set('scope', 'images');
        $this->__set('name', $filebasename);
        $this->__set('file', file_get_contents($filename));

        $data = $this->_form->getValues();
        unset($data['file']);

        $this->setFromArray($data);
    }

    public function _postInsert()
    {
        $this->_postUpdate();
    }

    protected function _postUpdate()
    {
        if(is_null($this->_form)){
            throw new Exception("Form is not set");
        }

        $data = $this->_form->getValues();
        $data['file_id'] = $this->id;
        ($this->getDependentRow()->setFromArray($data)->save());
    }

    public function getImageUrl()
    {
        return Zend_Layout::getMvcInstance()->getView()->escape('/files/images/' . $this->name);
    }

    public function getImageThumbnailUrl()
    {
        return Zend_Layout::getMvcInstance()->getView()->escape('/files/thumbnails/' . $this->name);
    }

    public function getImagePath()
    {
        return $this->getFilesDirectory() . '/' . $this->name;
    }

    public function getImageThumbnailPath()
    {
        return dirname($this->getFilesDirectory()) . '/thumbnails/' . $this->name;
    }

    public function __call($func, $args)
    {
        if(preg_match("/get(\w+)/", $func, $matches)){
            $key = strtolower($matches[1]);
            $value = $this->{$key};

            if($value){
                return $value;
            }

            if(!array_key_exists($key, $this->_defaultValues)){
                throw new Exception("No default value for $key");
            }

            return $this->_defaultValues[$key];
        }else{
            parent::__call($func, $args);
        }
    }

    public function getDependentRow()
    {
        $table = $this->getGalleryInfoTable();
        $data = $this->findDependentRowset($table, 'info');
        return $data->count() ? $data[0] : $table->createRow();
    }

    public function getGalleryInfoTable()
    {
        if(is_null($this->_galleryInfoTable)){

            $this->_galleryInfoTable = new Table(array(
                'name' => 'gallery_info',
                'referenceMap' => array(
                    'info' => array(
                        'columns' => array('file_id'),
                        'refTableClass' => 'GalleryModel',
                        'refColumns' => array('id')
                    )
                )
            ));

        }

        return $this->_galleryInfoTable;
    }

    public function delete()
    {
        $this->getDependentRow()->delete();
        $this->removeFiles();

        return parent::delete();
    }

    public function removeFiles()
    {
        @unlink($this->getImageThumbnailPath());
        @unlink($this->getImagePath());
    }

    public function prevItem()
    {
        return $this->getTable()->getPrev($this->id);
    }

    public function nextItem()
    {
        return $this->getTable()->getNext($this->id);
    }
}

