    
    	<div class="ui-grid-c hl-brand">
        <?php $key = 0?>
        <?php $arr = array('a','b','c','d')?>
        <?php foreach($brandother as $item){ ?>
        	
            <div class="ui-block-<?php echo @$arr[$key%4]?>">
            	
                <a href="<?php echo @$this->document->createLink('brand',$item['categoryid'])?>" data-transition="fade" title="<?php echo @$item['categoryname']?>" alt="<?php echo @$item['categoryname']?>"><img src="<?php echo HTTP_SERVER.DIR_IMAGE.'logo/logoorther/'.$item['categoryid'].'.jpg'?>"></a>
                
            </div>
            <?php $key++?>
            
            
        
        <?php } ?>
        </div>