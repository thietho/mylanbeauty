	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<?php echo HTTP_SERVER?>" title="Trang chủ">Trang chủ</a>
            </div>
            
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="<?php echo @$this->document->createLink('gioithieu')?>" title="Giới thiệu">Giới thiệu</a>
                        
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" title="Sản phẩm">Sản phẩm <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                        	<li><a href="#">Action</a></li>
                        	<li><a href="#">Another action</a></li>
                        	<li><a href="#">Something else here</a></li>
                        	<li class="divider"></li>
                        	<li class="dropdown-header">Nav header</li>
                        	<li><a href="#">Separated link</a> <span class="caret"></span></li>
                        	<li><a href="#">One more separated link</a></li>
                      	</ul>
                    </li>
                    
                    
                    <?php if(!$this->member->isLogged()){?>
                    <li>
                        <a href="<?php echo @$this->document->createLink('login')?>" title="Đăng nhập">Đăng nhập</a>          
                    </li>
                    <li>
                        <a href="<?php echo @$this->document->createLink('register')?>" title="Đăng ký">Đăng ký</a>          
                    </li>
                    <?php }else{ ?>
                    <li>
                        <a href="<?php echo @$this->document->createLink('member')?>" title="Thông tin thành viên"><?php echo @$this->document->getUser($this->member->getUserName())?></a>          
                    </li>
                    <li>
                        <a href="#" onclick="logout()" title="Đăng xuất">Đăng xuất</a>          
                    </li>
                    <?php }?>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
