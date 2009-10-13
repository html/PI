<?php


class ControllerAction extends Zend_Controller_Action 
{
    /**
     * Zend_Acl instance
     */
    protected $acl;
    /**
     * Model className
     */
    protected $_modelClass;

    /**
     * Model instance
     */
    protected $_model;

    /**
     * 
     */
    protected $_genericActionsEnabled = array();

	protected $_formConfigFilename;
	protected $_form;
    protected $_formClassName = 'Zend_Form';
    protected $_resourceTypes;
    protected $_resourceTypesByAction;

    public function init()
    {

        $this->view->assign('userData', (object)Zend_Auth::getInstance()->getStorage()->read());
        $this->_initModel();
        $this->_initMenu();
        $this->initAcl();
        $this->_initAuthorization();
        $this->initLanguage();
    }

    protected function _initModel()
    {
        /**
         * Setting model if it has been overwriten in extended classes
         */
        $modelClass = $this->getModelClassName();

        if($modelClass){
            $this->setModel(new $modelClass);
        }
    }

    protected function _initMenu()
    {
        $nav = Zend_Registry::get('nav');
        $this->view->navigation()->setContainer($nav);
        $this->view->currentMenu = ($nav->findOneBy('active', true));
    }

    /*
     *
     * @return string name of current controller action's model class
     */
    public function getModelClassName()
    {
        if(null !== $this->_modelClass){
            return $this->_modelClass;
        }

        return $this->_getModelClassName();
    }

    protected function _getModelClassName()
    {
        return ucfirst($this->getRequest()->getControllerName()) . 'Model';
    }

    public function setModelClassName(string $classname)
    {
        $this->_modelClass = $classname;
        return $this;
    }

    /**
     * @return Zend_Db_Table_Abstract
     */
    function getModel()
    {
        if(!$this->_model instanceof Zend_Db_Table_Abstract)
            throw new Zend_Exception("There is no model assigned yet, use setModel() (for example in init method) to assign one");
        return $this->_model;
    }

    /**
     * Set Controller's model
     *
     * @param Zend_Db_Table_Abstract
     * @return AdminControllerAction Provides a fluent interface
     */
    function setModel(Zend_Db_Table_Abstract $model)
    {
        $this->_model = $model;
        return $this;
    }


    /**
     *  see Zend_Controller_Action_Helper_Redirector
     */
    function redirect()
    {
        $args = func_get_args();

        /**
         *  see Zend_Controller_Action_Helper_Redirector
         */

        return call_user_func_array(
            array($this->getHelper('redirector'),'gotoSimple'),
            $args
        );
    }

    function initAcl()
    {

        if(!$this->acl && Zend_Registry::isRegistered('acl')){
            $this->initView();
            $this->acl = Zend_Registry::get('acl');
            $this->view->assign('acl', $this->acl);
        }

        return $this;
    }

    public function _initAuthorization()
    {
        if(class_exists('UserModel', false) && !$this->isAllowed(UserModel::getCurrentUserInfo()->role)){
            $this->userMessage('У Вас немає доступу до цієї сторінки')->redirect('index', 'index');
        }
    }

    public function isAllowed($role)
    {
        return $this->_isAllowed($role, $this->getControllerResources()) 
            || $this->_isAllowed($role, $this->getActionResources());
    }

    protected function _isAllowed($role, array $resources)
    {
        return true; #XXX

        foreach ($resources as $resource) {
            if(!$this->acl->isAllowed($role, $resource)){
                return false;
            }
        }

        return true;
    }

    public function getControllerResources()
    {
        return $this->_resourceTypes ? $this->_resourceTypes : array();
    }

    public function getActionResources()
    {
        $action = $this->getRequest()->getActionName();
        return isset($this->_resourceTypesByAction[$action]) 
            ?  (is_array($this->_resourceTypesByAction[$action])
                ? $this->_resourceTypesByAction[$action] 
                : array($this->_resourceTypesByAction[$action]))
            : array();
    }

    function postDispatch()
    {
        $this->view->assign(
            'messages',
            $this->getHelper('flashMessenger')->getMessages()
        );

		if(!$this->view->title){
			$this->setTitle();
		}

    }

    public function userMessage($message)
    {
        $this->getHelper('flashMessenger')->addMessage($message);
        return $this;
    }

    public function setTitle($title = null)
    {
        if(is_null($title)){

            $request = $this->getRequest();
            $title = $request->getModuleName()
                   . '_' . $request->getControllerName() 
                   . '_' . $request->getActionName();

			$data = $this->view->item;

			if(is_object($data)){
			    if(method_exists($data, 'toArray')){
					$data = $data->toArray();
				}else{
					$data = (array)$data;
				}
			}

			if(is_array($data) && is_array(pos($data))){
				$data = null;
			}

			if(is_array($data)){
				foreach($data as $k=>$val){
					if(!$data[$k]){
						$data[$k] = '<дані відсутні>';
					}elseif(is_string($data[$k])){
						$data[$k] = $this->view->escape($val);
					}else{
						unset($data[$k]);
					}
				}
			}

            $title = lang($title, $data, array('usenativelocale'=>false));
        }

        $this->view->assign('title', $title);
    }

    public function initLanguage()
    {
        if(!Zend_Registry::isRegistered('locales')){
            return;
        }

        $locales = Zend_Registry::get('locales')->toArray();

        $lang = $this->_getParam(
            'lang', 
            Zend_Registry::get('defaultLang')
        );

        if(!array_key_exists($lang, $locales)){
            $lang = Zend_Registry::get('defaultLang');
        }

        /**
         * Setting locale for global using
         */
        Zend_Registry::set('locale', $locales[$lang]);
        /**
         * Overriding lang for global using
         */
        Zend_Registry::set('lang', $lang);

        /**
         * For using lang in view
         */
        $this->view->assign('lang', $lang);
    }

    public function reload()
    {
        $this->_redirect($this->view->url());
    }

    public function __call($function, $args)
    {
		$method_name = '_' . $function;

        if(in_array($function, $this->_genericActionsEnabled) && method_exists($this, $method_name)){
            return $this->{$method_name}();
        }

        if(preg_match('/(\w+)Action\z/', $function, $matches)){
            $module = $this->getRequest()->getModuleName();

            $controller = $this->getRequest()->getControllerName(); 

            $filename =  join('/', array(
                $this->getFrontController()->getControllerDirectory($module),
                $controller,
                $matches[1] . '.php'
            ));

            $className = ucfirst($controller) . '_' . ucfirst($matches[1]);

            if(file_exists($filename)){
                require_once $filename;
                $action = new $className($this);
                //$action->dispatch();
                return $action;
            }
        }

        return parent::__call($function, $args);
    }

    protected function _viewAction()
    {
		$data = $this->getModel()->getOne($this->_getParam('id', 0));

		if(!$data){
            $this->notFoundException();
		}

		$this->view->assign('item', $data);
    }

    protected function _listAction()
    {
        $this->view->data = $this->getModel()->listAll();
    }

    protected function _editAction()
    {
        $this->_dosave('edit');
    }

    protected function _editSave($scope)
    {
        // code...
    }

    protected function _editSuccess($scope)
    {
        $this->redirect('list');
    }

    protected function _editBefore($scope)
    {
    }

    protected function _addAction()
    {
        $this->_dosave('add');
    }

    protected function _addSave($scope)
    {
        // code...
    }

    protected function _addSuccess($scope)
    {
        $this->redirect('list');
    }

    protected function _addBefore($scope)
    {
    }


    protected function _dosave($type)
    {
        $form = $this->getForm();
        $request = $this->getRequest();
        $data = $request->getPost();
        $model = $this->getModel();

        $saveMethod =    "_" . $type . "Save";
        $successMethod = "_" . $type . "Success";
        $beforeMethod =  "_" . $type . "Before";

        $scope = compact('data', 'form', 'model', 'type');

        $this->$beforeMethod($scope);

        if($request->isPost()){


            $saveMethod = 
            $success = 
                $form->isValid($data)
                && $this->$saveMethod($scope);

            if($success){
                $this->$successMethod($scope);
            }
        }

        $this->view->form = $form;
    }

	public function getForm()
	{
		if(is_null($this->_form)){

			$this->_form = new $this->_formClassName;
			$this->_form
                ->setConfig(new Zend_Config_Xml($this->getFormConfigFilename()))
                ->setMethod(Zend_Form::METHOD_POST);
            //$this->_form->addDecorator('captcha');

		}

		return $this->_form;
	}

	public function setFormConfigFilename($filename)
	{
		$this->_formConfigFilename = $filename;
		return $this;
	}

    public function getFormConfigFilename()
    {
        $formspath = APPLICATION_PATH . '/configs/forms/';
        $request = $this->getRequest();

        $action = $request->getActionName();
        $controller = $request->getControllerName();

        $searchpaths = array(
            $formspath . $this->_formConfigFilename,
            "$formspath$controller",
            "$formspath$controller/$action"
        );


        $extensions = array('.xml');

        foreach($searchpaths as $file){
            foreach($extensions as $exe){
                if($file && file_exists($file . $exe)){
                    return $file . $exe;
                }
            }
        }

        throw new Exception("Form file name is not found in path");
    }

    public function getUploadDir()
    {
        return realpath(APPLICATION_PATH . '/../public/files') . '/';
    }

    public function jsonResponse($status, $data = null, $other = array())
    {
        $response = array(
            'success' => !!$status
        );

        if($data){
            $response['data'] = $data;
        }
        __exit();

        die(Zend_Json::encode(array_merge($response, $other)));
    }

    public function jsonFailure($message, $other = array())
    {
        $this->jsonResponse(false, null, array_merge(compact('message'), $other));
    }

    public function notFoundException()
    {
        $exception = new Zend_Controller_Dispatcher_Exception("Not found", 404);
        throw $exception;
    }

    public function exe($func, $args)
    {
        return call_user_func_array(
            array($this, $func),
            $args
        );
    }

    public function get($key)
    {
        return $this->{$key};
    }

    public function set($key, $val)
    {
        return $this->{$key} = $val;
    }

    public function getItem($key='id', $method = 'getOne')
    {
        return ($this->getModel()->{$method}(
            ($this->_getParam($key, 0))
        ));
    }

    public function notFoundExceptionIfNot($conditional)
    {
        if(!$conditional){
            $this->notFoundException();
        }
    }

    public function redirectBack()
    {
        $this->_redirect(
            $this->getRequest()->getServer('HTTP_REFERER', '/')
        );
        return $this;
    }

}
