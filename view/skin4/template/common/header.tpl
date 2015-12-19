
	<div class="hl-control goTop" onClick="goTop()"></div>
    <!--<div class="hl-control goReturn" onClick="goReturn()"></div>-->
    <div class="hl-control goBottom" onClick="goBottom()"></div>
	
		
		<img class="banner_top" width="100%" src="<?php echo HTTP_SERVER.DIR_IMAGE?>banner_top.png">
        
        <div data-role="header" class="jqm-header">
        	<div class="header-info">
            	<table width="100%">
                	<tr>
                    	<td><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>hearder_address.png" alt="164 Bàn Cờ, Phường 3, Quận 3, Tp HCM" title="164 Bàn Cờ, Phường 3, Quận 3, Tp HCM"></td>
                        <td align="right"><img  src="<?php echo HTTP_SERVER.DIR_IMAGE?>hearder_hotline.png" alt="0903 767 580 - 0906 83 69 93" title="0903 767 580 - 0906 83 69 93"></td>
                    </tr>
                </table>
            	
                
            </div>
            
            <h2><a href="<?php echo HTTP_SERVER?>" data-transition="fade"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo.png" alt="Mỹ Lan Beauty"></a></h2>
        	<div id="supportonline" class="supportonline">
        	<a href="ymsgr:sendIM?mylanbeauty"><img border="0" height="16" src="http://opi.yahoo.com/online?u=mylanbeauty&amp;m=g&amp;t=1" width="64"></a> <a href="https://www.facebook.com/mylanbeauty.net" target="_blank"><img src="http://mylanbeauty.net/file/upload/icon/facebook-icon.png"></a> <a href="skype:nv_lantran?chat" onclick="return skypeCheck();"><img src="http://mylanbeauty.net/file/upload/icon/skype.png"></a></div>
            <a href="#" class="jqm-navmenu-link ui-btn ui-btn-icon-notext ui-corner-all ui-icon-bars ui-nodisc-icon ui-alt-icon ui-btn-left">Menu</a>
            
        </div>
        <a href="<?php echo @$this->document->createLink('searchproduct')?>" data-ajax="false" class="ui-btn ui-btn-icon-notext ui-corner-all ui-icon-search ui-nodisc-icon ui-alt-icon hl-search">Search</a>
        <!--Menu-->
<div data-role="panel" class="jqm-navmenu-panel" data-position="left" data-display="overlay" data-theme="a">
    <ul class="jqm-list ui-alt-icon ui-nodisc-icon">
    	<li data-icon="home"><a href="<?php echo HTTP_SERVER?>" data-transition="fade">Trang chủ</a></li>
    	<li><a href="<?php echo @$this->document->createLink('gioithieu')?>" title="Giới thiệu" data-transition="fade">Giới thiệu</a></li>
   		<li><a href="<?php echo @$this->document->createLink('tin-tuc')?>" title="Tin tức" data-transition="fade">Tin tức</a></li>
        <li><a href="<?php echo @$this->document->createLink('khuyen-mai')?>" title="Khuyến mãi" data-transition="fade">Khuyến mãi</a></li>
        <li><a href="<?php echo @$this->document->createLink('lienhe')?>" title="Liên hệ" data-ajax="false">Liên hệ</a></li>
        <li><a href="<?php echo @$this->document->createLink('cach-thuc-mua-hang')?>" title="Cách thức mua hàng" data-transition="fade">Cách thức mua hàng</a></li>
    	<li><a href="<?php echo @$this->document->createLink('cart')?>" title="Giỏ hàng" data-transition="fade">Giỏ hàng</a></li>
        <?php if(!$this->member->isLogged()){?>
        <li><a href="<?php echo @$this->document->createLink('login')?>" title="Đăng nhập" data-ajax="false">Đăng nhập</a></li>
        <li><a href="<?php echo @$this->document->createLink('register')?>" title="Đăng ký" data-ajax="false">Đăng ký</a></li>
        
        <?php }else{ ?>
        <li><a href="<?php echo @$this->document->createLink('member')?>" title="Thông tin thành viên" data-transition="fade"><?php echo @$this->member->data['fullname']?></a></li>
        <li><a href="#" onclick="logout()" title="Đăng xuất" data-ajax="false">Đăng xuất</a></li>
            
          
        <?php }?>
    	<li data-role="collapsible" data-enhanced="true" data-collapsed-icon="carat-d" data-expanded-icon="carat-u" data-iconpos="right" data-inset="false" class="ui-collapsible ui-collapsible-themed-content ui-collapsible-collapsed">
            <h3 class="ui-collapsible-heading ui-collapsible-heading-collapsed">
                <a href="#" class="ui-collapsible-heading-toggle ui-btn ui-btn-icon-right ui-btn-inherit ui-icon-carat-d">
                    Danh mục<span class="ui-collapsible-heading-status"> click to expand contents</span>
                </a>
            </h3>
            <div class="ui-collapsible-content ui-body-inherit ui-collapsible-content-collapsed" aria-hidden="true">
                <ul>
                	<?php echo @$mainmenu?>
                </ul>
            </div>
    	</li>
    	<li data-role="collapsible" data-enhanced="true" data-collapsed-icon="carat-d" data-expanded-icon="carat-u" data-iconpos="right" data-inset="false" class="ui-collapsible ui-collapsible-themed-content ui-collapsible-collapsed">
            <h3 class="ui-collapsible-heading ui-collapsible-heading-collapsed">
                <a href="#" class="ui-collapsible-heading-toggle ui-btn ui-btn-icon-right ui-btn-inherit ui-icon-carat-d">
                    Nhãn hiệu<span class="ui-collapsible-heading-status"> click to expand contents</span>
                </a>
            </h3>
            <div class="ui-collapsible-content ui-body-inherit ui-collapsible-content-collapsed" aria-hidden="true">
                <ul>
                	<?php echo @$brand?>
                </ul>
            </div>
    	</li> 
	</ul>
</div>

<script language="javascript">

$(document).ready(function(e) {
    setControl();
	
	
	
});
var pcurr = 0;
function setControl()
{
	/*var hcontrol = $('.goReturn').height() /2 ;
	$('.goReturn').css('top',(window.innerHeight/2 - hcontrol)+'px');*/
	/*var hcontrol = $('.hl-control').height() ;
	$('.hl-control').css('top',(window.innerHeight - hcontrol)+'px');*/
	/*var top = 0;
	//alert($('.ui-icon-search').position().top);
	$('.supportonline').each(function(index, element) {
		
        if($(this).position().top>0);
		{
			top =$(this).position().top - 50;
			
		}
    });
	$('.hl-control').css('top', top+'px');*/
	
	
}

function goTop()
{
	pcurr = $(document).scrollTop();
	$(document).scrollTop(0);
	 
}
function goBottom()
{
	$('.footerbrand').each(function(index, element) {
		if($(this).position().top>0);
		{
			posdown =$(this).position().top;
			
			
		}
	});
	
	pcurr = $(document).scrollTop();
	$(document).scrollTop(posdown);
		
	
}
function goCat()
{
	$('.footercategories').each(function(index, element) {
		if($(this).position().top>0);
		{
			posdown =$(this).position().top;
			
			
		}
	});
	
	pcurr = $(document).scrollTop();
	$(document).scrollTop(posdown);
}
function goMenu()
{
	$('.footermenu').each(function(index, element) {
		if($(this).position().top>0);
		{
			posdown =$(this).position().top;
			
			
		}
	});
	
	pcurr = $(document).scrollTop();
	$(document).scrollTop(posdown);
}
function goReturn()
{
	$(document).scrollTop(pcurr);
}
function goBreadcrumb()
{
	
	$('.hl-breadcrumb').each(function(index, element) {
		if($(this).position().top>0);
		{
			posdown =$(this).position().top;
		}
	});
	
	pcurr = $(document).scrollTop();
	$(document).scrollTop(posdown);
	$.mobile.defaultHomeScroll = posdown;
}
$(document).bind("pagehide", function(event, ui) {
  $(ui.nextPage).animationComplete(function() {
    //alert('Animation completed');
	
	setControl()
  });
});

window.addEventListener('resize',setControl);

</script>