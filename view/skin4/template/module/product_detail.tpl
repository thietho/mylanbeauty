

        
        
			<h2>
                <?php echo $this->document->productName($post['mediaid'])?>
            </h2>
            <div class="ui-grid-a ui-responsive">
            	<div class="ui-block-a">
                	<div class="jqm-block-content">
                    	<img style="width:100%" src="<?php echo $post['imagepreview']?>" alt="<?php echo $this->document->productName($post)?>">
                    </div>
                </div>
                <div class="ui-block-b">
                	<ul>
                        <li>
                            <strong>Loại sản phẩm:</strong>
                            <?php foreach($loaisp as $it){ ?>
                            <strong><?php echo $it['sitemapname'].' '; ?></strong>
                            <?php } ?>
                        </li>
                        <li>
                            <strong>Nhãn hiệu: <a class="brand" href="<?php echo $this->document->createLink('brand',$post['brand'])?>" title="<?php echo $this->document->getCategory($post['brand'])?>"><?php echo $this->document->getCategory($post['brand'])?></a></strong>
                        </li>
                        <?php if($post['color'] != ""){ ?>
                        <li>
                            <strong>Màu: <?php echo $post['color']?></strong>
                                
                        </li>
                        <?php } ?>
                        <?php if(count($priceproduct) == 0){ ?>
                        <li><strong>Giá:</strong>
                                <?php $cls = '';?>
                                <?php if($post['pricepromotion']!=0){ ?>
                                <?php $cls = 'product-price-no';?>
                                <span class="product-pricepromotion">
                                <?php echo $this->string->numberFormate($post['pricepromotion'])?> <?php echo $this->document->setup['Currency']?>
                                </span>
                                <?php } ?>
                                <?php if($post['price']){ ?>
                                <span  class="product-price <?php echo $cls?>"><?php echo $this->string->numberFormate($post['price'])?> <?php echo $this->document->setup['Currency']?></span>
                                <?php }else{ ?>
                                Giá đang cập nhật
                                <?php }?>
                                <input type="button" class="btn btn-default" onclick="cart.add('<?php echo $post['mediaid']?>')" value="Đặt hàng">
                         </li>
                        <?php } ?>
                    </ul>
                    <?php echo $post['summary']?>
                </div>
            </div>
            

            <div>
            	
            	
                <?php if(count($data_samplecode)>1){ ?>
                <p>
                    <?php foreach($data_samplecode as $key => $item){?>
                    <a href="<?php echo $this->document->createLink($this->document->sitemapid,$item['alias'])?>" title="<?php echo $item['color']?>"><img src="<?php echo $item['icon']?>" /></a>
                    <?php } ?>
                </p>
                <?php } ?>
                
            </div>
			<div class="col-md-12">
            	<?php echo $post['description']?>
                <?php if(count($priceproduct)){ ?>
                <div id="listprice">
                    <table class="ui-responsive ui-table ui-table-reflow">
                        <thead>
                            <tr>
                                <th>Sẩn phẩm</th>
                                <th>Giá bán</th>
                                <th>Giảm</th>
                                <th>Khuyến mãi</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            
                            <?php foreach($priceproduct as $val){ ?>
                            <tr>
                                <td>
                                	<?php echo $this->document->productName($val)?>
                                    
                                    <?php if($val['noteprice']!=""){ ?>
                                        (<?php echo $val['noteprice']?>)
                                    <?php }?>
                                    <?php if($val['tenkhuyenmai']){ ?>
                                    <p class="ben-khuyenmai"><a  onclick="xemkhuyenmai('<?php echo $val['makhuyenmai']?>')"><?php echo $val['tenkhuyenmai']?></a></p>
                                    <?php } ?>
                                </td>
                                
                                <td class="number">
                                    <?php $cls = '';?>
                                        <?php if($val['pricepromotion']!=0){ ?>
                                        <?php $cls = 'product-price-no';?>
                                    <?php } ?>
                                    <?php if($val['price']!=0){ ?>
                                    <span class="<?php echo $cls?>"><?php echo $this->string->numberFormate($val['price'])?><?php echo $this->document->setup['Currency']?></span>
                                    <?php } ?>
                                </td>
                                <td class="number">
                                    <?php if($val['discountpercent']!=0){ ?>
                                    <span class="product-pricepromotion">
                                    -<?php echo $this->string->numberFormate($val['discountpercent'])?>%
                                    </span>
                                    <?php } ?>
                                </td>
                                <td class="number">
                                    <?php if($val['pricepromotion']!=0){ ?>
                                    <span class="product-pricepromotion">
                                    <?php echo $this->string->numberFormate($val['pricepromotion'])?><?php echo $this->document->setup['Currency']?>
                                    </span>
                                    <?php } ?>
                                </td>
                                <td><input type="button" class="ui-btn" onclick="cart.add('<?php echo $val['mediaid']?>')" value="Đặt hàng"></td>
                            </tr>
                            <?php } ?>
                            
                        </tbody>
                    </table>
                </div>
                <?php }?>
            </div>
        