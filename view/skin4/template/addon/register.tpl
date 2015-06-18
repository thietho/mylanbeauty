<div class="col-md-4 col-md-offset-4">
    <div>
        <form id="frmRegister" method="post" role="form">
            <div class="form-group has-error">
            	<label id="hl-error" class="control-label" style="display:none"></label>
            </div>
            <div class="form-group">
                <label>Tên đăng nhập</label>
                <input type="text" id="username" name="username" class="form-control">
            </div>
            <div class="form-group">
                <label>Mật khẩu</label>
                <input type="password" id="password" name="password" class="form-control">
            </div>
            <div class="form-group">
                <label>Xác nhận mật khẩu</label>
                <input type="password" id="confirmpassword" name="confirmpassword" class="form-control">
            </div>
            <div class="form-group">
                <label>Họ và tên</label>
                <input type="text" id="fullname" name="fullname" class="form-control">
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" id="email" name="email" class="form-control">
            </div>
            <div class="form-group">
                <label>Địa chỉ</label>
                <input type="text" id="address" name="address" class="form-control">
            </div>
            <div class="form-group">
                <label>Điện thoại</label>
                <input type="tel" id="phone" name="phone" class="form-control">
            </div>
            <div class="form-group">
                <label for="date">Ngày sinh</label>
                
                <input type="date" id="birthday" name="birthday" value="">
                
            </div>
            <div class="form-group">
                
				<?php echo $dieukhoan?>
                
            </div>
            <div class="checkbox">
            	<label>
                    <input type="checkbox" id="chkaccept" name="chkaccept" value="accept" >
                    Tôi đồng ý với điều khoản trên
                </label>
            </div>
            <div class="form-group">
                <input type="button" id="btnRegister" name="btnRegister" class="btn btn-lg btn-success btn-block" value="Đăng ký">
            </div>
            
           
        </form>
    </div>

</div>

<script language="javascript">
$("#btnRegister").click(function(){
	
	$.mobile.loading( "show", {
            text: "Loading",
            textVisible: true,
            theme: 'b',
            textonly: false,
            html: processing
    });
	$.post("<?php echo HTTP_SERVER?>?route=addon/register/save", $("#frmRegister").serialize(),
		function(data){
			if(data == "true")
			{
				//$('#error').html("Bạn đã đăng ký thành công! Mã kích hoạt tài khoản đã đươc gửi tới email của bạn! <a href='<?php echo $this->document->createLink('active')?>'>Kích hoạt tài khoản click vào đây</a>").show('slow');
				//$("#frmRegister").hide();
				window.location = '<?php echo $this->document->createLink("successfulregistration")?>';
			}
			else
			{
				
				$('#hl-error').html(data).show('slow');
				$(document).scrollTop($('#hl-error').offset().top);
				
			}
			$.mobile.loading( "hide" );
		}
	);					   
});
</script>