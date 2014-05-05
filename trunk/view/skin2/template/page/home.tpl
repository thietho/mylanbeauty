<div class="ben-three-columns">
	<?php if(count($leftsitebar)){ ?>
	<div class="ben-sidebar ben-left">
    	<?php foreach($leftsitebar as $item){ ?>
        <?php echo $item?>
        <?php } ?>
    </div>
    <?php } ?>
	<div class="ben-left" id="ben-maincontent">
    	<div class="ben-section">
        
        	<div class="ben-section-title"><?php echo $brand?></div>
            
            <div class="ben-section-content">
            	<a href="https://www.facebook.com/photo.php?fbid=191867867667323&set=a.179182488935861.1073741831.160652660788844&type=1&theater" target="_blank"><img src="<?php echo HTTP_SERVER.DIR_IMAGE.'banner.jpg'?>" width="767px"/></a>
            	<?php echo $bannerhome?>
                <?php foreach($producthome as $key => $item){ ?>
                <?php if($item['data']){ ?>
                <h1><?php echo $item['title']?></h1>
            	<?php echo $item['data']?>
                <?php } ?>
                <?php } ?>
            </div>
            <center><input type="button" id="btn-XemTiep" class="ben-button" value="Xem tiếp"/></center>
            
        	
        </div>
    </div>
    <?php if(count($rightsitebar)){ ?>
    <div class="ben-sidebar ben-right">
    	<?php foreach($rightsitebar as $item){ ?>
        <?php echo $item?>
        <?php } ?>
    </div>
    <?php } ?>
    <div class="clearer">&nbsp;</div>

</div>
<script language="javascript">
$('#btn-XemTiep').click(function(e) {
    $('#ben-maincontent .ben-section-content').append(loading);
	$.get("?route=page/home/loadGroup&sitemapid=my-pham-danh-cho-nam",function(html){
			
			$('#loading').remove();
			$('#ben-maincontent .ben-section-content').append(html);
		});
});
</script>