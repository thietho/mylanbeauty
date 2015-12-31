<div class="ben-section">
    <form id="ben-searchform" class="ben-section-content" action="<?php echo @$this->document->createLink('product')?>">
    	<div class="ben-section-title">Tìm kiếm sản phẩm</div>
        <p>
            <select name="loaisp" id="loaisp">
                <option value="">Loại sản phẩm</option>
                <?php foreach($loaisp as $it){ ?>
                <option value="<?php echo @$it['sitemapid']?>"><?php echo @$this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo @$it['sitemapname']?></option>                        
                <?php } ?>
            </select>
        </p>
        <!--<p>
            <select name="nhomhuong" id="nhomhuong">
                <option value="">Nhóm hương</option>
                <?php foreach($nhomhuong as $it){ ?>
                <option value="<?php echo @$it['categoryid']?>"><?php echo @$this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo @$it['categoryname']?></option>                        
                <?php } ?>
            </select>
        </p>-->
        <p>
            <select name="nhanhieu" id="nhanhieu">
                <option value="">Nhãn hiệu</option>
                <?php foreach($nhanhieu as $it){ ?>
                <option value="<?php echo @$it['categoryid']?>"><?php echo @$this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo @$it['categoryname']?></option>                        
                <?php } ?>
            </select>
        </p>
        <p>
            <select name="gia" id="gia">
                <option value="">Chọn giá</option>
                <?php foreach($gia as $it){ ?>
                <option value="<?php echo @$it['categoryid']?>"><?php echo @$this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo @$it['categoryname']?></option>                        
                <?php } ?>
            </select>
        </p>
    	<input type="text" class="ben-textbox" id="keyword" name="keyword" >
        <input type="submit" class="ben-button" id="btnSearch" value="Tìm">
    </form>
</div>
<script language="javascript">

$("#loaisp").val("<?php echo @$_GET['loaisp']?>");
$("#nhomhuong").val("<?php echo @$_GET['nhomhuong']?>");
$("#nhanhieu").val("<?php echo @$_GET['nhanhieu']?>");
$("#gia").val("<?php echo @$_GET['gia']?>");
$("#keyword").val("<?php echo urldecode(@$_GET['keyword'])?>");
</script>