<?php
/*
 * --------------------------------------------------------------------------
 *     E Y E F I                                         http://www.eyefi.nl/
 * --------------------------------------------------------------------------
 *     O P E N  S O U R C E                       http://opensource.eyefi.nl/
 * --------------------------------------------------------------------------
 *
 * Project: ImageModifier
 *
 * Version: 0.4
 * Release date: April 21, 2006
 *
 * Library homepage:
 * http://opensource.eyefi.nl/eyefi-imgfilter/
 *
 * Source available at:
 * http://www.sourceforge.net/projects/eyefi-imgfilter
 *
 * Copyright 2003-2006 by Eyefi Interactive,
 * http://www.eyefi.nl
 *
 * Author:
 *   Arjan Scherpenisse
 *
 * Contributors:
 *   Tny Wizzkid
 *   Mikan Huppertz
 *   Gijs Kunze
 *   Joost Lubach
 *
 * --------------------------------------------------------------------------
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 * --------------------------------------------------------------------------
 */

// The global image filter cache
// IMPORTANT: If you want to alter this path, copy the line below and put it in the sitewide config.inc.php.
// That way it dont get overwritten on a new version.
define("IMGCACHE_PATH", "private/cache/img/");
define("IMAGEMODIFIER_CACHEPATH", DOCUMENT_ROOT.IMGCACHE_PATH);
define("IMAGEMODIFIER_DEFAULT_FILE_PERMISSION", 0664);

define("IMAGEMODIFIER_DEFAULT_OUTPUTFORMAT", "jpg");
define("IMAGEMODIFIER_JPEG_QUALITY", 100);

// The chain definitions.
// IMPORTANT: If you want to add new filter chains, add them to the config.inc.php and not to this file.
$GLOBALS["IMAGEMODIFIER_CHAINS"]["thumb60x60"] = array( array("resize", array("width"=>60, "height"=>60)) );
$GLOBALS["IMAGEMODIFIER_CHAINS"]["thumb100x100"] = array( array("resize", array("width"=>100, "height"=>100)) );
$GLOBALS["IMAGEMODIFIER_CHAINS"]["thumb60x60b"] = array( array("resize", array("width"=>60, "height"=>60)), array("border") );
$GLOBALS["IMAGEMODIFIER_CHAINS"]["thumb100x100b"] = array( array("resize", array("width"=>100, "height"=>100)), array("border") );

$GLOBALS["IMAGEMODIFIER_CHAINS"]["thumb100x100square"] = array(
    array("cropsquare"),
    array("resize", array("width"=>100, "height"=>100)),
);


function safe_imagecreatetruecolor($w, $h) {
    $fun = (function_exists("imagecreatetruecolor"))?"imagecreatetruecolor":"imagecreate";
    if (!function_exists($fun)) 
        trigger_error("ImageModifier: GD library not properly installed?", E_USER_ERROR);
    
    return $fun($w, $h);
}


class ImageModifier {

    var $_executed = array();

    var $_inres = false;
    var $_outres = false;

    var $_caching = true;

    var $_loadfrom = false;

    // cache magic: this ensures that we get an unique image each time for every distinct call to load().
    var $_loadmagic = false;

    // automatically chosen
    var $_outputformat = NULL; 
    // IMAGEMODIFIER_OUTPUTFORMAT; // function imagecreatefromXXX must exist!

    var $_jpeg_quality = IMAGEMODIFIER_JPEG_QUALITY; // the quality for JPEG images

    var $_errorstring = false;

    var $_extraparams;

    // Chain is an array of modifier chains:
    // every entry is an (ChainName, parameters) tuple.
    // for instance:
    // 0 => ("resize", ("width"=>100, "height"=>100))
    // 1 => ("border")
    // This creates an 100x100 modifier with a border
    function ImageModifier($chain, $extraparams=false) {
        
        if (!is_array($chain)) {
            if (strpos($chain, ":") !== false && class_exists("ImageChains")) {
                $parts = explode(":", $chain);
                $fun = $parts[0];
                $params = array_slice($parts, 1);
                if (is_callable(array("ImageChains", $fun)))
                    $chain = call_user_func_array(array("ImageChains", $fun), $params);
            } else if (is_array($GLOBALS["IMAGEMODIFIER_CHAINS"][$chain])) {
                $chain = $GLOBALS["IMAGEMODIFIER_CHAINS"][$chain];
            } else {
                // This is just a programming error. 
                // Dont trigger an error, but echo and die, because otherwise smarty+soap probs.
                // trigger_error ("ImageModifier: Unknown chain: $chain", E_USER_ERROR);
                $fun = function_exists("dbg")?"dbg":"var_dump";
                $fun("<tt>ImageModifier: Unknown chain: $chain</tt>");
                die;
            }
        }
        
        $this->_loadfrom = false;
        $this->chain = $chain;
        $this->_extraparams = $extraparams;
        $this->_executed = false;
    }

    function loadText($text) {
        $this->_outputformat = IMAGEMODIFIER_DEFAULT_OUTPUTFORMAT;
        
        $this->_loadmagic = $text;
        assert($this->chain[0][0] == "text");
        $this->chain[0][1]["text"] = $text;
        
        if ($this->isCached()) return;

        $this->_inres = safe_imagecreatetruecolor(1, 1);
        assert(is_resource($this->_inres));
    }
    
    function _loadGD($res) {
        $this->_outputformat = IMAGEMODIFIER_DEFAULT_OUTPUTFORMAT;
        $this->_loadmagic = (int)$res;
        if ($this->isCached()) return;
        
        $this->_inres = $res;
        assert(is_resource($this->_inres));
    }

    function _loadFile($filename, $realname = null) {
        $this->_loadmagic = $filename;
        if ($this->isCached()) return true;
        
        $realname = !is_null($realname) ? $realname : $filename;

        if ((int)preg_replace('~^$\d+M?~i', '$1', ini_get('memory_limit')) < 64) {
            $this->_inres = $this->_error_gd("Memory limit must be at least 64M to support this library", E_USER_WARNING);
            return false;
        }
        
        // Get extension
        if (preg_match("/\.([^\.]+)$/", $realname, $m)) {
            $ext = strtolower($m[1]);
            if ($ext == "jpg") $ext = "jpeg";
        } else
            $ext = "jpeg"; // some default

        // imagecreatefrom... function check
        $fun = "imagecreatefrom".$ext;
        if (!function_exists($fun)) {
            $this->_inres = $this->_error_gd("Function $fun does not exist!!", E_USER_WARNING);
            return false;
        }
        $this->_outputformat = function_exists("image".$ext)?$ext:IMAGEMODIFIER_DEFAULT_OUTPUTFORMAT;

        // check for file existence if it is no URL
        if (!preg_match("/^\w+:\/\//", $filename) && !file_exists($filename)) {
            $this->_inres = $this->_error_gd("File '$filename' does not exist!", E_USER_NOTICE);
            return false;
        }
        
        // load the actual image
        $this->_inres = @$fun($filename);

        // final check: the imageloadfrom... function might fail, even if file exists
        if (!is_resource($this->_inres)) {
            $this->_inres = $this->_error_gd("Function '$fun' failed on '$filename'!!", E_USER_WARNING);
            return false;
        }
        
        return true;
    }

    function _loadNew($w, $h) {
        $this->_loadmagic=$w.$h;
        if ($this->isCached()) return;
        
        $this->_outputformat = IMAGEMODIFIER_DEFAULT_OUTPUTFORMAT;
        $this->_inres = safe_imagecreatetruecolor($w, $h);
    }

    function _realload($x) {
        if (is_resource($x)) {
            $this->_loadGD($x);
        } elseif (is_array($x)) {
            $this->_loadNew($x[0], $x[1]);
        } else 
            $this->_loadFile($x);
    }

    function load($x) {
        $this->_loadfrom = $x;
        $this->_loadmagic = $x;
    }

    function _error_gd($error = "Generic error", $level=E_USER_NOTICE) {
        $gd = safe_imagecreatetruecolor(100, 100);

        $error = "ImageModifier: ".$error;

        switch($level) {
        case false:
            $back = imagecolorallocate($gd, 200, 200, 200);
            break;
            
        case E_USER_NOTICE:
            $back = imagecolorallocate($gd, 200, 200, 200);
            // trigger_error($error, $level);
            break;
        case E_USER_WARNING:
            $back = imagecolorallocate($gd, 255, 180,0);
            // trigger_error($error, $level);
            break;
        case E_USER_ERROR:
            $back = imagecolorallocate($gd, 255, 0, 0);
            trigger_error($error, $level);
            break;
        default:
            trigger_error("Unknown error level constant in ImageModifier::_error_gd");
        }
        
        imagefill($gd, 0, 0, $back);
        $yel = imagecolorallocate($gd, 255, 255, 255);

        // draw a nice cross in the error img
        imageline($gd, 0, 0, 99, 99, $yel);
        imageline($gd, 99, 0, 0, 99, $yel);
        for ($i=1; $i <= 5; $i++) {
            imageline($gd, 0, $i, 99-$i, 99, $yel);
            imageline($gd, $i, 0, 99, 99-$i, $yel);
            imageline($gd, 99-$i, 0, 0, 99-$i, $yel);
            imageline($gd, 99, $i, $i, 99, $yel);
        }
        
        $this->_errorstring = $error;
        return $gd;
    }

    function getGD() {
        $this->assureExecuted();
        assert(is_resource($this->_outres));
        return $this->_outres;
    }

    function getJPEG() {
        $this->_outputformat = "jpg";
        $this->assureExecuted();
        return $this->getCacheFileName();
    }

    function getPNG() {
        $this->_outputformat = "png";
        $this->assureExecuted();
        return $this->getCacheFileName();
    }

    function getGIF() {
        $this->_outputformat = "gif";
        $this->assureExecuted();
        return $this->getCacheFileName();
    }

    function getRelativeFilename() {
        $this->assureExecuted();
        $id = $this->getCacheId();
        return $id.".".$this->_outputformat;
    }
    
    function getImageSize() {
        $this->assureExecuted();
        return getimagesize($this->getCacheFileName());
    }

    /**
     * Sends headers to the browser to cache the current image.
     * The cache's expiry can be set in $expiry (defaults to 1 day)
     *
     * Source: comments from http://nl2.php.net/header
     */
    function sendCacheHeaders($expires = 86400) {
        $lastmod = @filemtime($this->getCacheFileName());
        $sendbody = true;
        $etag = $this->getCacheId();
        
        // check 'If-Modified-Since' header
        if (isset($_SERVER['HTTP_IF_MODIFIED_SINCE']) && gmdate('D, d M Y H:i:s', $lastmod)." GMT" == trim($_SERVER['HTTP_IF_MODIFIED_SINCE'])) {
            header("HTTP/1.0 304 Not Modified");
            header("ETag: {$etag}");
            header("Content-Length: 0");
            $sendbody = false;
        }

        // check 'If-None-Match' header (ETag)
        if ($sendbody && isset($_SERVER['HTTP_IF_NONE_MATCH'])) {
            $inm = explode(",",$_SERVER['HTTP_IF_NONE_MATCH']);
            foreach ($inm as $i) {
                if (trim($i) != $etag) continue;
                header("HTTP/1.0 304 Not Modified");
                header("ETag: {$etag}");
                header("Content-Length: 0");
                $sendbody = false; break;
            }
        }

        // caching headers (enable cache for one day)
        $exp_gmt = gmdate("D, d M Y H:i:s",time()+$expires)." GMT";
        // $mod_gmt = gmdate("D, d M Y H:i:s",$lastmod)." GMT";
        $mod_gmt = gmdate("D, d M Y H:i:s",$lastmod)." GMT";
        header("Expires: {$exp_gmt}");
        header("Last-Modified: {$mod_gmt}");
        header("Cache-Control: public, max-age={$expires}");
        header("Pragma: !invalid");

        return $sendbody;

    }
    
    function passthru() {
        $o = $this->_outputformat;
        if (strtolower($o)=="jpg") $o = "jpeg";
        $this->assureExecuted();

        $sendbody = $this->sendCacheHeaders();
        
        // On error, set a (non-standard) header. Might be useful in the future.
        if ($this->_errorstring)
            header("X-Content-Notice: ".$this->_errorstring);
        if ($sendbody) {
            header("Content-Type: image/$o");
            header("Content-Length: " .filesize($this->getCacheFileName()));
            header("ETag: ".$this->getCacheId());
            readfile($this->getCacheFileName());
        } else {
            header("Content-Type: !invalid");
        }
    }

    /** Returns full-fledged <IMG> tag */
    function getTag($opts = array()) {
        $this->assureExecuted();
        $file = $this->getCacheFileName();
        if (substr($file, 0, strlen(DOCUMENT_ROOT)) != DOCUMENT_ROOT)
            die ("Cache directory must reside inside site root");
        $relativepath = substr($file, strlen(DOCUMENT_ROOT));
        if ($relativepath{0}!='/') $relativepath = "/".$relativepath;
        $res = @getimagesize($file);
        list($w, $h) = $res;

        $base = (isset($opts["base"])?$opts["base"]:"");
        unset($opts["base"]);

        // normally, we do not want a border on images (think <A href>).
        // but, if style or class is set, let it depend on those attribute values.
        if (empty($opts["style"]) && empty($opts["class"]))
            $opts["style"] = "border: 0";
        
        if ($this->_errorstring) $opts["alt"] = $this->_errorstring;
        if ($opts !== false) {
            if (is_array($opts)) {
                $s = "";
                foreach($opts as $k=>$v) {
                    // Eyefi Behaviour attribute replace: In smarty, attribute keys
                    // with : are not allowed, so we use __ instead.
                    $k = preg_replace("~^eb__~", "eb:", $k);
                    $s .= sprintf("%s='%s'", $k, str_replace("'", "\'", $v));
                }
                                  
                $opts = trim($s);
            }
        }
        $tag = "<img src='${base}${relativepath}' width='$w' height='$h' style='border: 0' $opts />";

        if ($this->_errorstring)
            return $tag . "<!--- ".$this->_errorstring." -->";

        return $tag;        
    }

    /** Returns <INPUT TYPE="image"> tag */
    function getButton($opts = false) {
        $this->assureExecuted();
        $file = $this->getCacheFileName();
        if (substr($file, 0, strlen(DOCUMENT_ROOT)) != DOCUMENT_ROOT)
            die ("Cache directory must reside inside site root");
        $relativepath = substr($file, strlen(DOCUMENT_ROOT));
        if ($relativepath{0}!='/') $relativepath = "/".$relativepath;
        $res = @getimagesize($file);
        list($w, $h) = $res;

        $base = (isset($opts["base"])?$opts["base"]:"");
        unset($opts["base"]);

        if ($this->_errorstring) $opts["alt"] = $this->_errorstring;
        if ($opts !== false) {
            if (is_array($opts)) {
                $s = "";
                foreach($opts as $k=>$v)
                    $s .= sprintf("%s='%s'", $k, str_replace("'", "\'", $v));
                                  
                $opts = trim($s);
            }
        }
        $tag = "<input type='image' src='${base}${relativepath}' width='$w' height='$h' border='0' $opts/>";

        if ($this->_errorstring)
            return $tag . "<!--- ".$this->_errorstring." -->";

        return $tag;        
    }

    function execute() {
        if (!$this->isCached()) {
            if (!is_resource($this->_inres)&&!is_resource($this->_loadfrom)) {
                $this->_realload($this->_loadfrom);
            }
            
            // do actual exec
            $this->_outres = $this->_inres;
            foreach($this->chain as $row) {
                list($chainname, $params) = $row;
                $fun = "ImageChain_".$chainname;
                if (function_exists($fun)) {
                    if (is_array($this->_extraparams[$chainname])) {
                        foreach($this->_extraparams[$chainname] as $k=>$v)
                            $params[$k] = $v;
                    }
                    $this->_outres = $fun($this->_outres, $params);
                    
                } else {
                    $this->_outres = $this->_error_gd("Broken chain: unknown function '$fun'!", E_USER_WARNING);
                }
            }
            
            $outfun = "image".((strtolower($this->_outputformat)!="jpg")?$this->_outputformat:"jpeg");
            
            if ($outfun == "imagejpeg" && function_exists("imagejpeg")) {
                imagejpeg($this->_outres, $this->getCacheFileName(), $this->_jpeg_quality);
            } else if (function_exists($outfun)) 
                $outfun($this->_outres, $this->getCacheFileName());
            else {
                // if we have no output function, we can only die...
                trigger_error("ImageModifier: function '$outfun' does not exists. Bailing out...");
            }
            @chmod($this->getCacheFileName(), IMAGEMODIFIER_DEFAULT_FILE_PERMISSION);
        } 
        $this->_executed[$this->_outputformat] = true;
    }

    function assureExecuted() {
        if (!$this->_executed[$this->_outputformat]) $this->execute();
    }

    function getCacheId() {
        return md5(serialize($this->chain).serialize($this->_extraparams).serialize($this->_loadmagic).$this->_errorstring.@filemtime($this->_loadmagic));
    }

    function getCacheFileName() {
        $id = $this->getCacheId();
        return IMAGEMODIFIER_CACHEPATH.$id.".".$this->_outputformat;
    }

    function isCached() {
        $cached = $this->_caching  && file_exists($this->getCacheFileName()) && filesize($this->getCacheFileName());
        return $cached;
    }
}

function ImageChain_null(&$gd, $params=false) {
    return $gd;
}

function ImageChain__getdimension($dim, $original) {
    if (preg_match("/%$/", $dim)) {
        $dim = substr($dim, 0, strlen($dim)-1);
        $dim = ($dim/100) * $original;
    }

    return $dim;
}

/**
 * Parameters:
 * width, height - specify the bounding box
 * noaspect - force image into bounding box
 *
 * expand - only reduce the smallest of width and height to specified width. Image will be larger than bouding box!
 *
 * Example: image of 400x200 'resize to 100x100' (parameters width=100, height=100)
 * 1) No extra parameters: output image will be 100x50
 * 2) noaspect = true: image will be 100x100, stretched
 * 3) expand = true: image will be 200x100
 */    
function ImageChain_resize(&$gd, $params=false) {
    $src_w = imagesx($gd); $src_h = imagesy($gd);

    if (!isset($params["height"]) && !isset($params["width"])) {
        trigger_error("ImageChain_resize: missing width and/or height parameters");
    }
    
    if (isset($params["noaspect"]) && $params["noaspect"]) {
        $w = ImageChain__getdimension($params["width"], $src_w);
        $h = ImageChain__getdimension($params["height"], $src_h);
        
    } elseif (!isset($params["height"])) {
        $w = ImageChain__getdimension($params["width"], $src_w);
        $h = round($src_h / $src_w * $w);
    } elseif (!isset($params["width"])) {
        $h = ImageChain__getdimension($params["height"], $src_h);
        $w = round($src_w / $src_h * $h);
    } else {
        if(isset($params["nogrow"]) && $params["nogrow"] && $src_w < $params["width"] && $src_h < $params["height"]) return $gd;
        $src_aspect = $src_h / $src_w;
        $width = ImageChain__getdimension($params["width"], $src_w);
        $height = ImageChain__getdimension($params["height"], $src_h);
        
        $dst_aspect = $height / $width;

        if (!isset($params["expand"]) || !$params["expand"]) {
            // fit in bounding box
            if ($src_aspect>$dst_aspect) {
                $h = $height; $w = $src_w/$src_h * $h;
            } else {
                $w = $width; $h = $src_h/$src_w * $w;
            }
        } else {
            // expanding
            if ($src_aspect>$dst_aspect) {
                $w = $width; $h = $src_h/$src_w * $w;
            } else {
                $h = $height; $w = $src_w/$src_h * $h;
            }
        }
    }

    if ($src_w == $w && $src_h == $h)
        return $gd;
    
    $out = safe_imagecreatetruecolor($w, $h);
    $resizefun = (function_exists("imagecopyresampled"))?"imagecopyresampled":"imagecopyresized";
    $resizefun($out, $gd, 0, 0, 0, 0, $w, $h, $src_w, $src_h);
    imagedestroy($gd);
    
    return $out;
}

function &ImageChain_border(&$gd, $params=false) {
    if ($params["width"])
        $t = $params["width"];
    else
        $t = 2; // default 2 px border

    $w = imagesx($gd); $h = imagesy($gd);

    if ($params["enlarge"]) {
        $im = safe_imagecreatetruecolor($w+2*$t, $h+2*$t);
        imagecopy($im, $gd, $t, $t, 0, 0, $w, $h);
        imagedestroy($gd);
        $gd =& $im;
        $w += 2*$t;
        $h += 2*$t;
    }
    
    if ($params["color"]) {
        if (is_array($params["color"]))
            list($r, $g, $b) = $params["color"];
        else
            list($r, $g, $b) = htmlcolor2rgb($params["color"]);
        $col = imagecolorallocate($gd, $r, $g, $b);
    } else
        $col = imagecolorallocate($gd, 0, 0, 0); // black border = default

    for ($i=0; $i<$t; $i++) {
        imagerectangle($gd, $i, $i, $w-1-$i, $h-1-$i, $col);
    }
    return $gd;
}

/**
 * roundcorner
 *
 * params:
 * bgcolor: color string
 * radius: int
 * transparent: boolean
 *
 * border: boolean
 * border_color: color string
 * border_width: int
 */
function &ImageChain_roundcorner(&$gd, $params=false) {

    if (!isset($params["bgcolor"])) $params["bgcolor"] = "#FFFFFF";
    if (!isset($params["radius"]) || !is_numeric($params["radius"])) $params["radius"] = 16;
    $r = $params["radius"];

    $fact = 4;
    $w = imagesx($gd); $h=imagesy($gd);
    $w2 = $fact*$w; $h2 = $fact*$h; $r2 = $fact*$r;

    // 2) create mask image for bg
    $img = safe_imagecreatetruecolor($w2, $h2);
    $black = imagecolorallocate($img, 0, 0, 0);
    $white = imagecolorallocate($img, 255, 255, 255);

    imagefilledrectangle($img, $r2, 0, $w2-$r2, $h2, $white);
    imagefilledrectangle($img, 0, $r2, $w2, $h2-$r2, $white);

    imagefilledarc($img, ($r2-1), ($r2-1), $r2*2, $r2*2, 180, 270, $white, IMG_ARC_PIE);
    imagefilledarc($img, $w2 -($r2-1), ($r2-1), $r2*2, $r2*2, 270, 360, $white, IMG_ARC_PIE);
    imagefilledarc($img, ($r2-1), $h2-($r2-1), $r2*2, $r2*2, 90, 180, $white, IMG_ARC_PIE);
    imagefilledarc($img, $w2 -($r2-1), $h2 -($r2-1), $r2*2, $r2*2, 0, 90, $white, IMG_ARC_PIE);

    $bgmask = safe_imagecreatetruecolor($w, $h);
    imagecopyresampled($bgmask, $img, 0, 0, 0, 0, $w, $h, $w2, $h2);
    imagedestroy($img);

    // ... apply mask
    ImageChain_applymask_color($gd, $bgmask, $params["bgcolor"]);
    imagedestroy($bgmask);
    
    
    // 3) create mask image for border
    if ($params["border"]) {
        $bw = isset($params["border_width"])?$params["border_width"]:6;
        $bc = isset($params["border_color"])?$params["border_color"]:"#000000";

        $offset = ($fact*$bw)/2;
        $img = safe_imagecreatetruecolor($w2, $h2);
        $white = imagecolorallocate($img, 255, 255, 255);
        $black = imagecolorallocate($img, 0, 0, 0);
        imagefilledrectangle($img, 0, 0, $w2, $h2, $white);

        imagefilledellipse( $img, ($r2-1), ($r2-1), $r2*2, $r2*2, $black);
        imagefilledellipse( $img, ($r2-1), ($r2-1), $r2*2-2*$fact*$bw, $r2*2-2*$fact*$bw, $white);
        imagefilledellipse( $img, $w2-($r2-1), ($r2-1), $r2*2, $r2*2, $black);
        imagefilledellipse( $img, $w2-($r2-1), ($r2-1), $r2*2-2*$fact*$bw, $r2*2-2*$fact*$bw, $white);
        imagefilledellipse( $img, ($r2-1), $h2-($r2-1), $r2*2, $r2*2, $black);
        imagefilledellipse( $img, ($r2-1), $h2-($r2-1), $r2*2-2*$fact*$bw, $r2*2-2*$fact*$bw, $white);
        imagefilledellipse( $img, $w2-($r2-1), $h2-($r2-1), $r2*2, $r2*2, $black);
        imagefilledellipse( $img, $w2-($r2-1), $h2-($r2-1), $r2*2-2*$fact*$bw, $r2*2-2*$fact*$bw, $white);

        imagefilledrectangle ( $img, 0, $r2, $bw*$fact, $h2-$r2, $black );
        imagefilledrectangle ( $img, $w2-$bw*$fact, $r2, $w2, $h2-$r2, $black );
        
        imagefilledrectangle ( $img, $r2, 0, $w2-$r2, $bw*$fact, $black );
        imagefilledrectangle ( $img, $r2, $h2-$bw*$fact, $w2-$r2, $h2, $black );

        imagefilledrectangle( $img, $bw*$fact, $r2, $w2-$bw*$fact, $h2-$r2, $white);
        imagefilledrectangle( $img, $r2, $bw*$fact, $w2-$r2, $h2-$bw*$fact, $white);
        
        $bordermask = safe_imagecreatetruecolor($w, $h);
        imagecopyresampled($bordermask, $img, 0, 0, 0, 0, $w, $h, $w2, $h2);
        imagedestroy($img);

        // $gd = $bordermask; // $bordermask;
        ImageChain_applymask_color($gd, $bordermask, $bc);
        imagedestroy($bordermask);
    }

    // 4)
    return $gd;
}

function &ImageChain_applymask_color(&$dest, $src, $color) {
    if (imagesx($dest) != imagesx($src) || imagesy($dest) != imagesy($src))
        return false;

    $new = safe_imagecreatetruecolor(imagesx($src), imagesy($src));
    $col = htmlcolor2rgb($color);
    $fullcolor = imagecolorallocate($dest, $col[0], $col[1], $col[2]);
    
    if (imageistruecolor($src)) {
        for ($x=0; $x<imagesx($dest); $x++) {
            for ($y=0; $y<imagesy($dest); $y++) {
                $rgb = imagecolorat($src, $x, $y);
                $val = 1-((($rgb >> 16) & 0xFF) / 255.0); // take the 'R' component as the value
                if ($val == 0.0) continue; // dont change black pixels
                if ($val == 1.0) {
                    imagesetpixel($dest, $x, $y, $fullcolor);
                } else {
                    ImageChain_roundcorner_processpixel($dest, $col, $val, $x, $y);
                }
            }
        }
    } else {
        for ($x=0; $x<imagesx($dest); $x++) {
            for ($y=0; $y<imagesy($dest); $y++) {
                $c = imagecolorsforindex($src, imagecolorat($src, $x, $y));
                $val = 1-($c["red"]/255.0);
                if ($val == 0.0) continue; // dont change black pixels
                if ($val == 1.0) {
                    imagesetpixel($dest, $x, $y, $fullcolor);
                } else {
                    ImageChain_roundcorner_processpixel($dest, $col, $val, $x, $y);
                }
            }
        }
    }
}

function ImageChain_roundcorner_processpixel(&$gd, $col, $val, $x, $y) {
    if (imageistruecolor($gd)) {
        $rgb = imagecolorat($gd, $x, $y);
        $r = ($rgb >> 16) & 0xFF; $g = ($rgb >> 8) & 0xFF; $b = $rgb & 0xFF;
    } else {
        $c = imagecolorsforindex($gd, imagecolorat($gd, $x, $y));
        $r = $c["red"]; $g = $c["green"]; $b = $c["blue"];
    }
    $colindex = imagecolorallocate($gd, $val*$col[0]+(1-$val)*$r,
                                   $val*$col[1]+(1-$val)*$g,
                                   $val*$col[2]+(1-$val)*$b);
    imagesetpixel($gd, $x, $y, $colindex);
}

/**
 * params: map: which map to use ('large' or 'small')
 *              which: all|bottom|top
 */
function &ImageChain_roundcorner2(&$gd, $params=false) {
    $coordmap = array( "large" => array( array(0,0, 1.0),
                                         array(1,1, 1.0),
                                         array(0,1, 1.0),
                                         array(0,2, 1.0),
                                         array(0,3, 1.0),
                                         array(1,2, 0.87),
                                         array(2,2, 0.36),
                                         array(1,3, 0.45),
                                         array(0,4, 0.73),
                                         array(1,4, 0.05),
                                         array(0,5, 0.45),
                                         array(0,6, 0.22),
                                         array(0,7, 0.06)),
                       "small" => array( array(0,0, 1.0),
                                         array(1,1, 0.48),
                                         array(1,0, 1.0),  array(0,1, 1.0),
                                         array(2,0, 0.67), array(0,2, 0.67),
                                         array(3,0, 0.17), array(0,3, 0.17)
                                         )
                       );

    if (!$params["map"]) $params["map"] = "large";
    if (!$params["which"]) $params["which"] = "all";
    
    if (!$params["bgcolor"]) $params["bgcolor"] = "#FFFFFF";
    $col = htmlcolor2rgb($params["bgcolor"]);
    $w=imagesx($gd);$h=imagesy($gd);

    $wh = $params["which"];
    $topleft = $wh=="all"||$wh=="top"||$wh=="left"||$wh=="topleft";
    $topright = $wh=="all"||$wh=="top"||$wh=="right"||$wh=="topright";
    $botleft = $wh=="all"||$wh=="bottom"||$wh=="left"||$wh=="bottomleft";
    $botright = $wh=="all"||$wh=="bottom"||$wh=="right"||$wh=="bottomright";
    //var_dump($topleft, $topright, $botleft, $botright);
    //die;

    foreach($coordmap[$params["map"]] as $row) {
        list($x, $y, $val) = $row;
	
        if ($topleft) ImageChain_roundcorner_processpixel($gd, $col, $val, $x, $y);
        if ($topright) ImageChain_roundcorner_processpixel($gd, $col, $val, $w-$x-1, $y);
        if ($botleft) ImageChain_roundcorner_processpixel($gd, $col, $val, $x, $h-$y-1);
        if ($botright) ImageChain_roundcorner_processpixel($gd, $col, $val, $w-$x-1, $h-$y-1);
	
        if ($x != $y) {
            if ($topleft) ImageChain_roundcorner_processpixel($gd, $col, $val, $y, $x);
            if ($topright) ImageChain_roundcorner_processpixel($gd, $col, $val, $w-$y-1, $x);
            if ($botleft) ImageChain_roundcorner_processpixel($gd, $col, $val, $y, $h-$x-1);
            if ($botright) ImageChain_roundcorner_processpixel($gd, $col, $val, $w-$y-1, $h-$x-1);
        }
    }

    return $gd;
}

function ImageChain_cropsquare(&$gd, $params=false) {
    $w = imagesx($gd); $h = imagesy($gd);
    if ($w == $h) return $gd;
    $t = min($w, $h);
    $out = safe_imagecreatetruecolor($t, $t);
    
    if ($w < $h) {
        // portrait -> square
        $y1 = floor($h/2-$h/2);
        imagecopy($out, $gd, 0, 0, 0, $y1, $t, $t);
    } else {
        // landscape -> square
        $x1 = floor($w/2-$t/2);
        imagecopy($out, $gd, 0, 0, $x1, 0, $t, $t);
    }

    imagedestroy($gd);
    return $out;
}

/**
 * Crops an image to specified width / height
 *
 * Parameters: width, height
 * valign = top|middle|bottom
 * halign = left|center|right
 */
function ImageChain_crop(&$gd, $params=false) {
    $w = imagesx($gd); $h = imagesy($gd);
    $max_w = min($params["width"], $w);
    $max_h = min($params["height"], $h);

    if (!isset($params["valign"])) $params["valign"]="middle";
    if ($params["valign"] == "top") {
        $y = 0;
    } else if ($params["valign"] == "bottom") {
        $y = $h-$max_h;
    } else {
        // center / middle
        $y = floor(($h-$max_h)/2);
    }

    if (!isset($params["halign"])) $params["halign"]="center";
    if ($params["halign"] == "left") {
        $x = 0;
    } else if ($params["halign"] == "right") {
        $x = $w-$max_w;
    } else {
        // center / middle
        $x = floor(($w-$max_w)/2);
    }
    
    $out = safe_imagecreatetruecolor($max_w, $max_h);
    imagecopy($out, $gd, 0, 0, $x, $y, $max_w, $max_h);

    imagedestroy($gd);
    return $out;
}

/**
 * Crops an image to specified width / height RATIO
 *
 * Parameters: width, height
 * valign = top|middle|bottom
 * halign = left|center|right
 */
function ImageChain_crop_to_ratio(&$gd, $params=false) {
    $w = imagesx($gd); $h = imagesy($gd);
	$current_ratio = $w / $h;
	$new_ratio = $params["width"] / $params["height"];
	if($new_ratio < $current_ratio){
		$max_w = $w / $current_ratio * $new_ratio;
		$max_h = $max_w  / $params["width"] * $params["height"];
	} else {
		$max_h = $h * $current_ratio / $new_ratio;
		$max_w = $max_h / $params["height"] * $params["width"];
	}

    if (!isset($params["valign"])) $params["valign"]="middle";
    if ($params["valign"] == "top") {
        $y = 0;
    } else if ($params["valign"] == "bottom") {
        $y = $h-$max_h;
    } else {
        // center / middle
        $y = floor(($h-$max_h)/2);
    }

    if (!isset($params["halign"])) $params["halign"]="center";
    if ($params["halign"] == "left") {
        $x = 0;
    } else if ($params["halign"] == "right") {
        $x = $w-$max_w;
    } else {
        // center / middle
        $x = floor(($w-$max_w)/2);
    }
    
    $out = safe_imagecreatetruecolor($max_w, $max_h);
    imagecopy($out, $gd, 0, 0, $x, $y, $max_w, $max_h);

    imagedestroy($gd);
    return $out;
}

/*
 * Blends an image with a specific color. Optionally an alpha
 * component can be given, defaults to 50%.
 */
function &ImageChain_blend(&$gd, $params=false) {
    $color = $params["background"];
    $alpha = $params["alpha"];
    if(empty($color)) {
        $color = "#646464";
    }
    if(is_null($alpha)) {
        $alpha = 50;
    }
    
    $alpha = $alpha * (127 / 100);
    $carr = htmlcolor2rgb($color);
    $w = imagesx($gd); $h = imagesy($gd);

    imagealphablending($gd, true);
    if(function_exists("imagecolorallocatealpha")) {
        $colorres = imagecolorallocatealpha($gd, $carr[0], $carr[1], $carr[2], $alpha);
    } else {
        $colorres = imagecolorallocate($gd, $carr[0], $carr[1], $carr[2]);
    }
    
    imagefilledrectangle($gd, 0, 0, $w-1, $h-1, $colorres);
    
    return $gd;
}

/*
 * Wraps text inside an image; extends the image if necesary.
 * Does this up to $params[max_width].
 * Required params:
 * - text
 * - font
 */
function ImageChain_text(&$gd, $params=false) {

    // Optionals
    if (empty($params["font_size"])) $params["font_size"]=12;
    if (empty($params["font_options"])) $params["font_options"]=array();
    if (empty($params["h_padding"])) $params["h_padding"]=0;
    if (empty($params["v_padding"])) $params["v_padding"]=0;
    if (empty($params["linespacing"])) $params["linespacing"]=0;
    if (empty($params["tightness"])) $params["tightness"] = 0;
    if (empty($params["space"])) $params["space"] = 0;
    
    if (empty($params["background_color"])) $params["background_color"]="#FFFFFF";
    if (!empty($params["bgcolor"])) $params["background_color"]=$params["bgcolor"];
    
    if (empty($params["font_color"])) $params["font_color"]="#000000";
    if (!empty($params["color"])) $params["font_color"] = $params["color"];
    
    if (empty($params["max_width"])) $params["max_width"]=10000;
    if (empty($params["use_real_width"])) $params["use_real_width"] = true;
    if (empty($params["shadow"])) $params["shadow"]=0;
    if (empty($params["shadow_color"])) $params["shadow_color"]="#666666";

	// Set antialias, depending on font size.
    $antialias = $params["font_size"]<=20?16:4;

	// Copy the text into a local variable.
	$text = trim($params["text"]);
	
    $postscript = preg_match("/\.pfb$/i", $params["font"]);

    if ($postscript) {
        $font = imagepsloadfont($params["font"]);
        if ($params["encoding"]) {
            imagepsencodefont($font, $params["encoding"]);
        }
    } else
        $font = $params["font"];

    if (!$postscript)
        $dim = imageftbbox($params["font_size"],0,$font,"ABCDEFGHIJKLMNOPQRSTUWVXYZabcdefghijklmnopqrstuvwxyz",array());
	else
        $dim = imagepsbbox("ABCDEFGHIJKLMNOPQRSTUWVXYZabcdefghijklmnopqrstuvwxyz", $font, $params["font_size"], $params["space"], $params["tightness"], 0);

	// Transform coordinates.
	list ($xoffset, $yoffset, $unimportant, $lineheight) = _bbox($postscript, $dim);

	// Break up the text in lines if the text does not fit.
	$lines = array();
	$pos = strpos($text, " ");
	while ($pos !== false && $pos < strlen($text))
	{
		// Take the line up to the current space.
		$line = substr($text, 0, $pos);

		// Find the first space after the next word.
		while ($text{++$pos} == " " && $pos < strlen($text)) {}
		if ($pos < strlen($text)) $pos = strpos($text, " ", $pos+1);
		if ($pos === false) $pos = strlen($text);

		// Take the text up to that space (this is the current line plus the word after it).
		$tofit = substr($text, 0, $pos);

		// Now try to fit the line plus the word after the line into the box.
		if ($postscript)
            $dim = imagepsbbox($tofit, $font, $params["font_size"], $params["space"], $params["tightness"], 0);
		else
            $dim = imageftbbox($params["font_size"], 0, $font, $tofit, array());

		list($dummy, $dummy, $width, $dummy) = _bbox($postscript, $dim);

		if ($width > $params["max_width"] - 2*$params["h_padding"] - 2)
		{
			// If it does not fit, we break the line here.
			$lines[] = trim($line);
			$text = trim(substr($text, strlen($line)));

			// Reset the current position (start over on the new line).
			$pos = strpos($text, " ");
		}
	}

	if (strlen($text) > 0) $lines[] = $text;

	// Run through the lines to determine the width of the image.
	foreach ($lines as $line)
	{
		if ($postscript)
		{
            $dim = imagepsbbox($line, $font, $params["font_size"], $params["space"], $params["tightness"], 0);
		}
		else
		{
            $dim = imageftbbox($params["font_size"], 0, $font, $line, array());
		}
		list($dummy, $dummy, $width, $dummy) = _bbox($postscript, $dim);
		
		$real_width = max($real_width, $width);
	}

	// Obtain the complete text width & height.
	$width = ($params["use_real_width"] ? $real_width : $params["max_width"]) + 2*$params["h_padding"];
    $height = (count($lines) * ($lineheight + $params["linespacing"])) + 2*$params["v_padding"];

	// Prevent creating a zero-width image.
	if ($width==0) $width = 1;

	// Create a new image.
    $im = imagecreate($width, $height);

	// Calculate image colors.
    $backcol = htmlcolor2rgb($params["background_color"]);
    $back = imagecolorallocate ($im, $backcol[0], $backcol[1], $backcol[2]);
    $fontcol = htmlcolor2rgb($params["font_color"]);
    $front = imagecolorallocate ($im, $fontcol[0], $fontcol[1], $fontcol[2]);
	if (!empty($params["highlight_color"]))
	{
		$highlightcol = htmlcolor2rgb($params["highlight_color"]);
		$highlight = imagecolorallocate($im, $highlightcol[0], $highlightcol[1], $highlightcol[2]);
	}
	else
	{
		$highlight = false;
	}
    if ($params["shadow"] !== 0)
	{
        $shadowcolor = htmlcolor2rgb($params["shadow_color"]);
        $scolor = imagecolorallocate ($im, $shadow_color[0], $shadow_color[1], $shadow_color[2]);
    }

	// Initialize the cursors.
    $h_cursor = $params["h_padding"] + $xoffset;
    $v_cursor = $params["v_padding"] + $yoffset;

	// Draw each line.
    foreach ($lines as $line)
	{
		$parts = array();
		
		// Split up the line into parts, if highlighting is enabled.
		if ($highlight !== false)
		{
			// Bug with trimming in imagepstext. We need to replace ' <' with '< '
			// and ' >' with '> '.
			$line = str_replace(" >", "> ", $line);
			$line = str_replace(" <", "< ", $line);
			
			/* Parts of the text between triangular brackets are highlighted, as
			 * in "The word <highlight> is highlighted.". To enter a literal <,
			 * type two in a row (don't do this for the closing >). */

			$pos = -1;
			$oldpos = 0;

			while (($pos = strpos($line, "<", $pos+1)) !== false)
			{
				$pos++;
				
				if ($line{$pos} != "<")
				{
					$end = min(strlen($line), strpos($line, ">", $pos));
					$before = substr($line, $oldpos, $pos - $oldpos - 1);
					$within = substr($line, $pos, $end - $pos);
					if (strlen($before) > 0) $parts[] = array($before, false);
					if (strlen($within) > 0) $parts[] = array($within, true);
					$pos = $end + 1;
				}
				
				$oldpos = $pos;
				if ($pos == strlen($line)) break;
			}

			if ($oldpos < strlen($line))
				$parts[] = array(substr($line, $oldpos), false);
		}
		else
		{
			$parts[] = array($line, false);
		}

		// Draw each part.
		foreach ($parts as $part)
		{
			$highlightPart = false;
            $fontsize = $params["font_size"];
            $yy = 0;
			if (is_array($part))
			{
				$highlightPart = $part[1];
				$part = $part[0];
                if ($highlightPart) {
                    $fontsize *= 0.75;
                    $yy = -0.25* $lineheight;
                }
                
			}
			$partForeColor = $highlightPart ? $highlight : $front;
		
			// Draw each repetition (see above).
            if ($params["shadow"] !== 0) {
                if (!$postscript)
                    ImageFtText($im, $fontsize, 0, $h_cursor + $params["shadow"] , $v_cursor + $params["shadow"] + $yy, $scolor, $font, $part, $params["font_options"]);
                else
                    ImagePsText($im, $part, $font, $fontsize, $scolor, $back, $h_cursor + $params["shadow"] , $v_cursor + $params["shadow"] + $yy, $params["space"], $params["tightness"], 0, $antialias);
            }
            
            if ($postscript)
                $lastdim = ImagePsText($im, $part, $font, $fontsize, $partForeColor, $back, $h_cursor , $v_cursor + $yy, $params["space"], $params["tightness"], 0, $antialias);
            else
                $lastdim = ImageFtText($im, $fontsize, 0, $h_cursor ,  $v_cursor + $yy, $partForeColor, $font, $part, $params["font_options"]);
            
            list($dummy, $dummy, $lastwidth, $last) = _bbox($postscript, $lastdim);
            $h_cursor += $lastwidth;
        }

		// Increase the vertical cursor.
        $v_cursor += $lineheight + $params["linespacing"];
    	$h_cursor = $params["h_padding"] + $xoffset;
    }

    return $im;
}

/*
 * Converts the bounding box coordinates returned by image...bbox or image...text
 * into x, y, width and height.
 **
 * @postscript	bool	Set to true if the result came back from imagepsbbox, or to
 *						false if the result came back from imageftbbox.
 * @result		array	The result from the image...bbox or image...text function.
 * @returns		array	An array in the form {x, y, w, h}.
 */
function _bbox($postscript, $result)
{
	if ($postscript)
	{
		$x = $result[0] - 1;
		$y = $result[3];
		$width = $result[2] - $result[0] + 2;
		$height = $result[3] - $result[1] + 1;
	}
	else
	{
		$x = -$result[6];
		$y = -$result[7];
		$width = $result[2] - $result[6] + 2;
		$height = $result[3] - $result[7] + 1;
	}

	return array($x, $y, $width, $height);
}

/**
 * Given an image with an alpha channel, replaces the alpha channel by
 * the bgcolor.
 *
 * Params:
 * bgcolor: color
 */
function ImageChain_bgcolor(&$gd, $params) {
    $col = htmlcolor2rgb($params["bgcolor"]?$params["bgcolor"]:"#66FF00");

    $back = safe_imagecreatetruecolor(imagesx($gd), imagesy($gd));
    $bgcol = imagecolorallocate($back, $col[0], $col[1], $col[2]);
    imagefill($back, 0,0, $bgcol);
    
    imagecopy($back, $gd, 0,0, 0,0, imagesx($gd), imagesy($gd) );
    imagedestroy($gd);

    return $back;
}


/**
 * Add margins to image
 * 
 * params:
 * - all, top, left, bottom, right: pixel values
 */
function ImageChain_margin(&$gd, $params) {
    extract($params);
    $left = $left?$left:($leftright?$leftright:($all?$all:0));
    $right = $right?$right:($leftright?$leftright:($all?$all:0));

    $top = $top?$top:($topbottom?$topbottom:($all?$all:0));
    $bottom = $bottom?$bottom:($topbottom?$topbottom:($all?$all:0));

    $new = safe_imagecreatetruecolor(imagesx($gd)+$left+$right, imagesy($gd)+$top+$bottom);
    if (isset($bgcolor)) {
        $col = htmlcolor2rgb($bgcolor);
        $bgcol = imagecolorallocate($new, $col[0], $col[1], $col[2]);
    } else {
        // make background color equal bottom-right pixel
        $rgb = imagecolorat($gd, imagesx($gd)-1, imagesy($gd)-1);
        if (imageistruecolor($gd)) 
            $bgcol = imagecolorallocate($new, ($rgb>>16)&0xFF, ($rgb>>8)&0xFF, $rgb&0xFF);
        else {
            $col = imagecolorsforindex($gd, $rgb);
            $bgcol = imagecolorallocate($new, $col["red"], $col["green"], $col["blue"]);
        }
    }
    imagefill($new, 0,0, $bgcol);
    imagecopy($new, $gd, $left, $top, 0, 0, imagesx($gd), imagesy($gd));
    imagedestroy($gd);
    return $new;    
}

/**
 * Expands / crops canvas to specified width/height
 *
 * params: width, height
 * valign (top|middle|bottom), halign (left|center|right)
 * bgcolor (default #ffffff)
 */
function ImageChain_canvassize(&$gd, $params) {
    extract($params);

    $new = safe_imagecreatetruecolor($width, $height);
    
    if (isset($bgcolor)) {
        $col = htmlcolor2rgb($bgcolor);
        $bgcol = imagecolorallocate($new, $col[0], $col[1], $col[2]);
    } else {
        // make background color equal bottom-right pixel
        $rgb = imagecolorat($gd, imagesx($gd)-1, imagesy($gd)-1);
        if (imageistruecolor($gd)) 
            $bgcol = imagecolorallocate($new, ($rgb>>16)&0xFF, ($rgb>>8)&0xFF, $rgb&0xFF);
        else {
            $col = imagecolorsforindex($gd, $rgb);
            $bgcol = imagecolorallocate($new, $col["red"], $col["green"], $col["blue"]);
        }
    }
    imagefill($new, 0,0, $bgcol);

    if (!isset($valign)) $valign = "middle";
    if (!isset($halign)) $halign = "center";
    
    if ($halign == "center")
        $x = (int)($width/2 - imagesx($gd)/2);
    else if ($halign == "right")
        $x = $width - imagesx($gd);
    else
        $x = 0;

    if ($valign == "middle")
        $y = (int)($height/2 - imagesy($gd)/2);
    else if ($valign == "bottom")
        $y = $height - imagesy($gd);
    else
        $y = 0;

    imagecopy($new, $gd, $x, $y, 0, 0, imagesx($gd), imagesy($gd));
    imagedestroy($gd);
    return $new;    
}

/**
 * parameters: x, y, width, height
 * overlay: file
 */
function ImageChain_overlay(&$gd, $params=false) {

    $sizex = imagesx($gd);
    $sizey = imagesy($gd);
    
    $overlay = (is_resource($params["overlay"]))?$params["overlay"]:imagecreatefrompng($params["overlay"]);
    $sx = imagesx($overlay);
    $sy = imagesy($overlay);
    
    if (!$params["x"]) $params["x"] = 0;
    if (!$params["y"]) $params["y"] = 0;
    if (!$params["width"]) $params["width"] = min($sx, $sizex - $params["x"]); // default bottom right corner
    if (!$params["height"]) $params["height"] = min($sy, $sizey - $params["y"]);
    
    imagealphablending($gd, true);
    
    imagecopyresampled($gd, $overlay, $params["x"], $params["y"], 0, 0, $params["width"], $params["height"], $sx, $sy);
    
    return $gd;
}

/**
 * Convert an image to grayscale
 */
function ImageChain_grayscale(&$gd, $params) {
    $w = imagesx($gd);
    $h = imagesy($gd);
    for($i=0; $i<$h; $i++) {
        for($j=0; $j<$w; $j++) {
            $pos = imagecolorat($gd, $j, $i);
            if (!imageistruecolor($gd)) {
                $f = imagecolorsforindex($gd, $pos);
                $gst = $f["red"]*0.15 + $f["green"]*0.5 + $f["blue"]*0.35;
                $col = imagecolorexact($gd, $gst, $gst, $gst);
                if ($col = -1) $col = imagecolorallocate($gd, $gst, $gst, $gst);
            } else {
                $gst = (($pos>>16)&0xFF)*0.15 + (($pos>>8)&0xFF)*0.5 + ($pos&0xFF)*0.35;
                $col = imagecolorallocate($gd, $gst, $gst, $gst);
            }
            imagesetpixel($gd, $j, $i, $col);
        }
    }
    return $gd;
}


/**
 * The chain is a mask, and we put an external image under it.
 * Useful for adding dynamic text on top of a static image.
 * expects:
 * - file: name of overlay file (PNG)
 * - x, y: coords of source mask
 * - color: target color of white areas in mask (default white)
 */
function ImageChain_sourcemask(&$gd, $params) {
    $bc = isset($params["color"])?$params["color"]:"#FFFFFF";
    if (!isset($params["x"])) $params["x"] = 0;
    if (!isset($params["y"])) $params["y"] = 0;
    
    $dest = imagecreatefrompng($params["file"]);
    $src_w = imagesx($gd); $src_h = imagesy($gd);
    $w = imagesx($dest); $h = imagesy($dest);

    if ($src_w != $w || $src_h != $h) {
        $back = imagecreate($w, $h);
        $backcolor = imagecolorallocate($back, 255, 255, 255);
        imagecopy($back, $gd, 0, 0, -$params["x"], -$params["y"], $src_w+$params["x"], $src_h+$params["y"]);
        imagedestroy($gd);
        $gd = $back;
    }
    
    ImageChain_applymask_color($dest, $gd, $bc);
    imagedestroy($gd);
    return $dest;
}






function htmlcolor2rgb($htmlcol) {
    $offset = 0;
    if ($htmlcol{0}=='#') $offset = 1;
    $r = hexdec(substr($htmlcol, $offset, 2));
    $g = hexdec(substr($htmlcol, $offset+2, 2));
    $b = hexdec(substr($htmlcol, $offset+4, 2));
    return array($r, $g, $b);
}