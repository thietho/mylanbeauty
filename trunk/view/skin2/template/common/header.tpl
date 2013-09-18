<div id="ben-header">
    <div id="ben-top">
    	<div class="ben-left" id="ben-logo">
            <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo.png" alt="" />
        </div>
        <div id="ben-mainmenu">
        	<a href="<?php echo HTTP_SERVER?>">Trang chủ</a>
            | <a href="<?php echo $this->document->createLink('lienhe')?>">Liên hệ</a>
            | <a href="<?php echo $this->document->createLink('lienhe')?>">Liên hệ</a>
            | <a href="<?php echo $this->document->createLink('cart')?>">Giỏ hàng</a>
            <?php if(!$this->member->isLogged()){?>
            | <a href="<?php echo $this->document->createLink('login')?>">Đăng nhập</a>
            | <a href="<?php echo $this->document->createLink('register')?>">Đăng ký</a>
            <?php }else{ ?>
            | <a href="<?php echo $this->document->createLink('member')?>"><?php echo $this->document->getUser($this->member->getUserName())?></a>
            | <a href="#" onclick="logout()">Đăng xuất</a>
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
        <div style="position:absolute;width:755px;text-align:center;margin-top:34px;margin-left:240px">
        	<h2>SẢN PHẨM ĐANG TIẾP TỤC CẬP NHẬT</h2>
        </div>
        <div class="ben-navigation">
    
            <ul id="ben-main-nav">
            	<li><a href="<?php echo HTTP_SERVER?>">Trang chủ</a></li>
                <li><a href="<?php echo $this->document->createLink('gioithieu')?>">Giới thiệu</a></li>
                <?php echo $mainmenu?>
                
            </ul>
    
            <div class="clearer">&nbsp;</div>
    
        </div>
        
    </div>
</div>

<script src="<?php echo HTTP_SERVER.DIR_JS?>menu.js" language="javascript"></script>
