<?php foreach($datas as $key => $item){?>
	<?php if($key > 1) echo "|";?>
    <a href="<?php echo HTTP_SERVER?>site/<?php echo $this->member->getSiteId()?>/brand/<?php echo $item['categoryid']?>"><?php echo $item['categoryname']?></a>
<?php } ?>