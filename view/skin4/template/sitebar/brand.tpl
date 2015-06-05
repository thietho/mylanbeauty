				<p class="lead"><?php echo $brand['categoryname']?></p>
                <div class="list-group">
                	<?php foreach($datas as $key => $item){?>
                    <a href="<?php echo $this->document->createLink('brand',$item['categoryid'])?>" title="<?php echo $item['categoryname']?>" class="list-group-item"><?php echo $item['categoryname']?></a>
                    <?php }?>
                    
                </div>