<form class="form-account" action="<?=$this->admin_url?>update_password" method="POST">
	<div class="form-group-custom clearfix">				
		<label class="col-xs-12 col-sm-6">Username:</label>
		<div class="col-xs-12 col-sm-6">
			 <p class="form-control-static color-navy no-margin"><b><?=$data->u_uname?></b></p>
		</div>
	</div>		
	<div class="sec-wrapper clearfix">
		<div class="form-group-custom clearfix">				
			<label class="col-xs-12 col-sm-6">New password:</label>
			<div class="col-xs-12 col-sm-6">
				<input type="password" name="u_pass" class="form-control input-sm" required />
			</div>
		</div>
		<div class="form-group-custom clearfix">				
			<label class="col-xs-12 col-sm-6">Confirm new password:</label>
			<div class="col-xs-12 col-sm-6">
				<input type="password" name="re_pass" class="form-control input-sm" required />
			</div>
		</div>
	</div>
	<div class="site-btn-wrapper">
		<input type="submit" id="update-password" name="update_password" class="btn btn-sm btn-primary btn-account" value="Update"/>
	</div>
</form>
<script>
	$(function(){
		var p1 = $('input[name="u_pass"]');
		var p2 = $('input[name="re_pass"]');	
		p2.on('input',function(){
			if(p1.val() != p2.val()){
				this.setCustomValidity('Password did not match');
			} else
				this.setCustomValidity('');
		})
	})
</script>