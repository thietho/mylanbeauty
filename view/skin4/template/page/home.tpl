			<table class="hl-header">
                <tr>
                    <td><h1 onClick="goBottom()">CÁC THƯƠNG HIỆU</h1></td>
                    <td align="center"><h1 onClick="goMenu()">CÁC CHUYÊN MỤC</h1></td>
                    <td align="right"><h1 onClick="goCat()">DANH MỤC SẢN PHẨM</h1></td>
                </tr>
            </table>
            
            
            
            <div style="clear:both;height:0.5em"></div>
            <div class="ui-grid-b hl-brand">
                <div class="ui-block-a">
                    <a href="<?php echo @$this->document->createLink('brand','Sisley')?>" data-transition="fade"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/Sisley.jpg" /></a>
                </div>
                <div class="ui-block-b">
                    <a href="<?php echo @$this->document->createLink('brand','Guerlain')?>" data-transition="fade"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/Guerlain.jpg" /></a>
                </div>
                <div class="ui-block-c">
                    <a href="<?php echo @$this->document->createLink('brand','Lancome')?>" data-transition="fade"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/Lancome.jpg" /></a>
                </div>
                
                
                
            </div>
            <div class="ui-grid-b hl-brand">
            	<div class="ui-block-a">
                    <a href="<?php echo @$this->document->createLink('brand','Clarins')?>" data-transition="fade"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/Clarins.jpg" /></a>
                </div>
                <div class="ui-block-b">
                    <a href="<?php echo @$this->document->createLink('brand','Shiseido')?>" data-transition="fade"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/Shiseido.jpg" /></a>
                </div>
                <div class="ui-block-c">
                    <a href="<?php echo @$this->document->createLink('brand','EsteeLauder')?>" data-transition="fade"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/EsteeLauder.jpg" /></a>
                </div>
                
            </div>
            
            <div class="ui-grid-b hl-brand">
                <div class="ui-block-a">
                    <a href="<?php echo @$this->document->createLink('brand','Clinique')?>" data-transition="fade"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/Clinique.jpg" /></a>
                </div>
                <div class="ui-block-b">
                    <a href="<?php echo @$this->document->createLink('brand','ElizabethArden')?>" data-transition="fade"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/ElizabethArden.jpg" /></a>
                </div>
                <div class="ui-block-c">
                    <a href="<?php echo @$this->document->createLink('ortherbrand')?>" data-transition="fade"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/Other.png" /></a>
                </div>
            </div>
            <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>bannerShop3.jpg">
            <?php echo @$bannerhome?>
            
            <div id="hl-home">
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
pageload.arr.push("<?php echo @$brand?>");
</script>
<?php }?>
<?php foreach($arrsitemapid as $key => $sitemapid){?>
<script language="javascript">
pageload.arr.push("<?php echo @$sitemapid?>");
</script>
<?php }?>
<script language="javascript">
function loadBrand()
{
	if(pageload.flag == true)
	{
		$('#hl-home').append(loading);
		$.get("?route=page/home/loadBrand&brand="+ pageload.arr[pageload.index],function(html){
				
				$('#loading').remove();
				$('#hl-home').append(html);
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
		$('#hl-home').append(loading);
		$.get("?route=page/home/loadGroup&sitemapid="+ pageload.arr[pageload.index],function(html){
				
				$('#loading').remove();
				$('#hl-home').append(html);
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
/*$(document).scroll(function(e) {
	if($(document).scrollTop() + window.innerHeight > $('#hl-home').innerHeight())
	{
		
		loadBrand();
		
		
	}
});*/
</script>            
    