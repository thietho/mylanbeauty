

    
    	<div class="ui-grid-c hl-brand">
        <?php $key = 0?>
        <?php $arr = array('a','b','c','d')?>
        <?php foreach($brandother as $item){ ?>
        	
            <div class="ui-block-<?php echo $arr[$key%4]?>">
                <a href="<?php echo $this->document->createLink('brand',$item['categoryid'])?>" data-ajax="false"><?php echo $item['categoryname']?></a>
            </div>
            <?php $key++?>
            
            
        
        <?php } ?>
        </div>
        
   
