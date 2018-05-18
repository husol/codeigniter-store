			<?php if(isset($partners)){?>
				<div class="container partners-wrapper clearfix">
					<div class="sec-header narrow clearfix">
						<i class="fa fa-user-plus"></i>
						<h2><?php echo lang('partners');?></h2>
					</div>
					<div id="partners-carousel" class="partners-carousel clearfix">
							<?php foreach($partners as $partner){?>
									<a href="<?php echo $partner->pt_link?>">
										<img style="float: left;" src="<?php echo vurl(str_replace(base_url(), '', $partner->pt_img))?>" alt="<?php echo $partner->pt_name?>"/>
									</a>
							<?php }?>
					</div>
				</div>
			<?php }?>
			<div class="clr clearfix"></div>
			<div id="overlay"></div>
		</div>
		<footer>
			<div class="container">
				<div class="col-md-5">
					<b>CÔNG TY TNHH SX ĐỒNG PHỤC HOÀN MỸ</b>
					<br/><b>MST:</b> 0314074115
					<br/><b>Địa chỉ:</b> 9th Building 68 Nguyễn Huệ, P. Bến Nghé, Q.1, Tp. HCM
					<br/><b>Hotline:</b> 0888 836 953
					<br/><b>Email:</b> <a href="mailto:hoanmyfashion@gmail.com">hoanmyfashion@gmail.com</a>
					<br/><b>Website:</b> <a href="<?php echo base_url(); ?>">www.dongphuchoanmy.com</a>
					<br/><b>Xưởng:</b> số 30 TH8 Bà Điểm Hóc Môn Tp HCM
				</div>
				<div class="col-md-3 hidden-sm">
					<b>SẢN PHẨM - DỊCH VỤ</b>
					<?php
						foreach($this->mainmenu as $menu) {
							if(isset($menu['children'])) {
								foreach($menu['children'] as $index => $sub_menu) {
									if($index == 2){
										$sub_menu[0] = explode(",", $sub_menu[0])[0];
									}
								?>
										<br/><a href="<?php echo base_url($this->lgPath.$sub_menu[1])?>"><?php echo $sub_menu[0]?></a>
					<?php	}
							}
						}
					?>
				</div>
				<div class="col-md-4 hidden-sm">
					<b>CHÍNH SÁCH ƯU ĐÃI</b>
					<br/>Thiết kế, may mẫu miễn phí
					<br/>Hỗ trợ đơn hàng ít, đơn hàng gấp
					<br/>Tư vấn hỗ trợ tận nơi
					<br/>Ưu đãi đặc biệt dành cho khách hàng thân thiết
					<br/>Giao hàng miễn phí toàn Tp. Hồ Chí Minh
				</div>
			</div>
		</footer>
		<script src="<?php echo vurl('asset/js/jquery-1.11.1.min.js')?>"></script>
		<script src="<?php echo vurl('asset/js/bootstrap.min.js')?>"></script>
		<?php if(isset($extra_js)){?>
			<?php foreach($extra_js as $js){?>
				<script src="<?php echo vurl('asset/js/'.$js)?>"></script>
			<?php }?>
		<?php }?>
		<script src="<?php echo vurl('asset/js/jquery.easing.1.3.js')?>"></script>
		<script src="<?php echo vurl('asset/js/camera.min.js')?>"></script>
		<script src="<?php echo vurl('asset/js/jquery.flexslider-min.js')?>"></script>
		<script src="<?php echo vurl('asset/js/jquery.elevatezoom.min.js')?>"></script>
		<script src="<?php echo vurl('asset/js/jquery.marquee.min.js')?>"></script>
		<script src="<?php echo vurl('asset/js/script.js')?>"></script>
	</body>
</html>