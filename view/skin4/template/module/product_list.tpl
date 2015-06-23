<?php
if(count($medias))
{
	
?>
			<div class="ui-grid-a ui-responsive product-list">
					<?php foreach($medias as $key => $media) {?>
                    
                    <?php 
                    $block = "ui-block-a";
                    if( $key%2 != 0)
                    	$block = "ui-block-b";
                    ?>
                <div class="<?php echo $block?>">
                    <div class="jqm-block-content">
                        
                        <p class="title">
                        	<a href="<?php echo $media['link']?>" title="<?php echo $this->document->productName($media)?>" data-transition="flip"><?php echo $this->document->productName($media)?>
                            <?php if($media['brand']) echo $this->document->getCategory($media['brand'])?></a>
                        </p>
                        
                        <a href="<?php echo $media['link']?>" title="<?php echo $this->document->productName($media)?>" data-transition="flip"><img src='<?php echo $media['imagethumbnail']?>' alt="<?php echo $this->document->productName($media)?>" title="<?php echo $this->document->productName($media)?>"/></a>
                        <div class="price-group">
                        	<?php if(count($media['childs'])){ ?>
                            	<?php foreach($media['childs'] as $me){?>
                                	<p class="price"><?php echo $me['sizes']?>:
                                    <?php if($me['price'] == 0){ ?>
                                    	Giá đang cập nhật
                                    <?php }else{ ?>
                                    	
                                    	<?php if($me['pricepromotion'] == 0){ ?>
                                        	<span class="shop"><?php echo $this->string->numberFormate($me['price'])?><?php echo $this->document->setup['Currency']?></span>
                                        <?php }else{ ?>
                                        	
                                        	<span class="genuine"><?php echo $this->string->numberFormate($me['price'])?><?php echo $this->document->setup['Currency']?></span>
                                            -<?php echo $this->string->numberFormate($me['discountpercent'])?>%
                                    		<span class="shop"><?php echo $this->string->numberFormate($me['pricepromotion'])?><?php echo $this->document->setup['Currency']?></span>
                                        <?php } ?>
                                    <?php } ?>
                                    </p>
                                <?php } ?>
                            <?php }else{ ?>
                            	<?php if($media['price'] == 0){ ?>
                                	<p class="price">Giá đang cập nhật</p>
                                <?php }else{ ?>
                                	<?php if($media['pricepromotion']==0){ ?>
                                    	<p class="price"><span class="shop"><?php echo $this->string->numberFormate($media['price'])?><?php echo $this->document->setup['Currency']?></span></p>
                                    <?php }else{ ?>
                                    	<p class="price"><span class="genuine"><?php echo $this->string->numberFormate($media['price'])?><?php echo $this->document->setup['Currency']?></span>
                                        Giảm <?php echo $this->string->numberFormate($media['discountpercent'])?>%
                                        <span class="shop"><?php echo $this->string->numberFormate($media['pricepromotion'])?><?php echo $this->document->setup['Currency']?></span></p>
                                    <?php } ?>
                                <?php } ?>
                            <?php } ?>      
                        </div>
                    </div>
                </div>
					<?php } ?>
			</div>

				
<?php
}
?>
