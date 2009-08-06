<?php

function l($text, $params = null, $options = null){
	$args = func_get_args();
	echo call_user_func_array('lang', $args);
}

function lang()
{
	defined('PAGE_IS_NOT_TRANSLATED')
			or define('PAGE_IS_NOT_TRANSLATED', 666);

	static $defaults = array(
		'json' => false,
		'force' => false,
		'namespace' => 'default',
		'usenativelocale' => true,
	);

	static $userIsTranslator;
    return func_get_arg(0);

	if(is_null($userIsTranslator)){
		$acl = Zend_Registry::get('acl');
		$user_role = class_exists('UserModel', false) ? UserModel::getCurrentUserInfo()->role : 'guest';
		$userIsTranslator = $acl->isAllowed($user_role, 'translate');
	}

	$args = $originalArgs = func_get_args();
	$trString = array_shift($args);
	__log__("Want to translate string \"$trString\"", Zend_Log::INFO);

	//return $trString;
	$c = count($args);

	/*
	if(preg_match('/company/', $trString)){
		de($args);
	}
*/
	if($c > 1 && is_array($args[$c - 1])){
		$options = array_pop($args);
	}else{
		$options = array();
	}
		if(isset($args[0])){
			$args = is_array($args[0]) ? $args[0] : array($args[0]);
		}

	/*
	if(preg_match('/about -/', $trString)){
		de($args);
	}
	 */

	$options += $defaults;

	if(Zend_Controller_Front::getInstance()->getRequest()->getModuleName()== 'admin'){
		$options['json'] = true;
	}

	$options['register_untranslated_words'] = !!Zend_Registry::get('configuration')->register_untranslated_words;

	$translate = Zend_Registry::get('translations')->{$options['namespace']};
	$translate->getAdapter()->setLocale(Zend_Registry::get('locale'));

	if(is_null($translate)){
		throw new Exception("No translation found under register $options[namespace]");
	}


	/**
	 * Do we have translation ?
	 */
	if($translate->isTranslated($trString)){

		$jsonStr = Zend_Json::encode($trString);

		$trString = $translate->translate($trString);

		if($args){
			$trString = myprint($trString, $args);
		}

		return $trString;

		if($userIsTranslator && !$options['json']){
			$trString .= "<a href='#' onclick='translate($jsonStr,this,options)'>#</a>";
		}

		return $trString;
	/**
	 * Is the language of translation default ?
	 */
	}else if($translate->getAdapter()->getLocale() == 'uk_UA' && $options['usenativelocale']){
		if(is_string($args)){
		}
		return myprint($trString, $args);
	/**
	 * Do we need to return original string ?
	 */
	}else if($userIsTranslator || $options['force']){

		__log__("String is not translated but forced - \"$trString\"", Zend_Log::INFO);

		if($options['register_untranslated_words']){

			AdminTranslateModel::getInstance()->addTranslationString(
				Zend_Registry::get('lang'),
				$trString
			);

		}

		return myprint($trString, $args);#

		if(!$options['json']){
			$jsonStr = Zend_Json::encode($trString);
			$trString .= "<a href='#' onclick='translate($jsonStr,this,options)'>*</a>";
		}

		return myprint($trString, $args);#
	}else if(!UserController::isDispatchableNow()){ //Need to let user login
		__log__("String is not translated - \"$trString\"", Zend_Log::INFO);
		//throw new Exception('Sorry page is not translated yet', PAGE_IS_NOT_TRANSLATED);
	}

	return myprint($trString, $args);
}

function __log__($value, $priority)
{
    if(Zend_Registry::isRegistered('logger')){
        Zend_Registry::get('logger')->log($value, $priority);
    }
}

function fd()
{
	$args = func_get_args();

	foreach($args as $val){
		Zend_Registry::get('logger')->log($val, Zend_Log::DEBUG);
	}

	return $args[0];
}

function myprint($string, array $params)
{

	$keys = array_keys($params);
	$vals = array_values($params);
	foreach($keys as &$key){
		$key = '%' . $key . '%';
	}
	//de($keys, $vals, $string, $params);
	return str_replace($keys, $vals, $string);
}

#debug section
#

function d(){
    $args = func_get_args();
    echo '<pre>';
    array_map('var_dump',$args);
    echo '</pre>';
    return $args[0];
}

function de(){
    $args = func_get_args();
    array_map('d',$args);
    exit;
}

function decm($class){
    de(get_class_methods($class));
}

function dw(){
    $args = func_get_args();
    echo '<pre>';
    array_map('var_dump',$args);
    echo '</pre>';
    return $args[0];
}


function todo($str){
    $b = debug_backtrace();
    die(sprintf("TODO: <b>%s</b> <BR>\nFILE: &nbsp;&nbsp;<b>%s</b>,<BR>\nLINE:&nbsp; <b>%s</b>", $str,$b[0]['file'],$b[0]['line']));
}

function note($str){
    defined('NOTE_KEY') or define('NOTE_KEY', md5('note'));
    $b = debug_backtrace();
    $GLOBALS[NOTE_KEY][]= array($str,$b[0]['file'],$b[0]['line']);
}

function displayNotes(){
    ob_get_level() && ob_end_clean();
    if(!defined('NOTE_KEY')) return;
    $notes = $GLOBALS[NOTE_KEY];

    for(;list($note,$file,$line) = current($notes);next($notes)){
        echo "<b>$note</b><br> in file <b>$file</b><br> on line <b>$line</b>";
    }
    exit;
}

function trunc($phrase, $max_words)
{
   $phrase_array = explode(' ',$phrase);

   if(count($phrase_array) > $max_words && $max_words > 0){
      $phrase = implode(' ',array_slice($phrase_array, 0, $max_words)).'...';
   }

   return $phrase;
}


function mydebugbacktrace()
{
    $trace = debug_backtrace();
    $isShell = array_key_exists("SHELL", $_ENV);
    if($isShell){

        foreach($trace as $val){
            echo "File: $val[file]\nLine: $val[line]\nFunction: $val[function]\n\n";
        }

    }else{
        echo '<table>';
        foreach($trace as $val){
            echo "<tr><td>$val[file]</td><td>$val[line]</td><td>$val[function]</td>";
        }
        echo '</table>';
    }
    exit;
}
