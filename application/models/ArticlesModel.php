<?php

class ArticlesModel extends Table
{
    protected $_rowClass = 'ArticleRow';

    public function _plistAllQuery($page)
    {
        $this->setPage($page);
        return $this->_listAllQuery();
    }

    public function _listAllQuery()
    {
        return $this->select()->where('public = 1');
    }
}
