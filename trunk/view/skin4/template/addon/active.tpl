<div class="col-md-4 col-md-offset-4">
    
    <div>
        <form id="frmActive" method="post" role="form">
        	<div class="form-group has-error">
            	<label id="error" class="control-label" style="display:none"></label>
            </div>
            <div class="form-group">
                <label>Tên đăng nhập</label>
                <input type="text" id="username" name="username" class="form-control">
            </div>
            <div class="form-group">
                <label>Mã kích hoạt</label>
                <input type="text" id="activecode" name="activecode" class="form-control">
            </div>
            
            <div class="form-group">
                <input type="button" class="btn btn-lg btn-success btn-block" id="btnActive" value="Kích hoạt">
            </div>
        </form>
    </div>

</div>
<script language="javascript">
$("#btnActive").click(function(){
	$.mobile.loading( "show", {
            text: "Loading",
            textVisible: true,
            theme: 'b',
            textonly: false,
            html: processing
    });
	
	$.get("<?php echo HTTP_SERVER?>?route=addon/active/active", $("#frmActive").serialize(),
		function(data){
			if(data == "true")
			{
				alert("Bạn đã kích hoạt tài khoản thành công!");
				window.location = "<?php echo $this->document->createLink('login')?>";
			}
			else
			{
				
				$('#error').html(data).show('slow');
				
				
			}
			$.mobile.loading( "hide" );
		}
	);					   
});
</script>