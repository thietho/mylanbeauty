
<ul class="ben-brand">
<?php foreach($datas as $key => $item){?>
	<?php if($item['parent'] == "nhanhieu"){ ?>
	<li>
    	<?php if($item['categoryid'] != 'brandother'){ ?>
        <a href="<?php echo $this->document->createLink('brand',$item['categoryid'])?>" title="<?php echo $item['categoryname']?>"><?php echo $item['categoryname']?></a>
        <?php }else{ ?>
        <a title="<?php echo $item['categoryname']?>">...</a>
        <?php } ?>
        <?php 
        	$arr = $this->string->array_Filter($datas,'parent',$item['categoryid']);
            if(count($arr))
            {
        ?>
        <ul class="ben-subbrand">
        <?php
        		foreach($arr as $val)
                {
        ?>
        	<li>
            	<a href="<?php echo $this->document->createLink('brand',$val['categoryid'])?>" title="<?php echo $val['categoryname']?>"><?php echo $val['categoryname']?></a>
            </li>
        <?php
                }
        ?>
        </ul>	
        
        
        <?php
            }
        ?>
    </li>
<?php } ?>
	<?php } ?>
	<div class="clearer">&nbsp;</div>
</ul>
<script language="javascript">
$(".ben-brand li").hover(
	function(){
		$(this).children(".ben-subbrand").show();
	},
	function(){
		$(this).children(".ben-subbrand").hide();
	}
);
</script>