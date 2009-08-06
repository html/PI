<?php


/**
 * Wrapper around phpbb session
 **/

/**
 * @see Zend_Auth_Storage_Interface
 */
require_once 'Zend/Auth/Storage/Interface.php';

class Auth_Storage_Phpbbsession implements Zend_Auth_Storage_Interface
{
    protected $_phpbbSessionInstance;

    public function __construct($instance = null)
    {
        if(null !== $instance){
            $this->setPhpbbSessionInstance($instance);
        }
    }

    /**
     * @throws Exception
     * @return phpbb session instance
     */
    public function getPhpbbSessionInstance()
    {
        if(is_null($this->_phpbbSessionInstance)){
            throw new Exception("You must set instance of phpbb session via setPhpbbSessionInstance");
        }

        return $this->_phpbbSessionInstance;
    }

    public function setPhpbbSessionInstance($instance)
    {
        $this->_phpbbSessionInstance = $instance;
        return $this;
    }

    /**
     * Defined by Zend_Auth_Storage_Interface
     *
     * @return boolean
     */
    public function isEmpty()
    {
        return $this->getPhpbbSessionInstance()->data['user_id'] == ANONYMOUS;
    }

    /**
     * Defined by Zend_Auth_Storage_Interface
     *
     * @return boolean
     */
    public function read()
    {
        throw new Exception('No implemented yet');
        //($this->getPhpbbSessionInstance());
    }

    /**
     * Defined by Zend_Auth_Storage_Interface
     *
     * @return boolean
     */
    public function write($contents)
    {
        throw new Exception('No implemented yet');
        //($this->getPhpbbSessionInstance());
    }

    /**
     * Defined by Zend_Auth_Storage_Interface
     *
     * @return boolean
     */
    public function clear()
    {
        $instance = $this->getPhpbbSessionInstance();
        $instance->session_kill();
        $instance->session_begin();
    }
}
