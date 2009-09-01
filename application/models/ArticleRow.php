<?php

class ArticleRow extends Zend_Db_Table_Row
{
    public function _insert()
    {
        $this->created = new Zend_Db_Expr('NOW()');
    }

    public function _update()
    {
        $this->updated = new Zend_Db_Expr('NOW()');
    }

    public function getDescription()
    {
        return Zend_Filter::filterStatic($this->content, 'Truncate', array(), array(
            'Filter' => 'Filter'
        ));
    }

    public function markDeleted()
    {
        $this->public = false;
        $this->save();
    }
}
