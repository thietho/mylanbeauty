<style>
.ben-cart
{
	border:thin solid #CCC;	
	padding:5px;
}
</style>
<div id="addoncartlist" class="table-responsive">

</div>
<div align="center">
	<a href="<?php echo HTTP_SERVER?>" class="ui-btn ui-btn-inline ui-corner-all ui-shadow">Tiếp tục mua hàng</a>
    <a href="<?php echo $this->document->createLink('checkout')?>" class="ui-btn ui-btn-inline ui-corner-all ui-shadow">Thanh toán</a>
	
</div>
<script language="javascript">
$(document).ready(function() {
	$("#addoncartlist").load(HTTP_SERVER+"?route=addon/cart/getList");
});
</script>