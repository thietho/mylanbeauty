<script language="">
function GetKey(evt)
{
	if(navigator.appName=="Netscape"){theKey=evt.which}
	if(navigator.appName.indexOf("Microsoft")!=-1)
	{
		theKey=window.event.keyCode
	}
	window.status=theKey;
	if(theKey==13)
	{
		sendMessage()
	}
}
function sendMessage()
{
	$.mobile.loading( "show", {
            text: "Loading",
            textVisible: true,
            theme: 'b',
            textonly: false,
            html: processing
    });
	$.post(HTTP_SERVER+"?route=module/contact/sendMessage", 
		$("#contractForm").serialize(), 
		function(data)
		{
			if(data!="true")
			{
				$('#hl-error').html(data);
				$('#hl-error').fadeIn("slow");
				
			}
			else
			{
				alert("<?php echo $war_contactsuccess?>")
				window.location.reload();
			}
			$.mobile.loading( "hide" );
		}
	);
}
</script>

<div class="ben-post">
<p>
    <?php echo $post['description']?>
</p>

<div class="clearer">&nbsp;</div>

<form method="post" action="" id="contractForm" name="contractForm">
<div>
	<div class="form-group has-error">
        <label id="hl-error" class="control-label" style="display:none"></label>
    </div>
    <input type="hidden" name="sitemapid" value="<?php echo $this->document->sitemapid;?>" />
    <div class="ben-left contact-left">
        <p>
            <label for="input-1"><?php echo $text_fullname?></label><br/>
            <input type="text" name="fullname" id="fullname" class="ben-textbox" size="40" onkeypress='GetKey(event)'/>
        </p>
        
        <p>
            <label for="input-1"><?php echo $text_email?></label><br/>
            <input type="text" name="email" id="email" class="ben-textbox" size="40" onkeypress='GetKey(event)'/>
        </p>
    
        <p>
            <label for="input-1"><?php echo $text_address?></label><br/>
            <input type="text" name="address" id="address" class="ben-textbox" size="40" onkeypress='GetKey(event)'/>
        </p>
        
        <p>
            <label for="input-1"><?php echo $text_phone?></label><br/>
            <input type="text" name="phone" id="phone" class="ben-textbox" size="40" onkeypress='GetKey(event)'/>
        </p>
    
        
    </div>
    <div class="ben-left">
    	<p>
            <label for="input-3"><?php echo $text_note?></label><br/>
            <textarea name="description" id="description" class="ben-textbox" cols="65"></textarea>
        </p>
        
    </div>
    <div class="clearer">&nbsp;</div>
    <p>
        <input type="button" class="ben-button" value="<?php echo $button_send?>" onclick="sendMessage()"/>
        <input type="reset" class="ben-button" value="<?php echo $button_reset?>"/>
    </p>
</div>			
</form>
</div>
<?php echo $sododuongdi?>