<?php

class Pi_Controller_ExtensibleAction_Edit extends Pi_Controller_ExtensibleAction_Add
{
    protected $_successMessage = 'Успішно відредаговано';

    public function _before()
    {
        $item = $this->getItem();
        $this->notFoundExceptionIfNot($item);
        $this->set('item', $item);
        $this->getForm()->isValid($item->toArray());
    }

    public function _save()
    {
        $data = $this->get('data');
        $row = $this->get('item');

        $id = $row->setFromArray($data)->save();
        $this->set('id', $id);

        return $id;
    }

}
