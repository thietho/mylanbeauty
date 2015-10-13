<div class="col-md-4 col-md-offset-4">
	<p>
        <?php echo @$member['fullname']?> (<?php echo @$member['username']?>)
    </p>
    <p>
        <a href="<?php echo @$this->document->createLink('memberinfor')?>">Thông tin cá nhân</a>
    </p>
    <p>
        <a href="<?php echo @$this->document->createLink('changepass')?>">Đổi mật khẩu</a>
    </p>
    <p>
        <a href="<?php echo @$this->document->createLink('historyorder')?>">Lịch sử mua hàng</a>
    </p>
    <!--<p>
        <a href="<?php echo @$this->document->createLink('message')?>">Hộp thư</a>
    </p>-->
    <p>
        <a href="#" onclick="logout()">Đăng xuất</a>
    </p>
</div>