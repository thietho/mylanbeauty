<div>
	<h1><center>TƯ VẤN CHĂM SÓC DA</center></h1>
	<form id="frmRequest" method="post">
    	<div id="error" class="ben-error" style="display:none"></div>
    	<table>
        	<tr>
            	<td width="40%"><label>Họ và tên</label> <input type="text" id="fullname" name="fullname" class="ben-textbox" style="width:75%"></td>
                <td><label>Số điện thoại</label> <input type="text" id="phone" name="phone" class="ben-textbox" style="width:80%"></td>
            </tr>
            <tr>
            	<td colspan="2">
                	<label>Địa chỉ</label>
                    <input type="text" id="address" name="address" class="ben-textbox" style="width:100%">
                </td>
                
            </tr>
            <tr>
            	<td colspan="2">
                	<label>Tình trạng da</label>
                    <p>
                        <?php foreach($skinstatus as $status){ ?>
                        <div class="ben-left" style="width:25%"><input type="checkbox" name="skinstatus[]" value="<?php echo $status?>"><?php echo $status?></div>
                        <?php } ?>
                        <div class="clearer">&nbsp;</div>
                    </p>
                </td>
                
            </tr>
           	<tr>
            	<td>
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
                    <input type="text" id="birthday" name="birthday" class="ben-textbox">
                </td>
                <td>
                	<label>Đã sử dụng qua kem đặc/kem làm trắng nhanh</label>
                    <input type="radio" id="unknownorigin" name="unknownorigin" value="1"> Có
                    <input type="radio" id="unknownorigin" name="unknownorigin" value="0"> Không
                </td>
            </tr>
            <tr>
            	<td colspan="2">
                	<label>Mỹ phẩm đã từng dùng</label>
                    <input type="text" id="cosused" name="cosused" class="ben-textbox" style="width:100%">
                </td>
                
            </tr>
            <tr>
            	<td colspan="2">
                	<label>Mỹ phẩm đang sử dụng</label>
                    <input type="text" id="coscur" name="coscur" class="ben-textbox" style="width:100%">
                </td>
                
            </tr>
            <tr>
            	<td colspan="2">
                	<label>Ghi chú</label><br>
                    <textarea id="note" name="note" style="width:100%"></textarea>
                </td> 
            </tr>
            <tr>
            	<td colspan="2">
                	<label>Đính kèm file</label>
                    <input id="fileupload" class="button" type="file" name="files[]"  multiple value="Chon file" >
                </td> 
            </tr>
            <tr>
            	<td class="ben-right"></td>
                <td>
                	<input type="button" id="btnSend" name="btnSend" class="ben-button" value="Gửi yêu cầu">
                    
                </td>
            </tr>
        </table>
    </form>
</div>
<div class="clearer">&nbsp;</div>
<script language="javascript">
$("#btnSend").click(function(){
	$.blockUI({ message: "<h1>Please wait...</h1>" }); 
	
	$.post("<?php echo HTTP_SERVER?>?route=addon/request/send", $("#frmRequest").serialize(),
		function(data){
			if(data == "true")
			{
				
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