<table class="ui-responsive ui-table ui-table-reflow">
	<thead>
        <tr>
            <th>Hình</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Thành tiền</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
	<?php 
    	$sum = 0;
    	foreach($medias as $media) {
        $sum += $media['price'] * $media['qty'];
    ?>
        <tr>
            <td><img src="<?php echo @$media['imagethumbnail']?>" class="ben-center"/></td>
            <td><?php echo @$this->document->productName($media['mediaid'])?></td>
            <td class="number"><?php echo @$this->string->numberFormate($media['price'])?><?php echo @$this->document->setup['Currency']?></td>
            <td><input type="number" name="qty" class="number" value="<?php echo @$this->string->numberFormate($media['qty'])?>" size="3" onblur="cart.update('<?php echo @$media['mediaid']?>',this.value)" /></td>
            <td class="number"><?php echo @$this->string->numberFormate($media['price'] * $media['qty'])?><?php echo @$this->document->setup['Currency']?></td>
            <td><input type="button" class="ben-button" name="btnRemove" value="Xóa" onclick="cart.remove('<?php echo @$media['mediaid']?>')"/></td>
        </tr>
    <?php } ?>
    </tbody>
    <tfoot>
    	<tr>
        	
            <td colspan="4" style="text-align:right">Tông cộng</td>
            <td class="number"><?php echo @$this->string->numberFormate($sum)?><?php echo @$this->document->setup['Currency']?></td>
            <td></td>
        </tr>
    </tfoot>
</table>
<script language="javascript">
$(document).ready(function(){
	numberMod()		   
});
</script>