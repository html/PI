<?php
        define('IN_PHPBB', true);

        $forum_path = dirname(APPLICATION_PATH) . '/public/forum/';


        set_include_path(
            implode(PATH_SEPARATOR, array(
                get_include_path(),
                $forum_path,
            ))
        );

        /**
         * Used in common.php
         */
        $phpbb_root_path = $forum_path;
        $phpEx = 'php';

        //require_once 'functions.php';
        require_once 'common.php';

        foreach($GLOBALS as $key=>$val){
            if(is_null($val)){
                $GLOBALS[$key] = $$key;
            }
        }

        require_once 'includes/session.php';


        $user = new user;
        $user->session_begin();

        require_once 'Zend/Registry.php';
        Zend_Registry::set('user', $user);

        require_once 'Zend/Auth.php';
        require_once 'Auth/Storage/Phpbbsession.php';

        $auth = Zend_Auth::getInstance();

        $auth->setStorage(
            new Auth_Storage_Phpbbsession($user)
        );

        $data = $auth->getStorage()->read();
        $data['session_page'] = $_SERVER['REQUEST_URI'];
        $auth->getStorage()->write($data);

        define('IS_ADMIN', ($auth->hasIdentity() && ($ident = $auth->getIdentity()) && $ident['group_id'] == 5));
        unset($user, $ident, $auth);
        restore_error_handler();
