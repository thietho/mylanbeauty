<?php echo $this->member->getUserName() ?>
<div>
    <div>
        <h3>Thành viên đã đăng ký</h3>
        <p>Nếu bạn đã đăng ký với chúng tôi, hãy đăng nhập phía dưới.</p>
    </div>
    <div>
    	<?php print_r($this->member->getUserName())?>
        <form id="frmLogin" method="post" role="form" action="" data-ajax="false">
        	<div class="form-group has-error">
            	<label id="hl-error" class="control-label" style="display:none">
                
                	<?php echo implode("<br>",$error);?>
                
                </label>
            </div>
            <div class="form-group">
                <label>Tên đăng nhập</label>
                <input type="text" id="username" name="username" value="<?php echo $_POST['username']?>">
            </div>
            <div class="form-group">
                <label>Mật khẩu</label>
                <input type="password" id="password" name="password">
            </div>
            
            <div>
                <input type="submit" class="ui-btn ui-corner-all" id="btnLogin" value="Đăng nhập" data-ajax="false">
                <a class="ui-btn ui-btn-inline ui-corner-all" href="<?php echo $this->document->createLink('register')?>">Đăng ký</a>
                <a class="ui-btn ui-btn-inline ui-corner-all" href="<?php echo $this->document->createLink('forgotpassword')?>">Quên mật khẩu</a>
            </div>
            <div class="checkbox">
            	
                <label>
            		<input type="checkbox" name="remember" id="remember" value="1">
                    Ghi nhớ
                </label>
                
                
            </div>
        </form>
    </div>

</div>
<?php if(count($error)){ ?>
<script language="javascript">
$(document).ready(function(e) {
	
    $('#hl-error').show();
});
</script>
<?php } ?>
<script language="javascript">
/*$("#btnLogin").click(function(){
	
	$.mobile.loading( "show", {
            text: "Loading",
            textVisible: true,
            theme: 'b',
            textonly: false,
            html: processing
    });
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
				
				$('#hl-error').html(data).show('slow');
				
				
			}
			$.mobile.loading( "hide" );
		}
	);					   
});*/

</script>