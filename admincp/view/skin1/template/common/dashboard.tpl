<div class="section" id="sitemaplist">

	<div class="section-title"><?php echo @$dash_header ?></div>
    
    <div class="section-content padding1">
    
    	<form name="frm" id="frm" action="<?php echo @$action?>" method="post" enctype="multipart/form-data">
        
        	<div class="button right">
            	<input type="button" value="<?php echo @$button_save ?>" class="button" onClick="save()"/>   
     	        <input type="hidden" name="mediaid" value="<?php echo @$item['mediaid']?>">
                
            </div>
            <div class="clearer">^&nbsp;</div>
        	<div id="error" class="error" style="display:none"></div>
        	<div>
            	<h3><?php echo @$dash_infor_header ?></h3><br />
            	<p>
            		<label><?php echo @$dash_title ?></label><br />
					<input type="text" name="Title" value="<?php echo @$item['Title']?>" class="text" size=60 />
            	</p>
                <p>
            		<label><?php echo @$dash_slogan ?></label><br />
					<input type="text" name="Slogan" value="<?php echo @$item['Slogan']?>" class="text" size=60 />
            	</p>
                  
                <p>
            		<label><?php echo @$dash_currency ?></label><br />
					<input type="text" name="Currency" value="<?php echo @$item['Currency']?>" class="text" size=60 />
            	</p>
                
                <p>
            		<label><?php echo @$dash_email ?></label><br />
					<input type="text" name="EmailContact" value="<?php echo @$item['EmailContact']?>" class="text" size=60 />
            	</p>
                <p>
                    <label>Tiêu đê phiếu</label><br />
                    <textarea name="HeaderBill"><?php echo @$item['HeaderBill']?></textarea>
                        
                </p>
                <p>
                    <label>Keyword</label><br />
                    <textarea name="Keyword"><?php echo @$item['Keyword']?></textarea>
                        
                </p>
				<p>
                    <label>Mô tả</label><br />
                    <textarea name="Description"><?php echo @$item['Description']?></textarea>
                        
                </p>
            </div>
            <div>
                <label>Sản phẩm ưu đãi</label>
            	<table class="data-table">
                    <thead>
                        <tr class="tr-head">
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>Phần trăm giảm</th>
                            <th>Hình</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody id="listproducgoodwill">

                    </tbody>
            	</table>
                <input type="button" class="button" id="btnSelectProduct" value="Chọn sản phẩm">

            </div>
        </form>
    
    </div>
    
</div>

<script language="javascript">

function save()
{
	$.blockUI({ message: "<h1><?php echo @$announ_infor ?></h1>" }); 
	/*var oEditor = CKEDITOR.instances['editor1'] ;
	var pageValue = oEditor.getData();
	$('textarea#editor1').val(pageValue);*/
	$.post("?route=common/dashboard/save", $("#frm").serialize(),
		function(data){
			if(data == "true")
			{
				//window.location.reload();
			}
			$.unblockUI();
		}
	);
}
$('#btnSelectProduct').click(function () {
    browseProduct('addProductRow()');
});

var index = 0;
function addProductRow()
{
    $('.selectProduct').click(function(e) {
        var obj = new Object();
        obj.id = 0;
        obj.mediaid = $(this).attr('ref');
        obj.imagepath = $(this).attr('image');
        obj.title = $(this).attr('title');
        obj.code = $(this).attr('code');
        obj.unit = $(this).attr('unit');
        //console.log(obj.mediaid);
        obj.price = $(this).attr('price');

        obj.pricepromotion = $(this).attr('pricepromotion');
        obj.discountpercent = $(this).attr('discountpercent');
        obj.productname = $(this).attr('productname');
        obj.brandname = $(this).attr('brandname');

        $("#popupbrowseproduct").dialog("close");

        var str =createRow(obj)
        $('#listproducgoodwill').append(str);
        index++;
    });

}
function createRow(obj)
{
    var str ='<tr id="row'+index+'">';
    str += '<td><input type="hidden" id="product'+index+'" name="product['+index+']" value="'+obj.mediaid+'"/><span id="product'+index+'_name">'+obj.productname+'</span></td>';
    str += '<td class="number">'+ obj.price+'</td>';
    str += '<td class="number">'+ obj.discountpercent+'%</td>';
    str += '<td><img id="product'+index+'_icon" src="'+obj.imagepath+'"/></td>';
    str += '<td><input type="button" class="button" value="X" onclick="$(\'#row'+index+'\').remove()"/></td>';
    str += '</tr>';
    return str;
}
<?php foreach($ListProductGoodWill as $media){ ?>
    var obj = new Object();
    obj.id = 0;
    obj.mediaid = "<?php echo $media['mediaid']?>";
    obj.imagepath = "<?php echo $media['imagepreview']?>";
    obj.title = "<?php echo $media['title']?>";
    obj.code = "<?php echo $media['code']?>";
    obj.unit = "<?php echo $media['unit']?>";
    //console.log(obj.mediaid);
    obj.price = "<?php echo $media['price']?>";

    obj.pricepromotion = "<?php echo $media['pricepromotion']?>";
    obj.discountpercent = "<?php echo $media['discountpercent']?>";
    obj.productname = "<?php echo $this->document->productName($media)?>";
    obj.brand = "<?php echo $media['brand']?>";



    var str =createRow(obj)
    $('#listproducgoodwill').append(str);
    index++;
<?php } ?>
</script>
