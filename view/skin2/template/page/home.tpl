<div class="ben-three-columns">
	<?php if(count($leftsitebar)){ ?>
	<div class="ben-sidebar ben-left">
    	<?php foreach($leftsitebar as $item){ ?>
        <?php echo $item?>
        <?php } ?>
    </div>
    <?php } ?>
	<div class="ben-right" id="ben-maincontent">
    	<div class="ben-section">
        
        	<div class="ben-section-title"><?php echo $brand?></div>
            
            <div class="ben-section-content">
            	<img src="<?php echo HTTP_SERVER.DIR_IMAGE.'banner-thongbao.jpg'?>" width="767px"/>
            		<?php echo $bannerhome?>
                
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
<?php foreach($arrbrand as $key => $brand){?>
<script language="javascript">
pageload.arr.push("<?php echo $brand?>");
</script>
<?php }?>
<?php foreach($arrsitemapid as $key => $sitemapid){?>
<script language="javascript">
pageload.arr.push("<?php echo $sitemapid?>");
</script>
<?php }?>
<script language="javascript">
function loadBrand()
{
	if(pageload.flag == true)
	{
		$('#ben-maincontent .ben-section-content').append(loading);
		$.get("?route=page/home/loadBrand&brand="+ pageload.arr[pageload.index],function(html){
				
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
$(document).ready(function(e) {
    loadBrand();
});
$(document).scroll(function(e) {
	if($(document).scrollTop() + window.innerHeight > $('#ben-maincontent .ben-section-content').innerHeight())
	{
		
		loadBrand();
		
		
	}
});
</script>