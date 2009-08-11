<?php


class Table extends Zend_Db_Table_Abstract
{
    protected $_queryTypes = array(
        'get' => 'fetchRow',
        'list' => 'fetchAll',
        'plist' => 'fetchPaged',
    );

    protected function _getOneQuery($id)
    {
        return $this->select()
            ->where('id = ?', $id);
    }

    protected function _listAllQuery()
    {
        return $this->select();
    }

    public function __call($function, $args)
    {
        if(preg_match('/(get|list|plist)/',$function, $matches)){
            $queryType = $matches[0];
            $method_name = '_' . $function . 'Query';

            if(isset($this->_queryTypes[$queryType])){
                $queryMethod = $this->_queryTypes[$queryType];

                if(method_exists($this, $method_name)){
                    return $this->$queryMethod(call_user_func_array(array($this, $method_name), $args));
                }
            }
        }

        de('Table.php: ', $function, $args);
        return parent::__call($function, $args);
    }

    protected function _setupTableName()
    {
        if(is_null($this->_name)){
            $this->_name = strtolower(str_replace('Model', '', get_class($this)));
        }

        parent::_setupTableName();
    }

    public function fetchPaged($args)
    {
        list($query, $page) = $args;
        return Zend_Paginator::factory($query)->setCurrentPageNumber($page);
    }
}
