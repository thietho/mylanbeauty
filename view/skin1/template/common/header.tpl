<div id="ben-header">
    <div id="ben-top">
        <div id="ben-mainmenu">
        	<a href="<?php echo HTTP_SERVER?>">Trang chủ</a>
            | <a href="<?php echo HTTP_SERVER?>site/<?php echo $this->member->getSiteId()?>/gioithieu">Giới thiệu</a>
            | <a href="<?php echo HTTP_SERVER?>site/<?php echo $this->member->getSiteId()?>/lienhe">Liên hệ</a>
            | Giời mở cửa: Thứ 2 đến Chủ nhật - 9h đến 21h30
    	</div>
        <div class="ben-left" id="ben-site-title">
            <h1><?php echo $this->document->setup['Slogan']?></h1>
        </div>
        <div id="ben-header-support" class="ben-right">
        	<?php echo $supportonline?>
        </div>
        <div class="clearer">&nbsp;</div>
        
        <!--<div class="ben-navigation">
    
            <ul id="ben-main-nav">
                <?php echo $mainmenu?>
            </ul>
    
            <div class="clearer">&nbsp;</div>
    
        </div>-->
        
    </div>
</div>

<script src="<?php echo HTTP_SERVER.DIR_JS?>menu.js" language="javascript"></script>
