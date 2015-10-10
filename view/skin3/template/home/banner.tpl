
<?php if(@count($medias)){ ?>
	<div class="row carousel-holder">

                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                            	<?php foreach($medias as $key => $media) {?>
                                <li data-target="#carousel-example-generic" data-slide-to="<?php echo $key?>" <?php if($key==0) echo 'class="active"'; ?>></li>
                                <?php } ?>
                                
                            </ol>
                            <div class="carousel-inner">
                            	<?php foreach($medias as $key => $media) {?>
                                <div class="item <?php if($key==0) echo 'active'; ?>">
                                    <img class="slide-image" src="<?php echo $media['imagethumbnail']?>" alt="">
                                </div>
                                <?php } ?>
                                
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div>
<?php } ?>