
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
                <a class="navbar-brand" href="#">Mỹ Lan Beauty</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="<?php echo $this->document->createLink('gioithieu')?>" title="Giới thiệu">Giới thiệu</a>
                    </li>
                    <li>
                        <a href="<?php echo $this->document->createLink('cach-thuc-mua-hang')?>" title="Cách thức mua hàng">Cách thức mua hàng</a>
                    </li>
                    <li>
                        <a href="<?php echo $this->document->createLink('cart')?>" title="Giỏ hàng">Giỏ hàng</a>
                    </li>
                    <li class="dropdown" style="position:relative">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Click Here <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a class="trigger right-caret">Level 1</a>
                                <ul class="dropdown-menu sub-menu">
                                    <li><a href="#">Level 2</a></li>
                                    <li>
                                        <a class="trigger right-caret">Level 2</a>
                                        <ul class="dropdown-menu sub-menu">
                                            <li><a href="#">Level 3</a></li>
                                            <li><a href="#">Level 3</a></li>
                                            <li>
                                                <a class="trigger right-caret">Level 3</a>
                                                <ul class="dropdown-menu sub-menu">
                                                    <li><a href="#">Level 4</a></li>
                                                    <li><a href="#">Level 4</a></li>
                                                    <li><a href="#">Level 4</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Level 2</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Level 1</a></li>
                            <li><a href="#">Level 1</a></li>
                        </ul>
                    </li>
                    
                    
                    <?php if(!$this->member->isLogged()){?>
                    <li>
                        <a href="<?php echo $this->document->createLink('login')?>" title="Đăng nhập">Đăng nhập</a>          
                    </li>
                    <li>
                        <a href="<?php echo $this->document->createLink('register')?>" title="Đăng ký">Đăng ký</a>          
                    </li>
                    <?php }else{ ?>
                    <li>
                        <a href="<?php echo $this->document->createLink('member')?>" title="Thông tin thành viên"><?php echo $this->document->getUser($this->member->getUserName())?></a>          
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
