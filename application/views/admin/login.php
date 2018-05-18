<?php $this->load->view('admin/templates/header'); ?>
			<div id="wrapper" class="wrapper-full">
				<div class="main-col-wrapper">	
					<?php 
						if(isset($error)) {
					?>
						<div class="warning-wrapper text-center">
							<?php echo $error ?>
						</div>
					<?php } ?>

					<div id="login-wrapper">
						<form action="<?=$this->admin_url?>login" method="POST">
							<?php if(validation_errors()){ ?>
								<div class="warning-wrapper text-center">
									<?=validation_errors()?>
								</div>
							<?php }?>
							<label>Username</label>
							<input class="form-control" type="text" name="username" placeholder="Username">
							<label>Password</label>
							<input class="form-control" type="password" name="password" placeholder="Password">
							<div class="site-btn-wrapper clearfix">
								<div class="checkbox-inline margin-5-0 pull-left"><label><input type="checkbox" name="remember" value="1"><span>Remember me</span></label></div>
								<div class="col pull-right"><input type="submit" id="submit" name="login" class="btn btn-sm btn-primary" value="Log in"/></div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<footer>
			In case of difficulty, please contact
			<a href="mailto:enquiry@husol.org">enquiry@husol.org</a><br>
			Copyright © <?php echo date("Y"); ?> by <a href="http://husol.org" target="_blank">Husol Organization.</a><br>
			All rights reserved. 
		</footer>
	</body>
</html
