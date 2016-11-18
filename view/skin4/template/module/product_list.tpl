<?php
if(@count($medias))
{
	
?>
			<div class="ui-grid-a ui-responsive product-list">
					<?php foreach($medias as $key => $media) { ?>
                    
                    <?php 
                    $block = "ui-block-a";
                    if(@$key%2 != 0)
                    	$block = "ui-block-b";
                    ?>
                <div class="<?php echo @$block?>">
                    <div class="jqm-block-content">
                        
                        <p class="title">
                        	<a href="<?php echo @$media['link']?>" title="<?php echo @$this->document->productName($media)?>" data-transition="fade" data-ajax="false">
                            <?php 
                            	$productname = $media['title'];
                                if(@$media['code'])
                                    $productname .= "<strong> - ".$media['code']."</strong>";
                                if(@$media['sizes'])
                                    $productname .= " <strong>".$media['sizes']."</strong>";
                                if(@$media['color'])
                                    $productname .= " <strong>".$media['color']."</strong>";
                                echo $productname;
                            ?>
                            
                            <strong><?php if(@$media['brand']) echo $this->document->getCategory($media['brand'])?></strong></a>
                        </p>
                        <?php if(@$media['discountpercent']){ ?>
                        <div class="flagdiscount">-<?php echo @$this->string->numberFormate($media['discountpercent'])?>%</div>
                        <?php } ?>
                        <a href="<?php echo @$media['link']?>" title="<?php echo @$this->document->productName($media)?>" data-transition="fade" data-ajax="false"><img class="lazy" data-src='<?php echo @$media['imagethumbnail']?>' title="<?php echo @$this->document->productName($media)?>"/></a>
                        <div class="price-group">
                        	<?php if(@count($media['childs']) && $media['displaytype']==''){ ?>
                                <?php $ispromotion = 0;?>
                            	<?php foreach($media['childs'] as $me){ ?>
                                <?php
                                        $str = '';
                                        $strclose = '';
                                        $cls = '';
                                        $pos = strpos($me['groupkeys'],'[promotion]');
                                        if($pos === false)
                                        {

                                        }
                                        else
                                        {
                                            $ispromotion = 1;
                                            $cls = $media['mediaid']."-promotion hideprice";
                                            $str = '<span class="shop">*</span>(';
                                            $strclose = ')';
                                        }
                                    ?>
                                	<p class="price <?php echo $cls?>">

                                    <?php echo $str.@$me['sizes']?>
                                    <?php 
                                    //if(@$me['color'])
                                        //echo " ".$me['color'];
                                    ?>:
                                    <?php if(@$me['price'] == 0){ ?>
                                    	Giá đang cập nhật
                                    <?php }else{ ?>
                                    	
                                    	<?php if(@$me['pricepromotion'] == 0){ ?>
                                        	<span class="shop"><?php echo @$this->string->numberFormate($me['price'])?><?php echo @$this->document->setup['Currency']?></span>
                                        <?php }else{ ?>
                                        	
                                        	<span class="genuine"><?php echo @$this->string->numberFormate($me['price'])?><?php echo @$this->document->setup['Currency']?></span>
                                            -
                                    		<span class="shop"><?php echo @$this->string->numberFormate($me['pricepromotion'])?><?php echo @$this->document->setup['Currency']?></span><?php echo $strclose?>
                                        <?php } ?>
                                    <?php } ?>

                                    </p>

                                <?php } ?>
                            <?php } ?>
                            <?php if(@count($media['childs'])==0 || $media['displaytype']=='compact'){ ?>
                            	<?php if(@count($media['childs'])==0){ ?>
                                    <?php if(@$media['price'] == 0){ ?>
                                        <p class="price">Giá đang cập nhật</p>
                                    <?php }else{ ?>
                                        <?php if(@$media['pricepromotion']==0){ ?>
                                            <p class="price"><span class="shop"><?php echo @$this->string->numberFormate($media['price'])?><?php echo @$this->document->setup['Currency']?></span></p>
                                        <?php }else{ ?>
                                            <p class="price"><span class="genuine"><?php echo @$this->string->numberFormate($media['price'])?><?php echo @$this->document->setup['Currency']?></span>
                                            
                                            <span class="shop"><?php echo @$this->string->numberFormate($media['pricepromotion'])?><?php echo @$this->document->setup['Currency']?></span></p>
                                        <?php } ?>
                                    <?php } ?>
                                <?php }else{
                                	@$data_price = array();
                                    foreach($media['childs'] as $me)
                                    {
                                        if(!isset($data_price[@$me['sizes']]))
                                        {
                                        	if($me['price'] == 0)
                                            	@$data_price[$me['sizes']]['price'] = 'Giá đang cập nhật';
                                            else
                                            	@$data_price[$me['sizes']]['price'] = $this->string->numberFormate($me['price']).@$this->document->setup['Currency'];
                                            @$data_price[$me['sizes']]['pricepromotion'] = $this->string->numberFormate($me['pricepromotion']).@$this->document->setup['Currency'];
                                        }
                                    }
                                    foreach($data_price as $size => $price)
                                    {
                                    	$str = $size.' : ';
                                        if($size == '')
                                    		$str ='';
                                    	if($price['pricepromotion']==0)
                                    		echo '<p class="price">'.$str.'<span class="shop">'.$price['price'].'</span></p>';
                                         else
                                         	echo '<p class="price">'.$str.'<span class="genuine">'.$price['price'].'</span> - <span class="shop">'.$price['pricepromotion'].'</span></p>';
                                    }
                                }
                                    
                                ?>
                                <center>
                                <?php foreach($media['childs'] as $me){ ?>
                                	<?php if(@$me['colorcode']!=''){ ?>
                                    
                                        <img class="hl-color-icon" style="background-color:<?php echo @$me['colorcode']?>">
                                        
                                    
                                    <?php }?>
                                <?php } ?>
                                	
                                </center>
                            <?php } ?>
                            <center>
                            	<a href="<?php echo @$media['link']?>" title="<?php echo @$this->document->productName($media)?>" data-transition="fade" data-ajax="false">Chi tiết</a>
                                <?php if($ispromotion){ ?>
                                <a href="#" style="color: red !important;" class="btnPromotion" mediaid="<?php echo $media['mediaid']?>">*Khuyến mãi</a>
                                <div id="<?php echo $media['mediaid']?>-promotion" style="display: none"></div>
                                <?php } ?>
                            </center>
                        </div>
                    </div>
                </div>
					<?php } ?>
			</div>

				
<?php
}
?>
<script type="text/javascript">


$(document).ready(function(e) {
    loadLazy();
    $('.btnPromotion').click(function(){
        var str = "";
        var mediaid = $(this).attr('mediaid');
        $('.'+mediaid+"-promotion").each(function(){
            str += $(this).html()+"<br>";
        });
        $('#'+mediaid+"-promotion").html(str).toggle();
    });
});
	  
</script>