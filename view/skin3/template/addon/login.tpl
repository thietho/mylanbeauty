<div class="col-md-4 col-md-offset-4">
    <div>
        <h3>Thành viên đã đăng ký</h3>
        <p>Nếu bạn đã đăng ký với chúng tôi, hãy đăng nhập phía dưới.</p>
    </div>
    <div>
        <form id="frmLogin" method="post" role="form">
        	<div class="form-group has-error">
            	<label id="error" class="control-label" style="display:none"></label>
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
                <input type="button" class="btn btn-lg btn-success btn-block" id="btnLogin" value="Đăng nhập">
                <a href="<?php echo @$this->document->createLink('register')?>">Đăng ký</a>
                <a href="<?php echo @$this->document->createLink('forgotpassword')?>">Quên mật khẩu</a>
            </div>
            <div class="form-group">
                <input type="checkbox" name="remember" value="1"> Ghi nhớ
            </div>
        </form>
    </div>

</div>
<script language="javascript">
$("#btnLogin").click(function(){
	$.blockUI({ message: "<h1>Please wait...</h1>" }); 
	
	$.post("<?php echo HTTP_SERVER?>?route=addon/login/login", $("#frmLogin").serialize(),
		function(data){
			if(data == "true")
			{
				alert("Bạn đã đăng nhập thành công!");
				if(history.length=1)
					window.location = '<?php echo HTTP_SERVER?>';
				history.go(-1);
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