<?php foreach($medias as $media){ ?>
<div class="product-item left">
	<input type="hidden" class="listid" value="<?php echo $media['mediaid']?>">
	<table>
    	<tr>
        	<td width="100px" height="100px" align="center">
            	<img src="<?php echo $media['imagepreview']?>">
            </td>
        </tr>
        <tr>
        	<td align="center">
            	<?php echo $media['title']?><br>
                <?php echo $this->string->numberFormate($media['price'])?>
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