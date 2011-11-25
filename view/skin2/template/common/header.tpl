<div id="ben-header">
    <div id="ben-top">
    	<div class="ben-left" id="ben-logo">
            <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo.png" alt="" />
        </div>
        <div id="ben-mainmenu">
        	<a href="<?php echo HTTP_SERVER?>">Trang chủ</a>
            | <a href="<?php echo HTTP_SERVER?>site/<?php echo $this->member->getSiteId()?>/lienhe">Liên hệ</a>
            | <a href="<?php echo HTTP_SERVER?>site/<?php echo $this->member->getSiteId()?>/cart">Giỏ hàng</a>
    	</div>
        <!--<div class="ben-left" id="ben-site-title">
        	<h1>Website đang hoàng thiện <br />và tiếp tục cập nhật sản phẩm mới liên tục</h1>
            <h1><?php echo $this->document->setup['Slogan']?></h1>
        </div>-->
        
        <div id="ben-header-support" class="ben-right">
        	<?php echo $supportonline?>
        </div>
        <div class="clearer">&nbsp;</div>
        
        <div class="ben-navigation">
    
            <ul id="ben-main-nav">
            	<li><a href="<?php echo HTTP_SERVER?>">Trang chủ</a></li>
                <li><a href="<?php echo HTTP_SERVER?>site/<?php echo $this->member->getSiteId()?>/gioithieu">Giới thiệu</a></li>
                <?php echo $mainmenu?>
                <li><a href="<?php echo HTTP_SERVER?>site/<?php echo $this->member->getSiteId()?>/khuyenmai">Khuyến mãi</a></li>
            </ul>
    
            <div class="clearer">&nbsp;</div>
    
        </div>
        
    </div>
</div>

<script src="<?php echo HTTP_SERVER.DIR_JS?>menu.js" language="javascript"></script>
