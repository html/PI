<?php

class Pi_Controller_ExtensibleAction_Add extends Controller_ExtensibleAction_Add
{
    protected $_successMessage = 'Успішно додано';

    public function _save()
    {
        $data = $this->get('data');
        $row = $this->getModel()->createRow();

        $id = $row->setFromArray($data)->save();
        $this->set('id', $id);

        return $id;
    }

    public function _success()
    {
        $this->userMessage($this->_successMessage)->redirect(
            'view', null, null, 
            $this->getRedirectUrlParams()
        );
    }

    public function getRedirectUrlParams()
    {
        return array( 
            'id' => $this->get('id')
        );
    }
}
