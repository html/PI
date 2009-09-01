<?php

class Filter_Truncate implements Zend_Filter_Interface
{
    protected $_length = 80;
    protected $_etc = '...';

    function filter($string,  $etc = '...',
                                      $break_words = false, $middle = false)
    {
        if ($this->_length == 0)
            return '';

        if (strlen($string) > $this->_length) {
            $this->_length -= strlen($this->_etc);
            if (!$break_words && !$middle) {
                $string = preg_replace('/\s+?(\S+)?$/', '', substr($string, 0, $this->_length+1));
            }
            if(!$middle) {
                return substr($string, 0, $this->_length).$this->_etc;
            } else {
                return substr($string, 0, $this->_length/2) . $this->_etc . substr($string, -$this->_length/2);
            }
        } else {
            return $string;
        }
    }

}
