<?php

define("IMAGES_DIR", realpath(dirname(__FILE__) . "/../images/"));
define("DEFAULT_IMAGE_URI", "/img/no-image-150-75.jpg");
define("THUMBNAIL_WIDTH", 150);
define("THUMBNAIL_PERMISSIONS", 0x777);
define("THUMBNAILS_DIR", (dirname(__FILE__)));

require_once realpath(dirname(__FILE__) . "/../../../library/resizeimage.php");
