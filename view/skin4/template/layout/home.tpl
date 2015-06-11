<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>" xml:lang="<?php echo $language; ?>">
<head>
<link type="image/x-icon" href="<?php echo HTTP_SERVER.DIR_IMAGE?>logo-small.png" rel="icon">
<link type="image/x-icon" href="<?php echo HTTP_SERVER.DIR_IMAGE?>logo-small.png" rel="shortcut icon">
<link rel="shortcut icon" href="favicon.ico">
<title><?php echo $title?></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="robots" content="INDEX,FOLLOW" />
<meta http-equiv="REFRESH" content="5400" />
<meta name="description" content="<?php echo $meta_description?>" />
<meta name="keywords" content="<?php echo $meta_keyword?>" />		
<meta name="author" content="Ho Lan Solutions">
<meta name="revisit-after" content="7" />
<meta name="creator" content="Ho Lan Solutions" />
<meta name="publisher" content="Ho Lan Solutions" />

<meta property="og:title" content="<?php echo $title?>">
<meta property="og:type" content="Website">
<meta property="og:url" content="<?php echo $url?>">
<meta property="og:description" content="<?php echo $meta_description?>">
<?php echo $meta_image?>
<meta name="google-site-verification" content="yqhMNGN6WGMm8jAKo0k6AHUjo71zXAQN7uEHPuo-BG8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

	
	<link rel="stylesheet" href="<?php echo HTTP_SERVER.DIR_CSS?>jquery.mobile-1.4.5.css">
	<link rel="stylesheet" href="<?php echo HTTP_SERVER.DIR_CSS?>jqm-hl.css">
    <link rel="stylesheet" href="<?php echo HTTP_SERVER.DIR_CSS?>style.css">
	<script src="<?php echo HTTP_SERVER.DIR_JS?>jquery.js"></script>
	<script src="<?php echo HTTP_SERVER.DIR_JS?>index.js"></script>
	<script src="<?php echo HTTP_SERVER.DIR_JS?>/jquery.mobile-1.4.5.js"></script>
</head>

<body>
	<div style="display:none"><?php echo $meta_keyword?></div>
    <div data-role="page" class="jqm-hl jqm-home">
        <?php echo $header?>
        <div role="main" class="ui-content jqm-content">
    		<?php echo $content?>
        </div>
           
    
    
        <div data-role="footer" data-position="fixed" data-tap-toggle="false" class="jqm-footer">
            <p>jQuery Mobile Demos version <span class="jqm-version"></span></p>
            <p>Copyright 2014 The jQuery Foundation</p>
        </div><!-- /footer -->
        
    
    
    </div><!-- /page -->

</body>

</html>
