<div>
	<center>
		<p style="font-size:1.5em;font-weight:bold">Mylanbeauty.net</p>
        Địa chỉ: 193 Tuy Lý Vương, P.12, Q.8, Tp.HCM<br />
        ĐT: 0903 767 589<br />
        Email: cosmetics@mylanbeauty.net<br />
        Website: www.mylanbeauty.net
        <h2>PHIẾU GIAO HÀNG</h2>
        Số: <?php echo $order['orderid']?>
    </center>
    <p>
    	
        <table>
        	<tr>
            	<td width="50%"><label>Người mua hàng:</label> <?php echo $order['customername']?></td>
                <td><label>Số điện thoại:</label> <?php echo $order['phone']?></td>
            </tr>
        </table>
    </p>
    <p>
    	<table>
        	<tr>
            	<td width="50%"><label>Người liên hệ:</label> <?php echo $order['customername']?></td>
                <td><label>Số điện thoại:</label> <?php echo $order['receiverphone']?></td>
            </tr>
        </table>
    	
       	
    </p>
    
    <p>
    	<label>Địa chỉ:</label> <?php echo $order['shipperat']?>
    </p>
    <p>
        <table class="table-data">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Thành tiền</th>
                </tr>
            </thead>
            <tbody>
            <?php 
            $sum = 0;
            foreach($detail as $key => $item)
            {
                $sum += $item['subtotal'];
            ?>
                <tr>
                    <td align="center"><?php echo $key +1 ?></td>
                    <td><?php echo $item['title']?></td>
                    <td class="number"><?php echo $this->string->numberFormate($item['quantity'])?></td>
                    <td class="number"><?php echo $this->string->numberFormate($item['price'])?></td>
                    <td class="number"><?php echo $this->string->numberFormate($item['subtotal'])?></td>
                </tr>
            <?php } ?>
            </tbody>
            <tfoot>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>Tổng cộng:</td>
                    <td class="number"><?php echo $this->string->numberFormate($sum)?></td>
                </tr>
            </tfoot>
        </table>

    </p>
    <p style="text-align:right;margin:6px 0">
    	Ngày <?php echo $this->date->now['mday']?> tháng <?php echo $this->date->now['mon']?> năm <?php echo $this->date->now['year']?>
    </p>
    <p>
    	<table>
        	<tr>
            	<th>
                	Người nhận hàng
                </th>
                <th>
                	Đã nhận đủ tiền
                </th>
                <th>
                	Người lập phiếu
                </th>
            </tr>
        </table>
    </p>
</div>