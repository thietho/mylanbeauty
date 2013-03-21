<div id="productseach">
	<p>
		<label>Từ khóa</label>
        <input type="text" class="text" id="keyword" name="keyword"/>
    </p>
</div>
<div class="clearer">^&nbsp;</div>
<div id="productlist" class="left" style="width:80%">
	
</div>
<div id="productselect" class="right" style="width:20%">
	
</div>
<div class="clearer">^&nbsp;</div>
<script language="javascript">
$(document).ready(function(e) {
    $('#productlist').load("?route=addon/order/listProduct");
});
$('#keyword').keyup(function(e) {
    $('#productlist').load("?route=addon/order/listProduct&keyword="+this.value);
});
</script>