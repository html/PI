<?php
/**
 * @author Olexiy Zamkoviy
 * @version  0.1
 */


class Table extends Zend_Db_Table_Abstract
{
    protected $_page;
    protected $_queryTypes = array(
        'get' => 'fetchRow',
        'list' => 'fetchAll',
        'plist' => 'fetchPaged',
        'clist' => 'fetchCloud',
        'tlist' => 'fetchTransformed'
    );
    protected $_transformCallback = '_transform';

    protected function _oneQuery($id)
    {
        $primary = $this->info(self::PRIMARY);
        $select = $this->select();

        if(is_scalar($id)){
            $id = array(pos($primary) => $id);
        }

        foreach ($primary as $p) {
            $select->where("`{$this->_name}`.`$p` = ?", $id);
        }

        return $select;
    }

    protected function _allQuery()
    {
        return $this->select();
    }

    public function __call($function, $args)
    {
        $re = '/(' . join('|', array_keys(array_map('preg_quote', $this->_queryTypes))) . ')(.+?)(?:By(.+))*$/';

        if(preg_match($re, $function, $matches)){
            $queryType = $matches[1];

            if(isset($this->_queryTypes[$queryType])){
                $temp = (str_split($matches[2]));
                $temp[0] = strtolower($temp[0]);

                $method_names = array('_' . $queryType . $matches[2] . 'Query', '_' . join($temp) . 'Query');
                $queryMethod = $this->_queryTypes[$queryType];

                if(isset($matches[3])){
                    array_unshift($method_names, '_' . $queryType . $matches[2] . 'ByQuery');

                    if(Zend_Version::compareVersion('1.7.9') < 0){
                        $filter = new Zend_Filter_Word_CamelCaseToUnderscore;
                        $field = strtolower($filter->filter($matches[3]));

                    }else{
                        $field  = (strtolower(
                            Zend_Filter::filterStatic(
                                $matches[3], 
                                'Word_CamelCaseToUnderscore'
                            )
                        ));
                    }

                    array_unshift($args, $field);
                }

                foreach($method_names as $method){
                    if(method_exists($this, ($method))){
                        $sql = call_user_func_array(array($this, $method), $args);
                        return $this->$queryMethod($sql);
                        break;
                    }
                }
                die("Cannot find proper query method for function <b>" . $function . "</b> of class " . get_class($this));
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

    public function fetchPaged($query)
    {
        return Zend_Paginator::factory($query)->setItemCountPerPage(20)->setCurrentPageNumber(
            $this->getPage()
        );
    }

    public function fetchCloud($sql)
    {
        $cloud = new Zend_Tag_Cloud;

        if($sql instanceof Zend_Db_Select){
            $sql->order(new Zend_Db_Expr('RAND()'));
        }

        foreach($this->fetchAll($sql) as $tag){
            $cloud->appendTag($tag);
        }

        return $cloud;
    }

    public function setPage($page)
    {
        $this->_page = max((int)$page, 1);
        return $this;
    }

    public function getPage()
    {
        return $this->_page;
    }

    public function fetchTransformed($sql)
    {
        $data = array();

        $callback = is_string($this->_transformCallback) && method_exists($this, $this->_transformCallback)
            ? array($this, $this->_transformCallback) 
            : $this->_transformCallback;

        foreach($this->_fetch($sql) as $row){
            $data[] = call_user_func($callback, $row);
        }

        return $data;
    }

    protected function _transform($data)
    {
        return $data;
    }

    public function _getOneByQuery($field, $value)
    {
        return $this->select()
            ->where("$field = ?", $value);
    }
}
