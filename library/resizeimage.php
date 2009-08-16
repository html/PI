<?php

function __autoload($className)
{
    require $className = str_replace('_', '/', $className) . '.php';
}

defined('APPLICATION_PATH')
    || define('APPLICATION_PATH', (realpath(dirname(__FILE__) . '/../application')));

set_include_path(implode(PATH_SEPARATOR, array(
    realpath(APPLICATION_PATH . '/../library'),
    realpath(APPLICATION_PATH . '/models'),
    get_include_path(),
)));

require_once 'functions.php';

$file = IMAGES_DIR . '/' . urldecode(basename($_SERVER['REQUEST_URI']));
$fileurl = "/files/images/" . basename($_SERVER['REQUEST_URI']);
$targetfilename = THUMBNAILS_DIR . '/' . urldecode(basename($_SERVER['REQUEST_URI']));

try{
    $image = Image_Factory::factory($file);

    if($image->getWidth() < THUMBNAIL_WIDTH){
        header("Location: $fileurl");
        exit;
    }

    $width = $image->getWidth();
    $height = $image->getHeight();

    $image->scaleTo(
        THUMBNAIL_WIDTH, 
        (int)@($height / ($width / THUMBNAIL_WIDTH))
    );

    $success = $image->save($targetfilename)
        && chmod($targetfilename, THUMBNAIL_PERMISSIONS);

}catch(Exception $e){
    $success = false;
}


if(!$success){
    header("HTTP/1.1 404 Not Found");
}

header("Location: " . ($success ? $_SERVER['REQUEST_URI'] : DEFAULT_IMAGE_URI ));
