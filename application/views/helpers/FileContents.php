<?php
/**
 * @author Olexiy Zamkoviy
 */

class Zend_View_Helper_FileContents extends Zend_View_Helper_Abstract
{
    public function fileContents($file)
    {
        $file = APPLICATION_PATH . '/files/' . $file;
        if (file_exists($file) && is_readable($file)) {
            return file_get_contents($file);
        }

        return '';
    }
}
