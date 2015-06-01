<?php
if(count($medias))
{
?>
				<div class="row">
					<?php foreach($medias as $media) {?>
                    <div class="col-sm-3 col-lg-3 col-md-3">
                        <div class="thumbnail">
                        	<?php if($media['discountpercent']){ ?>
                            <div class="flagdiscount">-<?php echo $this->string->numberFormate($media['discountpercent'])?>%</div>
                            <?php } ?>
                            <a href="<?php echo $media['link']?>" title="<?php echo $this->document->productName($media)?>"><img src='<?php echo $media['imagethumbnail']?>' alt="<?php echo $this->document->productName($media)?>" title="<?php echo $this->document->productName($media)?>"/></a>
                            
                            <div class="caption">
                                
                                <h4><a href="<?php echo $media['link']?>" title="<?php echo $this->document->productName($media)?>"><?php echo $this->document->productName($media)?></a>
                                </h4>
                                <center>
                                <?php if(count($media['childs'])){ ?>
                                <?php foreach($media['childs'] as $me){?>
                                <h4>
                                    <?php echo $me['sizes']?>:
                                    
                                    <?php $cls = '';?>
                                    <?php if($me['pricepromotion']) $cls = 'product-price-no'; else $cls = 'product-pricepromotion'?>
                                   
                                    
                                    <span class="<?php echo $cls?>" >
                                        <?php if($me['price']){?>
                                        <?php echo $this->string->numberFormate($me['price'])?><?php echo $this->document->setup['Currency']?>
                                        <?php }else{ ?>
                                        Giá đang cập nhật
                                        <?php } ?>
                                    </span>
                                    <?php if($me['pricepromotion']){ ?>
                                    <span class="product-pricepromotion">
                                    <?php echo $this->string->numberFormate($me['pricepromotion'])?><?php echo $this->document->setup['Currency']?>
                                    <?php if($me['noteprice']!=""){ ?>
                                    (<?php echo $me['noteprice']?>)
                                    <?php }?>
                                    </span>
                                    <?php } ?>
                                    
                                </h4>
                                <?php } ?>
                                <?php }else{ ?>
                                <?php if($media['pricepromotion']!=0){ ?>
                                <h4 align="center" class="product-pricepromotion">
                                        
                                        <?php if($media['pricepromotion']){ ?>
                                        <?php $cls = 'product-price-no';?>
                                        <?php echo $this->string->numberFormate($media['pricepromotion'])?><?php echo $this->document->setup['Currency']?>
                                        <?php } ?>
                                        <?php if($media['noteprice']!=""){ ?>
                                        (<?php echo $media['noteprice']?>)
                                        <?php }?>
                                </h4>
                                <?php } ?>
                                <h4 align="center" class="product-price <?php echo $cls?>">
                                    <?php if($media['price']){?>
                                    <?php echo $this->string->numberFormate($media['price'])?><?php echo $this->document->setup['Currency']?>
                                    <?php if($media['noteprice']!="" && $media['pricepromotion'] == 0 ){ ?>
                                    (<?php echo $media['noteprice']?>)
                                    <?php }?>
                                    <?php }else{ ?>
                                    Giá đang cập nhật
                                    <?php } ?>
                                </h4>
                                <?php } ?>
                                </center>
                            </div>
                            
                        </div>
                    </div>
					<?php } ?>
                    

                </div>

				<?php echo $pager?>
<?php
}
?>
