<div class="col-md-4 col-md-offset-4">
    <div>
        <h3>Quên mật khẩu</h3>
        
    </div>
    <div>
        <form id="forgetpassword" method="post" role="form">
        	<div class="form-group has-error">
            	<label id="error" class="control-label" style="display:none"></label>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="text" id="email" name="email" class="form-control">
            </div>
            
            <div class="form-group">
                <input type="button" class="btn btn-lg btn-success btn-block" id="btnquenmatkhau" value="Lấy lại mật khẩu">
                
            </div>
            
        </form>
    </div>

</div>


<script language="javascript">
$('#btnquenmatkhau').click(function(){
	$.post("?route=addon/forgotpassword/resetPassword", $("#forgetpassword").serialize(),function(data){
		if(data=='true')
		{
			alert("Bạn vô mail để nhận mật khẩu mới");
			window.location = '?route=addon/login';
		}
		else
		{
			$('#error').html(data).show('slow');
		}
	});
});
</script>