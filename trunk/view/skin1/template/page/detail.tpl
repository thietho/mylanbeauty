<div class="ben-three-columns">
	<?php if(count($leftsitebar)){ ?>
	<div class="ben-sidebar ben-left">
    	<?php foreach($leftsitebar as $item){ ?>
        <?php echo $item?>
        <?php } ?>
    </div>
    <?php }?>
	<div class="ben-left" id="ben-maincontent">
    	<div class="ben-section">
        
        	<div class=" ben-section-title">
            	<?php echo $this->document->breadcrumb?>
            </div>
            
            <div class="ben-section-content">
            
            	<?php echo $module?>
            
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
