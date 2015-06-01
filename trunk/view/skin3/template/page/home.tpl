		<div class="row">

            

            <div id="ben-maincontent" class="col-md-12">

                <?php echo $bannerhome?>

                

            </div>

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
		$('#ben-maincontent').append(loading);
		$.get("?route=page/home/loadBrand&brand="+ pageload.arr[pageload.index],function(html){
				
				$('#loading').remove();
				$('#ben-maincontent').append(html);
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
		$('#ben-maincontent').append(loading);
		$.get("?route=page/home/loadGroup&sitemapid="+ pageload.arr[pageload.index],function(html){
				
				$('#loading').remove();
				$('#ben-maincontent').append(html);
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
	if($(document).scrollTop() + window.innerHeight > $('#ben-maincontent').innerHeight())
	{
		
		loadBrand();
		
		
	}
});
</script>