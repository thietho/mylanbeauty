<div>
    <form id="hl-searchform" action="" data-ajax="false">
    	<div>
            <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Từ khóa tìm kiếm">
        </div>
    	<div>
            <select name="loaisp" id="loaisp" class="form-control" onChange="$('#hl-searchform').submit()">
                <option value="">Loại sản phẩm</option>
                <?php foreach($loaisp as $it){ ?>
                <option value="<?php echo $it['sitemapid']?>"><?php echo $this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo $it['sitemapname']?></option>                        
                <?php } ?>
            </select>
        </div>
        <div>
            <select name="nhanhieu" id="nhanhieu" class="form-control" onChange="$('#hl-searchform').submit()">
                <option value="">Nhãn hiệu</option>
                <?php foreach($nhanhieu as $it){ ?>
                <option value="<?php echo $it['categoryid']?>"><?php echo $this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo $it['categoryname']?></option>                        
                <?php } ?>
            </select>
        </div>
    </form>
</div>
<div class="col-md-12">
	<?php echo $searchresult?>
</div>
<script language="javascript">
$('#hl-searchform').submit(function(e) {
    
});
$("#btnSearch").click(function(){
	/*var url =  HTTP_SERVER+"product/search/";
	var keyword = trim($("#txt_search").val()," ");
	
	if($("#loaisp").val() != "")
		url += "[loaisp=" + $("#loaisp").val()+"]";*/
	/*if($("#nhomhuong").val() != "")
		url += "[nhomhuong="+ $("#nhomhuong").val()+"]";*/
	/*if($("#nhanhieu").val() != "")
		url += "[nhanhieu=" + $("#nhanhieu").val()+"]";
	if($("#gia").val() != "")
		url += "[gia=" + $("#gia").val()+"]";
	if($("#keyword").val() != "")
		url += "[keyword=" + keyword+"]";
	
	
	if("<?php echo $_GET['opendialog']?>" == "true")
	{
		url += "&opendialog=true";
	}
	
	window.location = url+".html";*/
});
$("#loaisp").val("<?php echo $_GET['loaisp']?>");
$("#nhomhuong").val("<?php echo $_GET['nhomhuong']?>");
$("#nhanhieu").val("<?php echo $_GET['nhanhieu']?>");
$("#gia").val("<?php echo $_GET['gia']?>");
$("#keyword").val("<?php echo urldecode($_GET['keyword'])?>");
</script>
