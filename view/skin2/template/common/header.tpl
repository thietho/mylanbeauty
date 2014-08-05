<div id="ben-header">
    <div id="ben-top">
    	
        <div id="ben-mainmenu">
        	<a href="<?php echo HTTP_SERVER?>" title="Trang chủ">Trang chủ</a>
            | <a href="<?php echo $this->document->createLink('gioithieu')?>" title="Giới thiệu">Giới thiệu</a>
            | <a href="<?php echo $this->document->createLink('tin-tuc')?>" title="Tin tức">Tin tức</a>
            | <a href="<?php echo $this->document->createLink('khuyen-mai')?>" title="Khuyến mãi">Khuyến mãi</a>
            | <a href="<?php echo $this->document->createLink('lienhe')?>" title="Liên hệ">Liên hệ</a>
            | <a href="<?php echo $this->document->createLink('cach-thuc-mua-hang')?>" title="Cách thức mua hàng">Cách thức mua hàng</a>
            | <a href="<?php echo $this->document->createLink('cart')?>" title="Giỏ hàng">Giỏ hàng</a>
            <?php if(!$this->member->isLogged()){?>
            | <a href="<?php echo $this->document->createLink('login')?>" title="Đăng nhập">Đăng nhập</a>
            | <a href="<?php echo $this->document->createLink('register')?>" title="Đăng ký">Đăng ký</a>
            <?php }else{ ?>
            | <a href="<?php echo $this->document->createLink('member')?>" title="Thông tin thành viên"><?php echo $this->document->getUser($this->member->getUserName())?></a>
            | <a href="#" onclick="logout()" title="Đăng xuất">Đăng xuất</a>
            <?php }?>
    	</div>
        <!--<div class="ben-left" id="ben-site-title">
        	<h1>Website đang hoàng thiện <br />và tiếp tục cập nhật sản phẩm mới liên tục</h1>
            <h1><?php echo $this->document->setup['Slogan']?></h1>
        </div>-->
        
        <div id="ben-header-support" class="ben-right">
        	<?php echo $supportonline?>
        </div>
        <div class="clearer">&nbsp;</div>
        <div id="ben-promotion">
        	<img src="<?php echo HTTP_SERVER.DIR_IMAGE?>promotion.png" alt="GIẢM ĐẾN 50% (Cam kết bán hàng chính hãng 100%)" />
        </div>
        <div class="ben-navigation ben-right">
    
            <ul id="ben-main-nav">
            	
                <?php echo $mainmenu?>
                
            </ul>
    
            <div class="clearer">&nbsp;</div>
    
        </div>
        <div class="clearer">&nbsp;</div>
    </div>
</div>

<script src="<?php echo HTTP_SERVER.DIR_JS?>menu.js" language="javascript"></script>
