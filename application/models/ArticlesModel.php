<?php

class ArticlesModel extends Table
{
    protected $_rowClass = 'ArticleRow';

    public function _allQuery($page)
    {
        $this->setPage($page);
        return $this->select()->where('public = 1');
    }
}
