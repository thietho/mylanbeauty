<div class="ben-three-columns">
	<?php if(count($leftsitebar)){ ?>
	<div class="ben-sidebar ben-left">
    	<?php foreach($leftsitebar as $item){ ?>
        <?php echo $item?>
        <?php } ?>
    </div>
    <?php } ?>
	<div class="ben-left" id="ben-maincontent">
    	<div class="ben-section">
        
        	<div class="ben-section-title"><?php echo $brand?></div>
            
            <div class="ben-section-content">
            	<img src="<?php echo HTTP_SERVER.DIR_IMAGE.'banner.jpg'?>" width="767px"/>
            	<?php echo $bannerhome?>
                <?php foreach($producthome as $item){ ?>
                <?php if($item['data']){ ?>
                <h3><?php echo $item['title']?></h3>
            	<?php echo $item['data']?>
                <?php } ?>
                <?php } ?>
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