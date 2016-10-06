<div class="section">

	<div class="section-title"><?php echo @$this->document->title?></div>
    
    <div class="section-content">
    	<h3>Số lượng sản phẩm đang tồn kho tính đến ngày <?php echo @$this->date->formatMySQLDate(@$this->date->getTodayNoTime())?></h3>
		<table class="data-table">
            
            <tr>
                
                <th>Tên sản phẩm</th>
                
                <th>Tồn kho</th>
                <th>Tồn tại shop</th>
                <th>Tồn kho</th>
            </tr>

            <?php foreach($medias as $brand => $data){ ?>
            <tr>
                <td><strong><?php echo $this->document->getCategory($brand)?></strong></td>
            </tr>
                <?php foreach($data as $media){ ?>
			<tr>
            	
                <td><?php echo $this->document->productName($media)?></td>
                
                <td class="number"><?php echo $media['inventory']?></td>
                <td class="number"><?php echo $media['shopinventory']?></td>
                <td class="number"><?php echo $media['khoinventory']?></td>
            </tr>
            	<?php } ?>
            <?php } ?>

        </table>    	
        
        
    </div>
    
</div>
