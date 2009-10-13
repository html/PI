<?php


/**
 * 
 **/

class GalleryModel extends Table
{
    protected $_name = 'files';
    protected $_rowClass = 'GalleryRow';

    public function select()
    {
        $select = parent::select();
        $select->from($this, array('id', 'name'));

        if(!$this->isAdmin()){
            $select->where('public = 1');
        }

        $select->setIntegrityCheck(false)
            ->joinLeft('gallery_info', 'gallery_info.file_id = files.id', array('title', 'description'));

        return $select;
    }

    public function isAdmin()
    {
        return true;
    }

    protected function _getOneQuery($id)
    {
        return ($this->select()->where('files.id = ?', $id));
    }

    protected function _getNextQuery($id)
    {
        return ($this->select()->where('files.id > ?', $id)->order('id ASC'));
    }

    protected function _getPrevQuery($id)
    {
        return ($this->select()->where('files.id < ?', $id)->order('id DESC'));
    }

    protected function _plistAllQuery($page)
    {
        $this->setPage($page);
        return ($this->select());
    }
}
