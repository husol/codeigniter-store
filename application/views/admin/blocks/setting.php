<form class="form-account" action="<?=$this->admin_url?>update_settings" method="POST">
	<div class="sec-wrapper clearfix">
		<div class="form-group-custom clearfix">
			<label class="col-xs-12 col-sm-4">Logo:</label>
			<div class="col-xs-12 col-sm-8 input-group no-padding">
				<input id="logo" type="text" name="logo" class="form-control input-sm pasted-url" required value="<?=$data['logo']?>"/>
				<span class="input-group-btn">
					<a class="btn btn-default btn-sm btn-browse a-block padding-5-10" data-fancybox-type="iframe" href="<?=$this->admin_url?>get_uploader?full=logo&target=null&alt=null">...</a>
				</span>
			</div>
		</div>
		<div class="form-group-custom clearfix">				
			<label class="col-xs-12 col-sm-4">Site name:</label>
			<div class="col-xs-12 col-sm-8">
				<input type="text" name="sitename" class="form-control input-sm" required value="<?=$data['sitename']?>"/>
			</div>
		</div>	
		<div class="form-group-custom clearfix">				
			<label class="col-xs-12 col-sm-4">Site title:</label>
			<div class="col-xs-12 col-sm-8">
				<input type="text" name="title" class="form-control input-sm" required value="<?=$data['title']?>"/>
			</div>
		</div>	
		<div class="form-group-custom clearfix">				
			<label class="col-xs-12 col-sm-4">Meta description:</label>
			<div class="col-xs-12 col-sm-8">
				<textarea name="metadescription" rows="3" class="form-control input-sm" required><?=$data['metadescription']?></textarea>
			</div>
		</div>	
		<div class="form-group-custom clearfix">				
			<label class="col-xs-12 col-sm-4">Meta keywords:</label>
			<div class="col-xs-12 col-sm-8">
				<textarea name="metakeyword" rows="5" class="form-control input-sm" required><?=$data['metakeyword']?></textarea>
			</div>
		</div>
	</div>
	<div class="sec-wrapper clearfix">
		<div class="form-group-custom clearfix">				
			<label class="col-xs-12 col-sm-4">Received mail:</label>
			<div class="col-xs-12 col-sm-8">
				<input type="email" name="email_receiver" class="form-control input-sm" required value="<?=$data['email_receiver']?>"/>
			</div>
		</div>
	</div>
	<div class="sec-wrapper clearfix">
		<div class="form-group-custom clearfix">				
			<label class="col-xs-12 col-sm-4">Facebook profile:</label>
			<div class="col-xs-12 col-sm-8">
				<input type="text" name="fb_profile" class="form-control input-sm" value="<?=$data['fb_profile']?>"/>
			</div>
		</div>			
	</div>
	<div class="sec-wrapper clearfix">
		<div class="form-group-custom clearfix">				
			<label class="col-xs-12 col-sm-4">Public item per page:</label>
			<div class="col-xs-12 col-sm-8">
				<input type="text" name="ppp" class="form-control input-sm" required value="<?=$data['ppp']?>"/>
			</div>
		</div>	
		<div class="form-group-custom clearfix">				
			<label class="col-xs-12 col-sm-4">Admin item per page:</label>
			<div class="col-xs-12 col-sm-8">
				<input type="text" name="ipp" class="form-control input-sm" required value="<?=$data['ipp']?>"/>
			</div>
		</div>	
	</div>
	<div class="site-btn-wrapper">
		<input type="submit" id="update-config" name="update_config" class="btn btn-sm btn-primary btn-config" value="Update"/>
		<input type="button" class="btn btn-sm btn-warning" value="Cancel"/>
	</div>
</form>
<script>

</script>
