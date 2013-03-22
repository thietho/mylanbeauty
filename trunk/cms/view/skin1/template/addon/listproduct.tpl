<?php foreach($medias as $media){ ?>
<div class="product-item left">
	<input type="hidden" class="listid" value="<?php echo $media['mediaid']?>">
    <div class="product-price">
    	<table>
        	<?php foreach($media['productprice'] as $item){ ?>
            <tr>
            	<td>
            		<?php echo $item['title']?>
            	</td>
                <td>
            		<?php echo $this->string->numberFormate($item['gia'])?>
            	</td>
            </tr>
            <?php } ?>
        </table>
    	
    </div>
	<table>
    	<tr>
        	<td width="100px" height="100px" align="center">
            	<img src="<?php echo $media['imagepreview']?>">
            </td>
        </tr>
        <tr>
        	<td align="center">
            	<?php echo $media['title']?><br>
                <?php if($media['price']){ ?>
                <?php echo $this->string->numberFormate($media['price'])?>
                <?php } ?>
                <?php if($media['pricepromotion']){ ?>
                <br /><strong><?php echo $this->string->numberFormate($media['pricepromotion'])?></strong>
                <?php } ?>
            </td>
        </tr>
    </table>
	
</div>
<?php } ?>
<div class="clearer">^&nbsp;</div>
<script language="javascript">
$('.product-item').click(function(e) {
    var html = "<div><input type='button' class='button removeselect' value='X'>"+$(this).html()+"</div>";
	$('#productselect').append(html);
	
	$('.removeselect').click(function(e) {
		$(this).parent().remove();
	});
});

</script>