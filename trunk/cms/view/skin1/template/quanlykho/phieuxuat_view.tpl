<h3 style="text-align:center">Phiếu bán hàng</h3>
<p style="text-align:center">Ngày <?php echo $this->date->getDay($item['ngaylap'])?> tháng <?php echo $this->date->getMonth($item['ngaylap'])?> năm <?php echo $this->date->getYear($item['ngaylap'])?></p>
<p style="text-align:center">
	<label>Số:</label> <?php echo $item['maphieu']?>
</p>
<p>
	<label>Người bán:</label> <?php echo $item['nguoithuchien']?>
</p>
<p>
	
	<label>Khách hàng:</label> <?php echo $item['nguoinhan']?>
</p>
<p>
	<label>Ghi chú:</label> <?php echo $item['ghichu']?>
</p>
<table class="table-data">
	<thead>
        <tr>
            <th>STT</th>
            <th>Sản phẩm</th>
            <th>Số lượng</th>
            <th>Đơn vị</th>
            <th>Giá nhập</th>
            <th>Thành tiên</th>
        </tr>
    </thead>
    <tbody>
    	
        <?php foreach($data_nhapkho as $key =>$val){ ?>
            
        <tr>
            <td><center><?php echo $key+1?></center></td>
            <td><?php echo $val['title']?></td>
            <td class="number"><?php echo $this->string->numberFormate($val['soluong'])?></td>
            <td><?php echo $this->document->getDonViTinh($val['madonvi'])?></td>
            <td class="number"><?php echo $this->string->numberFormate($val['giatien'])?></td>
            <td class="number"><?php echo $this->string->numberFormate($val['thanhtien'])?></td>
            
        </tr>
        <?php } ?>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td class="number">Tổng tiền</td>
            <td class="number"><?php echo $this->string->numberFormate($item['tongtien'])?></td>
        </tr>
    </tbody>
</table>
<table style="margin:15px 0">
	<tr>
    	
        <th width="20%">Người lập phiếu</th>
        <th width="20%">Khách hàng</th>
        <th width="20%">Thủ quỷ</th>
    </tr>
    <tr>
    	
        <td align="center"><i>(Ký, Họ tên)</i></td>
        <td align="center"><i>(Ký, Họ tên)</i></td>
        <td align="center"><i>(Ký, Họ tên)</i></td>
    </tr>
</table>
<div style="height:80px"></div>

         