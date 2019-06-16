<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo @$direction; ?>" lang="<?php echo @$language; ?>" xml:lang="<?php echo @$language; ?>">
<head>
<link type="image/x-icon" href="<?php echo HTTP_SERVER.DIR_IMAGE?>logo-small.png" rel="icon">
<link type="image/x-icon" href="<?php echo HTTP_SERVER.DIR_IMAGE?>logo-small.png" rel="shortcut icon">
<title><?php echo @$title?></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="robots" content="INDEX,FOLLOW" />
<meta http-equiv="REFRESH" content="5400" />
<meta name="description" content="<?php echo @$meta_description?>" />
<meta name="keywords" content="<?php echo @$meta_keyword?>" />		
<meta name="author" content="Ho Lan Solutions">
<meta name="revisit-after" content="7" />
<meta name="creator" content="Ho Lan Solutions" />
<meta name="publisher" content="Ho Lan Solutions" />

<meta property="og:title" content="<?php echo @$title?>">
<meta property="og:type" content="Website">
<meta property="og:url" content="<?php echo @$url?>">
<meta property="og:description" content="<?php echo @$meta_description?>">
<?php echo @$meta_image?>
<meta name="google-site-verification" content="yqhMNGN6WGMm8jAKo0k6AHUjo71zXAQN7uEHPuo-BG8" />
</head>

<!--[if lt IE 7]>
	<link href="<?php echo DIR_VIEW?>css/ie_style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<?php echo DIR_VIEW?>js/ie_png.js"></script>
    <script type="text/javascript">
       ie_png.fix('.png');
	</script>
<![endif]-->
<link rel='stylesheet' type='text/css' href='<?php echo HTTP_SERVER.DIR_VIEW?>css/style.css'>

<link rel='stylesheet' type='text/css' href='<?php echo HTTP_SERVER.DIR_VIEW?>css/jquery-ui.css'>



<link rel='stylesheet' type='text/css' href='<?php echo HTTP_SERVER.DIR_CSS?>product.css'>

<script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/jquery.js'></script>
<script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/jquery-ui.js'></script>
<script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/jquery.lazy.js'></script>
<script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/jquery.blockUI.js'></script>
<script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/snow-plugin.js'></script>
<script language="javascript">
var HTTP_SERVER = '<?php echo HTTP_SERVER?>';
var DIR_COMPONENT = '<?php echo HTTP_SERVER.DIR_COMPONENT?>';
</script>
<link rel='stylesheet' type='text/css' href='<?php echo HTTP_SERVER.DIR_COMPONENT?>snowfalling/snow.css'>

<script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/common.js'></script>
<script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/cart.js'></script>
<script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/product.js'></script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-45593057-1', 'mylanbeauty.net');
  ga('send', 'pageview');

</script>
<script type="text/javascript">
var loading = "<center id=\"loading\"><img src=\"<?php echo HTTP_SERVER.DIR_IMAGE?>loading.gif\"></center>'";
</script>
<script language="javascript">

</script>


<body>

<div style="display:none"><?php echo @$meta_keyword?></div>
<div class="hl-site hl-left"></div>
<div class="hl-site hl-right"></div>


<div id="ben-body">
	<div id="snowContainer"></div>
    <div id="ben-main">
        
        <?php echo @$header?>
        
        <div id="ben-content">
            <?php echo @$content?>
        </div>
        
        
    
    </div>
</div>
    <div id="ben-bottom">
        <?php echo @$footer?> 
    </div>
    <div id="ben-popup" style="display:none">
        <div id="ben-popup-content"></div>
        
    </div>
<style>
    .snow-canvas {
        display: block;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        position: fixed;
        pointer-events: none;
    }
</style>


<!--<canvas class="snow-canvas" speed="1" interaction="false" size="2" count="80" opacity="0.00001" start-color="rgba(253,252,251,1)" end-color="rgba(251,252,253,0.3)" wind-power="0" image="false" width="1366" height="667"></canvas>
<canvas class="snow-canvas" speed="2" interaction="true" size="6" count="30" start-color="rgba(253,252,251,1)" end-color="rgba(251,252,253,0.3)" opacity="0.00001" wind-power="2" image="false" width="1366" height="667"></canvas>
<canvas class="snow-canvas" speed="3" interaction="true" size="12" count="20" wind-power="-5" image="snow.png" width="1366" height="667"></canvas>-->


<script>
    //$(".snow-canvas").snow();
</script>
</body>

</html>
<div id="mystickytooltip" class="stickytooltip">
	<div style="padding:5px">
        <div id="sticky1">
        	
        </div>
    </div>
</div>
<script language="javascript">

$(window).resize(function(e) {
    fix_Site();
	
});
function fix_Site()
{
	var wsite = ($(document).innerWidth() - $('#ben-main').outerWidth())/2;
	$('.hl-site').width(wsite + 5);
	$('.run-site').width(wsite + 5);
}
$(document).ready(function(e) {
    fix_Site();
	//runMove();
});
var fmove = true;
$(document).scroll(function(e) {
	//setTimeout("runMove();",500);
	
});
/*function runMove()
{
	 var pTop = Number($(document).scrollTop());
	//alert(pTop);
	if(fmove)
	{
		
		fmove = false
		var runTop = Number($('.run-site').css('top').replace("px",''));
		
		var move = Number( pTop) - Number(runTop);
		//console.log(move)
		$('.run-site').animate({"top":"+="+move+"px"},"slow",function(){
			var pTop = Number($(document).scrollTop());
			var runTop = Number($('.run-site').css('top').replace("px",''));
			//$('.hl-left').html("doctop: "+ pTop);
			//$('.hl-left').append("<br>runtop: "+ runTop);
			fmove=true;
			if(pTop!=runTop)
				setTimeout("runMove();",500);
		});
	}
}*/
</script>