<?php

class Validate_BasenameNotInDatabase extends Zend_Validate_Db_Abstract
{
    public function isValid($value, $file = null)
    {
        if(is_null($file)){
            throw new Exception("No file given");
        }

        $valid = true;
        $this->_setValue($file['name']);

        $result = $this->_query($file['name']);
        if ($result) {
            $valid = false;
            $this->_error(self::ERROR_RECORD_FOUND);
        }

        return $valid;
    }
}

