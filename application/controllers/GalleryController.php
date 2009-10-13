<?php

require_once 'ControllerAction.php';

class GalleryController extends ControllerAction
{
    protected $_formClassName = 'Zend_Dojo_Form';
    protected $_genericActionsEnabled = array('listAction', 'addAction', 'viewAction', 'editAction');

    public function indexAction()
    {
        $this->setTitle("Галерея");
        $this->_forward('list');
    }

    protected function _listAction()
    {
        $this->view->data = $this->getModel()->plistAll($this->_getParam('page', 1));
    }

    public function getForm()
    {
        if(is_null($this->_form)){
            $form = parent::getForm()
                ->setEnctype(Zend_Form::ENCTYPE_MULTIPART)
                ->setMethod(Zend_Form::METHOD_POST);

            $file = $form->getElement('file');

            if($file){
                require_once 'Validate/BasenameNotInDatabase.php';

                $file->addValidator(
                    new Validate_BasenameNotInDatabase('files', 'name', null, $this->getModel()->getAdapter())
                );

                $file->addFilter(
                    new Filter_File_ImageResize(null)
                );
            }
            
            /*
            $form->addDisplayGroup(array(
                'tag'
            ), 'tags2');*/


            //de($form->getDecorators());
            $form->addDecorator(new Zend_Dojo_Form_Decorator_BorderContainer);
        }

        return $this->_form;
    }

    protected function _addSave($data)
    {
        extract($data);

        $item = ($type == 'add' ? $model->createRow() : $this->view->item);
        $item->setReadOnly(false);
        
        return $item->setForm($form)
            ->setFilesDirectory($this->getUploadDir())
            ->save();
    }

    protected function _editSave($scope)
    {
        return $this->_addSave($scope);
    }

    protected function _editBefore($scope)
    {
        $data = $this->getModel()->getOne($this->_getParam('id', 0));

        if(is_null($data)){
            $this->notFoundException();
        }

        $this->getForm()->isValid($data->toArray());
        $this->view->item = $data;


        $tags = array();
        for($i=1;$i<10;$i++){
            $tags[] = array(
                'title' => 'WeightTitle ' . $i,
                'weight' => $i
            );
        }

        $cloud = new Zend_Tag_Cloud;
        $cloud->setTags($tags);

        /*
        ($cloud->getCloudDecorator()->setHtmlTags(array(
            'div' => array('class' => 'Zend_Tag_Cloud')
        )));*/
        $cloud->setTagDecorator(new Tag_Cloud_Decorator_HtmlTagWithoutLinks);
        $cloud->getCloudDecorator()->setHtmlTags(array('ul' => array('id' => 'tagsSource', 'class' => 'tagCloud')));
        $this->view->tags = $cloud;
    }

    protected function _editSuccess($scope)
    {
        $this->userMessage('Успішно відредаговано')->redirect('view', 'gallery', null, array(
            'id' => $this->view->item->id
        ));
    }

    protected function _addSuccess($scope)
    {
        $this->userMessage('Успішно додано');
        parent::_addSuccess($scope);
    }

    public function deleteAction()
    {
        $data = $this->getModel()->getOne($this->_getParam('id', 0));

        if(is_null($data)){
            $this->notFoundException();
        }

        $data->setFilesDirectory($this->getUploadDir())
            ->setReadOnly(false);

        $data->delete();

        $this->userMessage("Успішно видалено")->redirect('list', null, null, array(
            'page' => $this->_getParam('page', null)
        ));
    }

    public function getUploadDir()
    {
        return parent::getUploadDir() . 'images';
    }

    protected function _viewAction()
    {
        parent::_viewAction();
        $this->setTitle($this->view->item->getTitle());
    }
}

