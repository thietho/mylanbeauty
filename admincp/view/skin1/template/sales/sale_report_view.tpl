<table class="data-table">
    <thead>
        <tr>
            <th>Sản phẩm</th>
            <th>Code</th>
            
            <th>Tồn đầu kỳ</th>
            <th>Nhập</th>
            <th>Xuất</th>
            <th>Tồn cuối kỳ</th>
        </tr>
    </thead>
   
            <?php foreach($data_product as $media){ ?>
    <tr>
        <td>
            <?php echo @$this->document->productName($media)?>
        </td>
        <td>
            <?php echo @$media['barcode']?><br>
            Ref: <?php echo @$media['ref']?>
        </td>
        
        <td class="number"><?php echo @$media['tondauky']?></td>
        <td class="number"><?php echo @$media['nhaptrongky']?></td>
        <td class="number"><?php echo @$media['xuattrongky']?></td>
        <td class="number"><?php echo @$media['toncuoiky']?></td>
    </tr>
            <?php } ?>
        
    
</table>
 

	

