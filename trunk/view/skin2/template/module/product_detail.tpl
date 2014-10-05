<h3><?php echo $sitemap['sitemapname'] ?></h3>

<h2><?php echo $sitemap['breadcrumb']?></h2>
<div class="ben-post">
	<div class="ben-left product-left">
    	<?php if(in_array("sanphamhot",$properties)){ ?>
        <div id="ben-icon-hot-detail" class="ben-icon">
            <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>icon/ico-hot.png" />
        </div>
        <?php } ?>
        <?php if(in_array("sanphamkhuyenmai",$properties)){ ?>
        <div id="ben-icon-sale-detail" class="ben-icon">
            <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>icon/ico-sale.png" />
        </div>
        <?php } ?>
        <?php if(in_array("sanphammoi",$properties)){ ?>
        <div id="ben-icon-new-detail" class="ben-icon">
            <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>icon/ico-new.png" />
        </div>
        <?php } ?>
        <?php if($media['imagethumbnail'] !=""){ ?>
        <a class="islink" href="<?php echo $media['link']?>"><img src='<?php echo $media['imagethumbnail']?>' class='ben-center' /></a>
        <?php }?>
    	<?php if($post['imagethumbnail'] !=""){ ?>
        <div class="product-mainimage">
        	<table>
            	<tr valign="middle">
                	<td id="product-preview" height="250px" align="center"><a class="zoom" href="<?php echo $post['imagepreview']?>"><img  src="<?php echo $post['imagethumbnail']?>" /></a></td>
                </tr>
            </table>
	        
        </div>
        
        <?php }?>
        
        <div id="ben-galary" class="ben-center">
            <table>
                <tr>
                    <td style="width:14px">
                        <img class="ben-link" id="ben-prev" src="<?php echo HTTP_SERVER.DIR_IMAGE?>galary_button_prev.png" />
                    </td>
                    <td>
                        <div style="overflow:hidden;width:248px;margin:0 auto;">
                            <table id="ben-scroll">
                                <tr>
                                   
                                    <?php foreach($subimage as $key => $val){ ?>
                                    <td>
                                        <img  id="icon-<?php echo $key?>" class="ben-icon-item" src="<?php echo $val['icon']?>" title="<?php echo $this->document->productName($post['mediaid'])?>" alt="<?php echo $this->document->productName($post['mediaid'])?>"/>
                                    </td>
                                    <?php } ?>
                                </tr>
                            </table>
                        </div>
                        
                    </td>
                    <td style="width:14px">
                        <img class="ben-link" id="ben-next" src="<?php echo HTTP_SERVER.DIR_IMAGE?>galary_button_next.png" />
                    </td>
                </tr>
            </table>
        </div>
<script language="javascript">
$(document).ready(function() { 
$(".ben-icon-item").click(function(){
	var arr = this.id.split("-");
	var key = arr[1];
	$("#product-preview").html($("#preview-"+key).html());
	$(".zoom").fancybox({
			'overlayShow'	: true,
			'transitionIn'	: 'elastic',
			'transitionOut'	: 'elastic'
		});
});

	
	$('#ben-container').tabs({ fxSlide: true, fxFade: true, fxSpeed: 'slow' });
	
	$(".zoom").fancybox({
			'overlayShow'	: true,
			'transitionIn'	: 'elastic',
			'transitionOut'	: 'elastic'
		});
});
</script>
<script language="javascript">
var block1 = 62;
var length = $("#ben-scroll").width();
var view = 248;
var move = true
var movenext = true
$("#ben-prev").click(function(){
	movenext = true;
	if(move == true)
	{
		move = false;
		var left = $("#ben-scroll").css("margin-left").replace("px","");
		//alert(left);
		if(left < 0)
		{
			
			$("#ben-scroll").animate({"marginLeft": "+="+ block1 +"px"}, "slow",function(){
				/*left = $("#ben-scoll").css("margin-left").replace("px","");
				if(left > 0)
					$("#ben-scoll").css("margin-left","0px");*/
				move = true;
			});
			
			
		}
		else
			move = true;
	}
		
});
$("#ben-next").click(function(){
	length = $("#ben-scroll").width();
	if(movenext == true)
	{
		movenext = false;
		
		var left = $("#ben-scroll").css("margin-left").replace("px","");
		
		if( parseInt(length) + parseInt(left) > view)
			$("#ben-scroll").animate({"marginLeft": "-="+ block1 +"px"}, "slow",function(){
				movenext = true;
			});
	}
	
});
</script>
        <div style="display:none">
            <?php foreach($subimage as $key => $val){ ?>
            <div  id="preview-<?php echo $key?>">
                <a class="zoom" href="<?php echo $val['imagepreview']?>"><img src="<?php echo $val['imagethumbnail']?>" /></a>
            </div>
            <?php } ?>
        </div>
     
    </div>
    <div class="ben-right product-right">
        <h2>
        	<?php echo $this->document->productName($post['mediaid'])?>
        </h2>
        <?php if($post['noted']!="") echo "<h4>".$post['noted']."</h4>";?>
        
        <!--<a href="http://www.facebook.com/sharer/sharer.php?u=<?php echo $post['link']?>" target="_blank">
    		<img src="<?php echo HTTP_SERVER.DIR_IMAGE?>facebook.gif" />
    	</a>-->
        <div class="fb-like" data-href="<?php echo $post['link']?>" data-layout="button" data-action="like" data-show-faces="true" data-share="true"></div>
        
        <div class="ben-post-body">
        	<p>
            	<table>
                	
                	<tr>
                    	<td width="25%"><strong>Loại sản phẩm:</strong></td>
                        <td>
                        	<?php foreach($loaisp as $it){ ?>
                            <strong><?php echo $it['sitemapname'].'<br />'; ?></strong>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong>Nhãn hiệu:</strong></td>
                        <td>
                        	
                            <strong><a class="brand" href="<?php echo $this->document->createLink('brandinfor',$post['brand'])?>" title="<?php echo $this->document->getCategory($post['brand'])?>"><?php echo $this->document->getCategory($post['brand'])?></a></strong>
                            
                        </td>
                    </tr>
                    <?php if($post['color'] != ""){ ?>
                    <tr>
                    	<td><strong>Màu:</strong></td>
                        <td>
                        	
                            <?php echo $post['color']?>
                            
                        </td>
                    </tr>
                    <?php } ?>
                    <?php if(count($priceproduct) == 0){ ?>
                    <tr>
                    	<td><strong>Giá:</strong></td>
                        <td>
                        	<?php $cls = '';?>
                            <?php if($post['pricepromotion']!=0){ ?>
                            <?php $cls = 'product-price-no';?>
                            <span class="product-pricepromotion">
                            <?php echo $this->string->numberFormate($post['pricepromotion'])?> <?php echo $this->document->setup['Currency']?>
                            </span>
                            <?php } ?>
                            <?php if($post['price']){ ?>
                            <span  class="product-price <?php echo $cls?>"><?php echo $this->string->numberFormate($post['price'])?> <?php echo $this->document->setup['Currency']?></span>
                            <?php }else{ ?>
                            Giá đang cập nhật
                            <?php }?>
                            <input type="button" class="ben-button" onclick="cart.add('<?php echo $post['mediaid']?>')" value="Đặt hàng">
                        </td>
                    </tr>
                    <?php } ?>
                </table>
            	
                
            </p>
            <p class="short_intro">
            	<?php echo $post['summary']?>
                
            </p>
            <?php if(count($data_samplecode)>1){ ?>
            <p>
            	<?php foreach($data_samplecode as $key => $item){?>
                <a href="<?php echo $this->document->createLink($this->document->sitemapid,$item['alias'])?>" title="<?php echo $item['color']?>"><img src="<?php echo $item['icon']?>" /></a>
                <?php } ?>
            </p>
            <?php } ?>
        </div>
        
    </div>
    <div class="clearer">&nbsp;</div>

    <div class="ben-hline"></div>
    <p>
        <?php echo $post['description']?>
    </p>
    
    <p class="ben-text-right">
        <b><?php echo $post['source']?></b>
    </p>
    <?php if(count($priceproduct)){ ?>
    <div id="listprice">
        <table>
            <thead>
                <tr>
                    <th>Sẩn phẩm</th>
                    <th>Giá bán</th>
                    <th>Giảm</th>
                    <th>Khuyến mãi</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                
                
                <?php foreach($priceproduct as $val){ ?>
                <tr>
                    <td>
                    	<?php echo $val['code']." ".$val['sizes']?>
                        <?php if($val['noteprice']!=""){ ?>
                            (<?php echo $val['noteprice']?>)
                        <?php }?>
                    	<?php if($val['tenkhuyenmai']){ ?>
                        <p class="ben-khuyenmai"><a  onclick="xemkhuyenmai('<?php echo $val['makhuyenmai']?>')"><?php echo $val['tenkhuyenmai']?></a></p>
                        <?php } ?>
                    </td>
                    
                    <td class="number">
                    	<?php $cls = '';?>
                            <?php if($val['pricepromotion']!=0){ ?>
                            <?php $cls = 'product-price-no';?>
                        <?php } ?>
                        <?php if($val['price']!=0){ ?>
                        <span class="<?php echo $cls?>"><?php echo $this->string->numberFormate($val['price'])?><?php echo $this->document->setup['Currency']?></span>
                        <?php } ?>
                    </td>
                    <td class="number">
                        <?php if($val['discountpercent']!=0){ ?>
                        <span class="product-pricepromotion">
                        -<?php echo $this->string->numberFormate($val['discountpercent'])?>%
                        </span>
                        <?php } ?>
                    </td>
                    <td class="number">
                        <?php if($val['pricepromotion']!=0){ ?>
                        <span class="product-pricepromotion">
                        <?php echo $this->string->numberFormate($val['pricepromotion'])?><?php echo $this->document->setup['Currency']?>
                        </span>
                        <?php } ?>
                    </td>
                    <td><input type="button" class="ben-button ben-center" onclick="cart.add('<?php echo $val['mediaid']?>')" value="Đặt hàng"></td>
                </tr>
                <?php } ?>
                
            </tbody>
        </table>
    </div>
    <?php } ?>
    <?php if(count($child)){ ?>
    <div id="subinfo">
                
                
        <ul>
            <?php foreach($child as $key => $item){ ?>
                <li><a href="#fragment-<?php echo $key?>"><span><?php echo $item['title']?></span></a></li>	
            <?php } ?>
        </ul>
       
        <?php foreach($child as $key => $item){ ?>
        <div id="fragment-<?php echo $key?>">
            <?php echo html_entity_decode($item['description'])?>
        </div>
        <?php } ?>
                
    </div>
    <?php } ?>
    
    
    
    
    <div class="clearer">&nbsp;</div>
</div>


<?php echo $comment?>
<div class=" ben-section-title">Gửi Nhận xét về <?php echo $this->document->productName($post)?></div>
<div id="comment-warning" class="ben-error ben-hidden"></div>
<form id="frmComment">
<input type="hidden" name="mediaid" value="<?php echo $post['mediaid']?>" />
<div class="ben-post ben-comment">
	<p>
    	<label>Họ tên</label><br>
        <input type="text" class="ben-textbox" name="fullname" />
    </p>
    <p>
    	<label>Đánh giá</label><br>
        <select name="level" class="ben-textbox">
            <option value="">Chưa đánh giá</option>
            <?php for($i=1;$i<=5;$i++){ ?>
            <option value="<?php echo $i?>"><?php echo $i?> sao</option>
            <?php } ?>
        </select>
    </p>
    <p>
    	<label>Email</label><br>
        <input type="text" class="ben-textbox" name="email"/>
    </p>
    <p>
    	<label>Nội dung</label><br>
        <textarea name="description" class="ben-textbox"></textarea>
    </p>
    <input type="button" class="ben-button ben-center" value="Gửi nhận xét" onclick="sendComment()"/>
</div>
</form>
<script language="javascript">
$(".product-icon").click(function(){
	var arr = this.id.split("-");
	var key = arr[1];
	$("#product-preview").attr("src",$("#preview-"+key).attr("src"));
});


$(document).ready(function() { 
	$('#subinfo').tabs({ fxSlide: true, fxFade: true, fxSpeed: 'slow' });
	
});
function xemkhuyenmai(makhuyenmai)
{
		$("#ben-popup").attr('title','Thông tin khuyến mãi');
				$( "#ben-popup" ).dialog({
					autoOpen: false,
					show: "blind",
					hide: "explode",
					width: 550,
					height: 350,
					modal: true,
					close: function(event, ui)
						{ 
							
						},
					buttons: {
						
						
						"Đóng": function() {
							$( this ).dialog( "close" );
							
						}
					}
				});
		$('#ben-popup-content').load(HTTP_SERVER+'?route=addon/media&id='+makhuyenmai,function(){
			$("#ben-popup").dialog("open");	
		});
				
}

function sendComment()
{
	$.blockUI({ message: "<h1>Please wait...</h1>" }); 
	
	$.post("<?php echo HTTP_SERVER?>?route=module/comment/sendComment", $("#frmComment").serialize(),
		function(data){
			if(data == "true")
			{
				$('#comment-warning').html("Bạn đã gui nhận xét thành công. Chúng tôi sẻ kiểm duyệt nội dung của bạn trước khi hiện lên website").show('slow');
				$('#frmComment').hide();
			}
			else
			{
				
				$('#comment-warning').html(data).show('slow');
				
				
			}
			$.unblockUI();
		}
	);		
}
</script>
<div class=" ben-section-title">Sản phẩm cùng nhãn hiệu</div>
<?php echo $saphamcungnhanhieu?>