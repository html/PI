<?php

class ArticlesModel extends Table
{
    protected $_rowClass = 'ArticleRow';

    public function _allQuery()
    {
        return $this->select()->where('public = 1');
    }
}
