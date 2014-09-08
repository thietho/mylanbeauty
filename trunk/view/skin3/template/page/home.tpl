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
function LoadPage()
{
	this.arr = new Array();
	this.index = 0;
	this.flag = true;
}
var pageload = new LoadPage();
</script>
<?php foreach($arrsitemapid as $key => $sitemapid){?>
<script language="javascript">
pageload.arr.push("<?php echo $sitemapid?>");
</script>
<?php }?>
<script language="javascript">
function loadGroup()
{
	if(pageload.flag == true)
	{
		$('#ben-maincontent .ben-section-content').append(loading);
		$.get("?route=page/home/loadGroup&sitemapid="+ pageload.arr[pageload.index],function(html){
				
				$('#loading').remove();
				$('#ben-maincontent .ben-section-content').append(html);
				//stickytooltip.init("*[data-tooltip]", "mystickytooltip")
				pageload.index++;
				if(pageload.index >= pageload.arr.length)
				{
					$('#btn-XemTiep').remove();
					
				}
				pageload.flag = true;
				//console.log("aa"+pageload.flag);
				
			});
	}
	pageload.flag = false;
}

$(document).scroll(function(e) {
	if($(document).scrollTop() + window.innerHeight > $('#ben-maincontent .ben-section-content').innerHeight())
	{
		
		loadGroup();
		
		
	}
});
</script>