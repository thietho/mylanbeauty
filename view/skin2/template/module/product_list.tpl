<?php
if(count($medias))
{
?>
<div id="listpoduct">
	<?php foreach($medias as $media) {?>
    <div class="ben-left product link_hover" data-tooltip="sticky1" ref="<?php echo $media['imagetpreview']?>" title="<?php echo $this->document->productName($media)?>">
        <table>
            <tr class="product-list-image">
                <td>
                	
                	<?php if($media['discountpercent']){ ?>
                	<div class="flagdiscount ben-icon">-<?php echo $this->string->numberFormate($media['discountpercent'])?>%</div>
                    <?php } ?>
                	
                    <?php if($media['imagethumbnail'] !=""){ ?>
                    <a class="islink" href="<?php echo $media['link']?>" title="<?php echo $this->document->productName($media)?>"><img src='<?php echo $media['imagethumbnail']?>' class='ben-center' alt="<?php echo $this->document->productName($media)?>" title="<?php echo $this->document->productName($media)?>"/></a>
                    
                    <?php }?>
                    	
                </td>
            </tr>
            <tr>
                <td>
                    <div align="center">
                    	<a href="<?php echo $media['link']?>" title="<?php echo $this->document->productName($media)?>">
                        	<h6>
                            	<?php echo $media['title']?> - <?php echo $media['code']?>
                                <?php echo $media['brand']?>
                                <?php echo $media['color']?>
                            </h6>
                            
                            
                        </a>
                        <?php if(count($media['childs'])){ ?>
                        <?php foreach($media['childs'] as $me){?>
                        <div>
                        	<?php echo $me['sizes']?>:
                            <?php $cls = '';?>
                            <?php if($me['pricepromotion']) $cls = 'class="product-price-no"'; ?>
                           
                            
                            <span <?php echo $cls?>>
                            	<?php echo $this->string->numberFormate($me['price'])?><?php echo $this->document->setup['Currency']?>
                            </span>
                            <?php if($me['pricepromotion']){ ?>
                            <span class="product-pricepromotion">
                        	<?php echo $this->string->numberFormate($me['pricepromotion'])?><?php echo $this->document->setup['Currency']?>
                            </span>
                            <?php } ?>
                            
                        </div>
                        <?php } ?>
                        <?php } ?>
                    </div>
                    <?php if(count($media['childs'])==0){ ?>
                    <?php $cls = '';?>
                    <?php if($media['pricepromotion']!=0){ ?>
                    <div align="center" class="product-pricepromotion">
                        	
                        	<?php if($media['pricepromotion']){ ?>
                            <?php $cls = 'product-price-no';?>
                        	<?php echo $this->string->numberFormate($media['pricepromotion'])?><?php echo $this->document->setup['Currency']?>
                            <?php } ?>
                            <?php if($media['noteprice']!=""){ ?>
                            (<?php echo $media['noteprice']?>)
                            <?php }?>
                    </div>
                    <?php } ?>
                    <div align="center" class="product-price <?php echo $cls?>">
                    	<?php echo $this->string->numberFormate($media['price'])?><?php echo $this->document->setup['Currency']?>
                        <?php if($media['noteprice']!="" && $media['pricepromotion'] == 0 ){ ?>
                        (<?php echo $media['noteprice']?>)
                        <?php }?>
                    </div>
                        
                    <center>
                    	
                        <?php if($media['noted']!=""){ ?>
                        <em><?php echo $media['noted']?></em>
                        <?php }?>
                    </center>
                    <?php } ?>
                    <div align="center">
                        <a href="<?php echo $media['link']?>" title="<?php echo $media['title']?><?php if($media['code']!="") echo ' - '.$media['code']?>">Chi tiết</a><!-- || <a onclick="cart.add('<?php echo $media['mediaid']?>')">Đặt hàng</a>-->
                    </div>
                </td>
            </tr>
        </table>
        
        
        
        
    </div>
    <?php } ?>
</div>
    


<div class="clearer">&nbsp;</div>
<?php echo $pager?>
<?php
}
?>
