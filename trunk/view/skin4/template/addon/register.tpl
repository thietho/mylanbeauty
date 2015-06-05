<div class="col-md-4 col-md-offset-4">
    <div>
        <form id="frmRegister" method="post" role="form">
            <div id="error" class="ben-error" style="display:none"></div>
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
                <input type="text" id="email" name="email" class="form-control">
            </div>
            <div class="form-group">
                <label>Địa chỉ</label>
                <input type="text" id="address" name="address" class="form-control">
            </div>
            <div class="form-group">
                <label>Điện thoại</label>
                <input type="text" id="phone" name="phone" class="form-control">
            </div>
            <div class="form-group">
                <label>Ngày sinh</label>
                <script language="javascript">
					$(function() {
						$("#birthday").datepicker({
								changeMonth: true,
								changeYear: true,
								dateFormat: 'dd-mm-yy'
								});
						});
				 </script>
                <input type="text" id="birthday" name="birthday" class="form-control">
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
	$.blockUI({ message: "<h1>Please wait...</h1>" }); 
	
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
				
				$('#error').html(data).show('slow');
				
				
			}
			$.unblockUI();
		}
	);					   
});
</script>