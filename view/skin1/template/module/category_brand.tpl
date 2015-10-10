<style>
.ben-brand
{
	list-style-type:none;	
}
.ben-brand li
{
	float:left;	
	margin-left:5px;
}
.ben-subbrand
{
	list-style-type:none;
	display:none;
	position:absolute;	
	background:#000000;
}
.ben-subbrand li
{
	float:none;	
	padding:5px;
}
</style>
<ul class="ben-brand">
<?php foreach($datas as $key => $item){?>
	<?php if($item['parent'] == "nhanhieu"){ ?>
	<li>
        <?php if($key > 1) echo "|";?>
        <a href="<?php echo HTTP_SERVER?>site/<?php echo $this->member->getSiteId()?>/brand/<?php echo $item['categoryid']?>"><?php echo $item['categoryname']?></a>
        <?php 
        	$arr = $this->string->array_Filter($datas,'parent',$item['categoryid']);
            if(@count($arr))
            {
        ?>
        <ul class="ben-subbrand">
        <?php
        		foreach($arr as $val)
                {
        ?>
        	<li>
            	<a href="<?php echo HTTP_SERVER?>site/<?php echo $this->member->getSiteId()?>/brand/<?php echo $val['categoryid']?>"><?php echo $val['categoryname']?></a>
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