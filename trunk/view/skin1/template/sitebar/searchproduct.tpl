<div class="ben-section">
    <div id="ben-searchform" class="ben-section-content">
    	<div class="ben-section-title">Tìm kiếm sản phẩm</div>
        <p>
            <select name="loaisp" id="loaisp">
                <option value="">Loại sản phẩm</option>
                <?php foreach($loaisp as $it){ ?>
                <option value="<?php echo $it['categoryid']?>"><?php echo $this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo $it['categoryname']?></option>                        
                <?php } ?>
            </select>
        </p>
        <p>
            <select name="nhomhuong" id="nhomhuong">
                <option value="">Nhóm hương</option>
                <?php foreach($nhomhuong as $it){ ?>
                <option value="<?php echo $it['categoryid']?>"><?php echo $this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo $it['categoryname']?></option>                        
                <?php } ?>
            </select>
        </p>
        <p>
            <select name="nhanhieu" id="nhanhieu">
                <option value="">Nhãn hiệu</option>
                <?php foreach($nhanhieu as $it){ ?>
                <option value="<?php echo $it['categoryid']?>"><?php echo $this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo $it['categoryname']?></option>                        
                <?php } ?>
            </select>
        </p>
        <p>
            <select name="gia" id="gia">
                <option value="">Chọn giá</option>
                <?php foreach($gia as $it){ ?>
                <option value="<?php echo $it['categoryid']?>"><?php echo $this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo $it['categoryname']?></option>                        
                <?php } ?>
            </select>
        </p>
    	<input type="text" class="ben-textbox" id="txt_search" name="txt_search" value="<?php echo $_GET['keyword']?>">
        <input type="button" class="ben-button" id="btnSearch" value="Tìm">
    </div>
</div>
<script language="javascript">
$("#btnSearch").click(function(){
	var keyword = trim($("#txt_search").val()," ");
	if(keyword!="")
		window.location = HTTP_SERVER+"site/<?php echo $this->member->getSiteId()?>/search/keyword/"+keyword;							   
});
</script>