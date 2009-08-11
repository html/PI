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

        Zend_Auth::getInstance()->setStorage(
            new Auth_Storage_Phpbbsession($user)
        );

        unset($user);
        restore_error_handler();
