<div class="col-md-4 col-md-offset-4">
    <div>
        <h3>Thành viên đã đăng ký</h3>
        <p>Nếu bạn đã đăng ký với chúng tôi, hãy đăng nhập phía dưới.</p>
    </div>
    <div>
        <form id="frmChangepass" method="post" role="form">
        	<div class="form-group has-error">
            	<label id="hl-error" class="control-label" style="display:none"></label>
            </div>
            
            <div class="form-group">
                <label>Mật khẩu củ</label>
                <input type="password" id="oldpassword" name="oldpassword" class="form-control">
            </div>
            <div class="form-group">
                <label>Mật khẩu mới</label>
                <input type="password" id="newpassword" name="newpassword" class="form-control">
            </div>
            <div class="form-group">
                <label>Xác nhận mật khẩu</label>
                <input type="password" id="confirmpassword" name="confirmpassword" class="form-control">
            </div>
            <div class="form-group">
                <input type="button" class="btn btn-lg btn-success btn-block" id="btnChangepass" value="Thay đổi">
                
            </div>
            
        </form>
    </div>

</div>

<script language="javascript">
$("#btnChangepass").click(function(){
	$.mobile.loading( "show", {
            text: "Loading",
            textVisible: true,
            theme: 'b',
            textonly: false,
            html: processing
    });
	
	$.post("<?php echo HTTP_SERVER?>?route=addon/changepass/change", $("#frmChangepass").serialize(),
		function(data){
			if(data == "true")
			{
				alert("Bạn đã đổi mật khẩu thành công!");
				window.location = "<?php echo @$this->document->createLink('member')?>";
			}
			else
			{
				
				$('#hl-error').html(data).show('slow');
				
				
			}
			$.mobile.loading( "hide" );
		}
	);					   
});
</script>