<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>" xml:lang="<?php echo $language; ?>">
<head>
<link type="image/x-icon" href="<?php echo HTTP_SERVER.DIR_IMAGE?>logo-small.png" rel="icon">
<link type="image/x-icon" href="<?php echo HTTP_SERVER.DIR_IMAGE?>logo-small.png" rel="shortcut icon">
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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
<meta property="og:title" content="<?php echo $title?>">
<meta property="og:type" content="Website">
<meta property="og:url" content="<?php echo $url?>">
<meta property="og:description" content="<?php echo $meta_description?>">
<?php echo $meta_image?>
<meta name="google-site-verification" content="yqhMNGN6WGMm8jAKo0k6AHUjo71zXAQN7uEHPuo-BG8" />
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Homepage - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="<?php echo HTTP_SERVER.DIR_CSS?>bootstrap.css" rel="stylesheet">
	
    <!-- Custom CSS -->
    <link href="<?php echo HTTP_SERVER.DIR_CSS?>style.css" rel="stylesheet">
	<link href="<?php echo HTTP_SERVER.DIR_CSS?>menu.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script src="<?php echo HTTP_SERVER.DIR_JS?>jquery.js"></script>
    <script src="<?php echo HTTP_SERVER.DIR_JS?>jquery.blockUI.js"></script>
    <link href="<?php echo HTTP_SERVER.DIR_CSS?>blockui.css" rel="stylesheet">
    <script src="<?php echo HTTP_SERVER.DIR_JS?>jquery-ui.js"></script>
    <link href="<?php echo HTTP_SERVER.DIR_CSS?>jquery-ui.css" rel="stylesheet">
   	<script language="javascript">
	var HTTP_SERVER = '<?php echo HTTP_SERVER?>';
	var loading = '<center id="loading"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>loading.gif"></center>';
	</script>
    <script src="<?php echo HTTP_SERVER.DIR_JS?>common.js"></script>
    <script src="<?php echo HTTP_SERVER.DIR_JS?>cart.js"></script>
</head>

<body>

    <!-- Navigation -->
    <?php echo $header?>

    <!-- Page Content -->
    <div class="container">
        <?php echo $content?>
    </div>
    <!-- /.container -->

    <div class="container">

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    

    <!-- Bootstrap Core JavaScript -->
    <script src="<?php echo HTTP_SERVER.DIR_JS?>bootstrap.js"></script>
    <script src="<?php echo HTTP_SERVER.DIR_JS?>menu.js"></script>
</body>

</html>
