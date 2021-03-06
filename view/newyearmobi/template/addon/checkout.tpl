<div>
<table class="ui-responsive ui-table ui-table-reflow">
	<thead>
        <tr>
            <th>Hình</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Thành tiền</th>
           
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
            <td class="number"><?php echo @$this->string->numberFormate($media['price'])?></td>
            <td class="number"><?php echo @$this->string->numberFormate($media['qty'])?></td>
            <td class="number"><?php echo @$this->string->numberFormate($media['price'] * $media['qty'])?></td>
            
        </tr>
    <?php } ?>
    </tbody>
    <tfoot>
    	<tr>
        	<td></td>
            <td></td>
            <td></td>
            <td>Tông cộng</td>
            <td class="number"><?php echo @$this->string->numberFormate($sum)?></td>
        </tr>
    </tfoot>
</table>
</div>
<div class="col-md-4 col-md-offset-4">
	<form id="frmCheckOut" method="post">
    	<div id="error" class="ben-error" style="display:none"></div>
        <h2>Thông tin khách hàng</h2>
    	
        	
        <input type="hidden" id="userid" name="userid" value="<?php echo @$member['username']?>" size="40">
        <input type="hidden" id="orderdate" name="orderdate" >
        <div class="form-group">
            <label>Họ và tên</label>
            <input type="text" id="customername" name="customername" class="form-control" value="<?php echo @$member['fullname']?>" <?php echo @$readonly?>>
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="text" id="email" name="email" value="<?php echo @$member['email']?>" class="form-control" <?php echo @$readonly?>>
        </div>
        <div class="form-group">
            <label>Địa chỉ</label>
            <input type="text" id="address" name="address" value="<?php echo @$member['address']?>" class="form-control" <?php echo @$readonly?>>
        </div>
        <div class="form-group">
            <label>Điện thoại</label>
            <input type="text" id="phone" name="phone" value="<?php echo @$member['phone']?>" class="form-control" <?php echo @$readonly?>>
        </div>
        <div class="checkbox">
        	<label><input id="chk_fillnhanhang" type="checkbox" /> Thông tin nhận hàng như trên</label>
        </div>
        <h2>Thông tin giao hàng</h2>
        <div class="form-group">
            <label>Người nhận hàng</label>
            <input type="text" id="receiver" name="receiver"  class="form-control">
        </div>
        <div class="form-group">
            <label>Số điện thoại</label>
            <input type="text" id="receiverphone" name="receiverphone"  class="form-control">
        </div>
        <div class="form-group">
            <label>Địa chỉ giao hàng</label>
            <input type="text" id="shipperat" name="shipperat"  class="form-control">
        </div>
        <div class="form-group">
            <label>Phương thức thanh toán</label>
            <?php foreach($this->document->paymenttype as $key => $val){ ?>
            <div class="radio">
            	<label><input type="radio" name="paymenttype" value="<?php echo @$key?>" /> <?php echo @$val?></label>
            </div>
            <?php } ?>
        </div>
        <div class="form-group">
            <label>Ghi chú</label>
            <textarea id="comment" name="comment" class="form-control"></textarea>
            
        </div>
        <div class="form-group">
            <input type="button" class="btn btn-lg btn-success btn-block" id="btnCheckout" value="Thanh toán">
            
        </div>
        
    </form>
</div>
<div class="clearer">&nbsp;</div>
<script language="javascript">
$("#btnCheckout").click(function(){
	$.mobile.loading( "show", {
            text: "Loading",
            textVisible: true,
            theme: 'b',
            textonly: false,
            html: processing
    });
	$('#orderdate').val(toPhpTime(Date.now()));
	$.post("<?php echo HTTP_SERVER?>?route=addon/checkout/checkout", $("#frmCheckOut").serialize(),
		function(data){
			var arr = data.split("-")
			if(arr[0] == "true")
			{
				window.location = HTTP_SERVER+"checkoutcomplete/"+arr[1]+".html";
			}
			else
			{
				
				$('#error').html(data).show('slow');
				
				
			}
			$.mobile.loading( "hide" );
		}
	);					   
});
$("#chk_fillnhanhang").click(function(e) {
    $('#receiver').val($('#customername').val());
	$('#receiverphone').val($('#phone').val());
	$('#shipperat').val($('#address').val());
});
</script>