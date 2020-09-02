<div id="hl-page-sileder">
    <h3 class="ui-bar ui-bar-a footerbrand">Các thương hiệu</h3>
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
    <h3 class="ui-bar ui-bar-a footermenu">Các chuyên mục</h3>
    <div>
        <ul id="hl-sitemap">
            <li><a href="<?php echo HTTP_SERVER?>" data-transition="fade">Trang chủ</a></li>
            <li><a href="<?php echo @$this->document->createLink('gioithieu')?>" title="Giới thiệu" data-transition="fade">Giới thiệu</a></li>
            <li><a href="<?php echo @$this->document->createLink('tin-tuc')?>" title="Tin tức" data-transition="fade">Tin tức</a></li>
            <li><a href="<?php echo @$this->document->createLink('khuyen-mai')?>" title="Khuyến mãi" data-transition="fade">Khuyến mãi</a></li>
            <li><a href="<?php echo @$this->document->createLink('lienhe')?>" title="Liên hệ" data-ajax="false">Liên hệ</a></li>
            <li><a href="<?php echo @$this->document->createLink('cach-thuc-mua-hang')?>" title="Cách thức mua hàng" data-transition="fade">Cách thức mua hàng</a></li>
            <li><a href="<?php echo @$this->document->createLink('cart')?>" title="Giỏ hàng" data-transition="fade">Giỏ hàng</a></li>
            <li><a href="<?php echo @$this->document->createLink('ortherbrand')?>" data-transition="fade">Các nhãn hiệu khác</a></li>
            <?php if(!$this->member->isLogged()){?>
            <li><a href="<?php echo @$this->document->createLink('login')?>" title="Đăng nhập" data-ajax="false">Đăng nhập</a></li>
            <li><a href="<?php echo @$this->document->createLink('register')?>" title="Đăng ký" data-ajax="false">Đăng ký</a></li>
            
            <?php }else{ ?>
            <li><a href="<?php echo @$this->document->createLink('member')?>" title="Thông tin thành viên" data-transition="fade"><?php echo @$this->member->data['fullname']?></a></li>
            <li><a href="#" onclick="logout()" title="Đăng xuất" data-ajax="false">Đăng xuất</a></li>
                
              
            <?php }?>
            
        </ul>
    </div>
    <h3 class="ui-bar ui-bar-a footercategories">Danh mục sản phẩm</h3>
    <div>
        <ul id="hl-categories">
            <?php foreach($sitemaps as $sitemap){ ?>
                <?php if(@$sitemap['countchild'] == 0){ ?>
            <li><a href="<?php echo @$this->document->createLink($sitemap['sitemapid'])?>" title="<?php echo @$sitemap['sitemapname']?>" data-transition="fade"><?php echo @$sitemap['sitemapname']?></a></li>
                <?php } ?>
            <?php } ?>
        </ul>
    </div>
</div>
<div data-role="footer" data-position="fixed" data-tap-toggle="false" class="jqm-footer">
	<p>
    	Website Design by <a href="http://mylanbeauty.net/">mylanbeauty.net</a>
   		

    </p>
    <p>
   		Địa chỉ: Hà Đô Centrosa Garden Tháp Iris 1 đường Cao Thắng P12 Q10 Tp.HCM
        <strong>Hotline: 0903 76 75 80 - 0906 965 338</strong>
    </p>
</div>