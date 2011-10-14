<style>
.product-left
{
	width:200px;	
}
.product-right
{
	width:480px;	
}
.product-mainimage
{
	text-align:center;	
}
.product-subimage
{
	text-align:center;
	margin-top:5px;
}

#ben-icon-sale-detail
{
	margin-top:220px;	
}

#ben-icon-new-detail
{
	margin-left:200px;
	margin-top:212px;
}
</style>
<link rel='stylesheet' type='text/css' href='<?php echo HTTP_SERVER.DIR_VIEW?>css/product.css'>
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
	        <img id="product-preview" src="<?php echo $post['imagethumbnail']?>"/>
        </div>
        
        <?php }?>
        <div class="product-subimage">
            <?php 
            if(count($subimage))
            foreach($subimage as $key => $val){ ?>
            <img id="icon-<?php echo $key?>" class="product-icon" src="<?php echo $val['imagethumbnail']?>" />
            <?php } ?>
        </div>
        <div style="display:none">
        	<?php foreach($subimage as $key => $val){ ?>
            <img id="preview-<?php echo $key?>" src="<?php echo $val['imagepreview']?>" />
            <?php } ?>
        </div>
    </div>
    <div class="ben-right product-right">
        <h2><?php echo $post['title']?></h2>
        
        <div class="ben-post-body">
        	<p>
            	<table>
                	<tr>
                    	<td width="25%"><strong>Loại sản phẩm:</strong></td>
                        <td>
                        	<?php foreach($loaisp as $it){ ?>
                            <?php echo $it['sitemapname']; ?>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong>Nhản hiệu:</strong></td>
                        <td>
                        	<?php foreach($nhanhieu as $it){ ?>
                            <?php echo in_array($it['categoryid'],$properties)?$it['categoryname'].'<br />':''; ?>
                            <?php } ?>
                        </td>
                    </tr>
                    
                </table>
            	
                
            </p>
            <p>
            	<b><?php echo $post['summary']?></b>
                
            </p>
        </div>
        
    </div>
    <div class="clearer">&nbsp;</div>
</div>
<div class="ben-hline"></div>
<p>
    <?php echo $post['description']?>
</p>

<p class="ben-text-right">
	<b><?php echo $post['source']?></b>
</p>

<div id="listprice">
	<table>
    	<thead>
        	<tr>
            	<th>Sẩn phẩm</th>
                <th>Giá thị trường</th>
                <th>Giá bán</th>
                <th>Khuyến mãi</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        	
            <?php if(count($priceproduct)){ ?>
        	<?php foreach($priceproduct as $val){ ?>
            <tr>
            	<td><?php echo $val['title']!=""?$val['title']:$post['title'] ?></td>
                <td class="number">
                	<?php if($val['thitruong']!=0){ ?>
                	<?php echo $this->string->numberFormate($val['thitruong'])?> <?php echo $this->document->setup['Currency']?>
                    <?php } ?>
                </td>
                <td class="number">
                	<?php if($val['gia']!=0){ ?>
                	<?php echo $this->string->numberFormate($val['gia'])?> <?php echo $this->document->setup['Currency']?>
                    <?php } ?>
                </td>
                <td class="number">
                	<?php if($val['khuyenmai']!=0){ ?>
                	<?php echo $this->string->numberFormate($val['khuyenmai'])?><?php echo $this->document->setup['Currency']?>
                    <?php } ?>
                </td>
                <td><input type="button" class="ben-button" onclick="cart.add('<?php echo $val['mediaid']?>')" value="Đặt hàng"></td>
            </tr>
            <?php } ?>
            <?php } ?>
        </tbody>
    </table>
</div>

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

<script language="javascript">
$(".product-icon").click(function(){
	var arr = this.id.split("-");
	var key = arr[1];
	$("#product-preview").attr("src",$("#preview-"+key).attr("src"));
});


$(document).ready(function() { 
	$('#subinfo').tabs({ fxSlide: true, fxFade: true, fxSpeed: 'slow' });
	
});
</script>