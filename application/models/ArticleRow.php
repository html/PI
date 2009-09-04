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

    public function __call($func, $args)
    {
        if(preg_match("/get(\w+)/", $func, $matches)){
            $key = strtolower($matches[1]);
            $value = $this->{$key};

            if($value){
                return htmlspecialchars($value);
            }

            if(!array_key_exists($key, $this->_defaultValues)){
                throw new Exception("No default value for $key");
            }

            return $this->_defaultValues[$key];
        }else{
            parent::__call($func, $args);
        }
    }
}
