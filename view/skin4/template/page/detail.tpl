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
                    <a href="<?php echo $this->document->createLink('brand','Sisley')?>" data-transition="flip"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/Sisley.jpg" /></a>
                </div>
                <div class="ui-block-b">
                    <a href="<?php echo $this->document->createLink('brand','Guerlain')?>" data-transition="flip"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/Guerlain.jpg" /></a>
                </div>
                <div class="ui-block-c">
                    <a href="<?php echo $this->document->createLink('brand','Lancome')?>" data-transition="flip"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/Lancome.jpg" /></a>
                </div>
                
                
                
            </div>
            <div class="ui-grid-b hl-brand">
            	<div class="ui-block-a">
                    <a href="<?php echo $this->document->createLink('brand','Clarins')?>" data-transition="flip"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/Clarins.jpg" /></a>
                </div>
                <div class="ui-block-b">
                    <a href="<?php echo $this->document->createLink('brand','Shiseido')?>" data-transition="flip"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/Shiseido.jpg" /></a>
                </div>
                <div class="ui-block-c">
                    <a href="<?php echo $this->document->createLink('brand','EsteeLauder')?>" data-transition="flip"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/EsteeLauder.jpg" /></a>
                </div>
                
            </div>
            
            <div class="ui-grid-b hl-brand">
                <div class="ui-block-a">
                    <a href="<?php echo $this->document->createLink('brand','Clinique')?>" data-transition="flip"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/Clinique.jpg" /></a>
                </div>
                <div class="ui-block-b">
                    <a href="<?php echo $this->document->createLink('brand','ElizabethArden')?>" data-transition="flip"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/ElizabethArden.jpg" /></a>
                </div>
                <div class="ui-block-c">
                    <a href="<?php echo $this->document->createLink('ortherbrand')?>" data-transition="flip"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo/Other.png" /></a>
                </div>
            </div>
            <h1 class="hl-breadcrumb"><?php echo $this->document->breadcrumb?></h1>
            
            <?php echo $module?>
<script language="javascript">
$(document).ready(function(e) {
    setTimeout('goBreadcrumb();',2000);
});
$(document).bind("pagehide", function(event, ui) {
  $(ui.nextPage).animationComplete(function() {
    //alert('Animation completed');
	
	goBreadcrumb()
  });
});
</script>            

            

