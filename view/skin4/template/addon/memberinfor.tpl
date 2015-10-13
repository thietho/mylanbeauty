
<style>
.text
{
	cursor:pointer;
}

.date
{
	cursor:pointer;
}
</style>
<div class="col-md-8 col-md-offset-2">
	<div>
    	<form id="frmRegister" method="post">
    	<div id="error" class="ben-error" style="display:none"></div>
    	<table class="table">
        	<tr>
            	<td><label>Tên đăng nhập</label></td>
                <td><?php echo @$member['username']?></td>
            </tr>
            
            <tr>
            	<td><label>Họ và tên</label></td>
                <td id="fullname" class="text"><?php echo @$member['fullname']?></td>
            </tr>
            <tr>
            	<td><label>Email</label></td>
                <td id="email" class="text"><?php echo @$member['email']?></td>
            </tr>
            <tr>
            	<td><label>Địa chỉ</label></td>
                <td id="address" class="text"><?php echo @$member['address']?></td>
            </tr>
            <tr>
            	<td><label>Điện thoại</label></td>
                <td id="phone" class="text"><?php echo @$member['phone']?></td>
            </tr>
            <tr>
            	<td><label>Ngày sinh</label></td>
                
                <td id="birthday" class="date"><?php echo @$this->date->formatMySQLDate($member['birthday'])?></td>
            </tr>
            
        </table>
    </form>
    
    </div>
</div>


<script type="text/javascript" charset="utf-8">
var DIR_UPLOADPHOTO = "<?php echo @$DIR_UPLOADPHOTO?>";
var isedit = true
function editText(eid)
{
	if(isedit)
	{
		var text = $("#"+eid).html();
		var html = '<input type="text" class="form-control" size="50" id="text-'+eid+'" value="'+text+'">';
		html+=' <input id="btnSaveInfor" type="button" class="btn btn-default" value="Save" onclick="saveInfor(\''+eid+'\')">';
		
						
		$("#"+eid).html(html);
		$("#"+eid).unbind('click');
		
	}
	
}

$(".text").click(function(){
	
	 editText(this.id);

});

function editDate(eid)
{
	if(isedit)
	{
		var text = dateDMYtoYMD($("#"+eid).html());
		var html = '<input type="date" class="form-control" id="text-'+eid+'" value="'+text+'">';
		html+=' <input id="btnSaveInfor" type="button" class="btn btn-default" value="Save" onclick="saveDate(\''+eid+'\')">';
		
		$("#"+eid).html(html);
		$("#"+eid).unbind('click');
		
	}
	
}
$(".date").click(function(){
	
	 editDate(this.id);

});
function saveInfor(eid)
{
	isedit = false;
	$.post("<?php echo HTTP_SERVER?>?route=addon/memberinfor/saveInfor", { userid: "<?php echo @$member['username']?>", colname: eid , value: $("#text-"+eid).val()},
		function(data){
			if(data == "true")
			{
				
			}
			
		}
	);
	
	$("#"+eid).html($("#text-"+eid).val());
	$("#"+eid).bind('click', function() {
		 editText(this.id);
		 isedit = true;
	});
}
function saveDate(eid)
{
	isedit = false;
	$.post("<?php echo HTTP_SERVER?>?route=addon/memberinfor/saveDate", { userid: "<?php echo @$member['username']?>", colname: eid , value: dateYMDtoDMY($("#text-"+eid).val())},
		function(data){
			if(data == "true")
			{
				
			}
			
		}
	);
	$("#"+eid).html(dateYMDtoDMY($("#text-"+eid).val()));
	$("#"+eid).bind('click', function() {
		 editDate(this.id);
		 isedit = true;
	});
}

function callbackfunc(objfile)
{
	$.post("<?php echo HTTP_SERVER?>?route=addon/memberinfor/saveAvatar", { userid: "<?php echo @$member['username']?>", imageid: objfile.imageid , imagepath: objfile.imagepath},
		function(data){
			if(data == "true")
			{
				
			}
			
		}
	);
}

</script>


