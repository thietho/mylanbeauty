<?php
// HTTP
define('HTTP_IMAGE', 'http://'.$_SERVER['HTTP_HOST'].'/mylanbeauty/file/');
define('HTTP_SERVER', 'http://'.$_SERVER['HTTP_HOST'].'/mylanbeauty/');
//define('HTTP_IMAGE', 'http://localhost:81/mylanbeauty/file/');
//define('HTTP_SERVER', 'http://localhost:81/mylanbeauty/');

// HTTPS
define('HTTPS_SERVER', '');
define('HTTPS_IMAGE', '');

// DIR
define('DIR_APPLICATION', '');
define('DIR_CONTROLLER','controller/');
define('DIR_MODEL','model/');
define('DIR_LANGUAGE', 'language/');

define('DIR_DATABASE', 'system/database/');
define('DIR_COMPONENT', 'component/');
define('DIR_FILE','file/');
define('DIR_SYSTEM', 'system/');
define('DIR_CACHE', 'file/cache/');
define('DIR_CACHEHTML', 'file/cachehtml/');

$filename = DIR_FILE."db/setting.json";;
@$handle = fopen($filename, "r");
@$contents = fread($handle, filesize($filename));
@fclose($handle);
//$setting = json_decode($contents);

/*if($setting->skin=="")
	$setting->skin="skin1";*/

require_once DIR_COMPONENT.'MobileDetect/Mobile_Detect.php';
$detect = new Mobile_Detect;
$deviceType = ($detect->isMobile() ? ($detect->isTablet() ? 'tablet' : 'phone') : 'computer');
$scriptVersion = $detect->getScriptVersion();
switch($deviceType) 
{
	case 'phone':
		$skin = 'skin4';
		define('IMG_PROLIST', '320');
		break;
	default:
		$skin = 'skin2';
		define('IMG_PROLIST', '180');
}

define('DIR_VIEW','view/'.$skin.'/');
define('DIR_TEMPLATE','view/'.$skin.'/template/');
define('DIR_IMAGE', 'view/'.$skin.'/image/');
define('DIR_FLASH', 'view/'.$skin.'/flash/');
define('DIR_CSS', 'view/'.$skin.'/css/');
define('DIR_JS', 'view/'.$skin.'/js/');
define('DIR_XML', 'view/'.$skin.'/xml/');

/*define('DIR_VIEW','view/skin1/');
define('DIR_TEMPLATE','view/skin1/template/');
define('DIR_IMAGE', 'view/skin1/image/');
define('DIR_FLASH', 'view/skin1/flash/');
define('DIR_CSS', 'view/skin1/css/');
define('DIR_JS', 'view/skin1/js/');
define('DIR_XML', 'view/skin1/xml/');*/

//

?>