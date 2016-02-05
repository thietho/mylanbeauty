<div class="section">

	<div class="section-title"><?php echo @$this->document->title?></div>
    
    <div class="section-content">
    	
        <form id="frm_thongke">
        	<div id="ben-search">
            	<input type="text" class="text" id="keyword" name="keyword" placeholder="Tìm kiếm sản phẩm"/>
                <label>Từ ngày</label>
                <input type="text" class="text date" id="tungay" name="tungay" />
                <script language="javascript">
                $(function() {
                    $("#tungay").datepicker({
                            changeMonth: true,
                            changeYear: true,
                            dateFormat: 'dd-mm-yy'
                            });
                    });
                </script>
                <label>Đến ngày</label>
                <input type="text" class="text date" id="denngay" name="denngay" />
                <script language="javascript">
                $(function() {
                    $("#denngay").datepicker({
                            changeMonth: true,
                            changeYear: true,
                            dateFormat: 'dd-mm-yy'
                            });
                    });
                </script>
                <label>Nhản hiệu</label>
                <select id="brand" name="brand">
                    <option value="">Tất cả nhản hiệu</option>
                    <?php foreach($nhanhieu as $it){ ?>
                    <option value="<?php echo @$it['categoryid']?>"><?php echo @$this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo @$it['categoryname']?></option>                        
                    <?php } ?>
                </select>
                <label>Danh mục</label>
                <select id="sitemapid" name="sitemapid">
                    <option value="">Tất cả danh mục</option>
                    <?php foreach($sitemaps as $sitemap){ ?>
                    <?php if(@$sitemap['moduleid'] == 'module/product'){ ?>
                    <option value="<?php echo @$sitemap['sitemapid']?>"><?php echo @$this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$sitemap['level']) ?><?php echo @$sitemap['sitemapname']?></option>
                    <?php } ?>
                    <?php } ?>
                </select>
                <br />
                <input type="button" class="button" id="btnThongKe" name="btnThongKe" value="Xem"/>
                
            </div>
        	
            <div class="clearer">^&nbsp;</div>
            
            <div id="showresult">
                
            </div>
        	<input type="button" class="button" id="btnSaveToExcel" name="btnSaveToExcel" value="Lưu thành excel"/>
        
        </form>
        
    </div>
    
</div>
<script language="javascript">
$('#btnThongKe').click(function(e) {
	$('#showresult').html(loading);
    $.post("?route=sales/sale/reportView", 
		$("#frm_thongke").serialize(), 
		function(html)
		{
			$('#showresult').html(html);
		}
	);
});
$('#keyword').keyup(function(e) {
    if(e.keyCode == 13)
		$('#btnThongKe').click();
});
$('#btnSaveToExcel').click(function(e) {
	tableToExcel('reportbanhang', 'Ho Lan Solutions');
});
</script>