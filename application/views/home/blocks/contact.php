<div id="contact-form-wrapper" class="sec-wrapper sec-sepa clearfix">
	<div id="sec-header-contact" class="sec-header"><i class="fa fa-envelope"></i><h1><?php echo lang('contact_us')?></h1></div>
    <div class="sec-wrapper col-xs-5 clearfix" style="padding-left: 50px; padding-top: 50px">
        <strong>CÔNG TY TNHH SX ĐỒNG PHỤC HOÀN MỸ</strong><br><br />
        <strong>Đ/c:</strong> 9th Building 68 Nguyễn Huệ, P. Bến Nghé, Q.1, Tp. HCM<br><br />
        <strong>Điện thoại:</strong> 08 888 369 53<br><br />
        <strong>Email:</strong> <a href="mailto:hoanmyfashion@gmail.com">hoanmyfashion@gmail.com</a><br><br />
        <strong>Website:</strong> www.dongphuchoanmy.com
    </div>
	<div class="sec-wrapper col-xs-7 clearfix padding-10">
        <form action="<?php echo $this->lgPath?>submit_form" method="POST">
			<div class="sec-wrapper clearfix">
				<div class="col-xs-12 form-group-custom clearfix">				
					<label class="col-xs-12 col-sm-4"><?php echo lang('full_name')?></label>
					<div class="col-xs-12 col-sm-8">
						<input type="text" name="s_name" class="form-control input-sm" placeholder="-- <?php echo lang('full_name')?> --"/>
					</div>
				</div>
				<div class="col-xs-12 form-group-custom clearfix">				
					<label class="col-xs-12 col-sm-4"><?php echo lang('phone_number')?></label>
					<div class="col-xs-12 col-sm-8">
						<input type="text" name="s_mobi" class="form-control input-sm" placeholder="-- <?php echo lang('phone_number')?> --"/>
					</div>
				</div>
				<div class="col-xs-12 form-group-custom clearfix">				
					<label class="col-xs-12 col-sm-4">Email</label>
					<div class="col-xs-12 col-sm-8">
						<input type="email" name="s_email" class="form-control input-sm" placeholder="-- Email --"/>
					</div>
				</div>
				<div class="col-xs-12 form-group-custom clearfix">				
					<label class="col-xs-12 col-sm-4"><?php echo lang('title')?></label>
					<div class="col-xs-12 col-sm-8">
						<input type="text" name="s_title" class="form-control input-sm" placeholder="-- <?php echo lang('title')?> --"/>
					</div>
				</div>
				<div class="col-xs-12 form-group-custom clearfix">				
					<label class="col-xs-12 col-sm-4"><?php echo lang('content')?></label>
					<div class="col-xs-12 col-sm-8">
						<textarea rows="5" name="s_content" class="form-control input-sm" placeholder="-- <?php echo lang('content')?> --"></textarea>
					</div>
				</div>				
			</div>
			<div class="site-btn-wrapper clearfix">				
				<input type="submit" id="form-submit" name="submit" class="btn btn-sm btn-custom btn-custom-4 padding-5-10" value="<?php echo lang('contact_submit')?>"/>
			</div>
        </form>
	</div>
	<iframe src="https://www.google.com/maps/d/embed?mid=1-bR_Cat3X2LH12vNnZ87hz-f9RU&ll=10.774859896822027%2C106.70322064047548&z=19" width="100%" height="500" frameborder="0" style="border:0" allowfullscreen></iframe>
	<?php if(isset($data)) { ?>
		<div class="font-arial margin-20-0 clearfix"><?=$data->p_content?></div>
	<?php }?>
</div>