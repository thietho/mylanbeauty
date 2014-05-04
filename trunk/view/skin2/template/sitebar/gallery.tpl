

<link rel="stylesheet" type="text/css" href="<?php echo HTTP_SERVER.DIR_CSS?>sagscroller.css" />

<script src="<?php echo HTTP_SERVER.DIR_JS?>sagscroller.js">

/***********************************************
* SAG Content Scroller- © Dynamic Drive DHTML code library (www.dynamicdrive.com)
* Visit http://www.dynamicDrive.com for hundreds of DHTML scripts
* This notice must stay intact for legal use
***********************************************/

</script>

<style type="text/css">

/* #SAG scroller demo #2 */

div#mysagscroller2{
width: 190px; /*width of scroller*/
height:500px;

}

div#mysagscroller2 ul li img{
border-width:0;
display:block; /*this causes each image to be flush against each other*/
}

</style>

<script>

var sagscroller_constants={
	navpanel: {height:'16px', downarrow:'<?php echo HTTP_SERVER.DIR_IMAGE?>down.gif', opacity:0.6, title:'Go to Next Content', background:'black'},
	loadingimg: {src:'<?php echo HTTP_SERVER.DIR_IMAGE?>ajaxloading.gif', dimensions:[100,15]}
}
//SAG scroller demo #2:

var sagscroller2=new sagscroller({
	id:'mysagscroller2',
	mode: 'auto',
	pause: 2500,
	animatespeed: 400 //<--no comma following last option
})

</script>
<div class="ben-section">
    <div class="ben-section-content">
    	
        <div id="mysagscroller2" class="sagscroller">
            <ul>
                <?php echo $sanphammoi['data']?>
            </ul>
        </div>
    </div>
    
</div>
