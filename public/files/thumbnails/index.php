<?php
require '/var/www/lib/lib.php';
define("IMAGES_DIR", realpath(dirname(__FILE__) . "/../images/"));
define("DEFAULT_IMAGE_URI", "/img/no-image-150-75.jpg");
define("THUMBNAIL_WIDTH", 150);
define("JPEG_QUALITY", 90);
define("THUMBNAIL_PERMISSIONS", 0x777);
define("THUMBNAILS_DIR", (dirname(__FILE__)));

$file = IMAGES_DIR . '/' . urldecode(basename($_SERVER['REQUEST_URI']));
$fileurl = "/files/images/" . basename($_SERVER['REQUEST_URI']);
$targetfilename = THUMBNAILS_DIR . '/' . urldecode(basename($_SERVER['REQUEST_URI']));

function copyResampledImage($targetwidth, $size, $source_image)
{
    require_once 'ImageModifier.php';

    $targetheight = (int)@($size[1] / ($size[0] / $targetwidth));
    $target_image = safe_imagecreatetruecolor($targetwidth, $targetheight);

    imagecopyresampled(
        $target_image, $source_image, 0, 0, 0, 0,
        $targetwidth, $targetheight, $size[0], $size[1]
    );

    return $target_image;
}

function loadImage($size, $file)
{
    $imagetype = end(explode('/', $size['mime']));

    $func = 'imagecreatefrom' . $imagetype;

    if(!function_exists($func)){
        return false;
    }

    return $func($file);
}

try{
    $success = file_exists($file)
        && ($size = getimagesize($file));

    if($success && $size[0] < THUMBNAIL_WIDTH){
        header("Location: $fileurl");
        exit;
    }

    $success = $success && ($image = loadImage($size, $file))
        && ($newimage = copyResampledImage(THUMBNAIL_WIDTH, $size, $image))
        && (imagejpeg($newimage, $targetfilename, JPEG_QUALITY))
        && chmod($targetfilename, THUMBNAIL_PERMISSIONS);

}catch(Exception $e){
    $success = false;
}


if(!$success){
    header("HTTP/1.1 404 Not Found");
}
header("Location: " . ($success ? $_SERVER['REQUEST_URI'] : DEFAULT_IMAGE_URI ));
