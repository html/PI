<?php
/**
 * @author Olexiy Zamkoviy
 */

class MboardRow extends Zend_Db_Table_Row
{
    public function getTitle()
    {
        return htmlspecialchars($this->title);
    }
}
