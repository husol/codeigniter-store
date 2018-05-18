<div class="sec-wrapper no-border clearfix">
	<?php if(isset($data)) {?>
		<form class="form-user" action="<?=$this->admin_url?>update_user" method="POST">
			<input id="uid" type="hidden" name="uid" value="<?=$data->uid?>"/>
			<input id="user-avatar-hidden" type="hidden" name="u_pic" value="<?=$data->u_pic?>"/>
			<div class="clearfix">
				<div class="col-xs-12 col-sm-4 pull-right padding-0-10 clearfix">					
					<div class="sec-wrapper clearfix">
						<div class="col-xs-12 text-center">
							<label class="font-9 margin-top-3">Avatar:</label>
                            <a class="btn btn-default btn-xs btn-browse" href="<?=$this->admin_url?>/get_uploader?full=user-avatar-hidden&target=null&alt=user-avatar" data-fancybox-type="iframe"><i class="fa fa-picture-o"></i>&nbsp;Choose image...</a>
						</div>
						<div class="col-xs-12 img-wrapper post-img">
							<div>
								<img id="user-avatar" src="<?=$data->u_pic?>"/>
							</div>
						</div>
					</div>
				</div>
				<div class="sec-wrapper col-xs-12 col-sm-8 clearfix no-border no-padding">
					<div class="sec-wrapper clearfix">
						<div class="col-xs-12 form-group-custom">
							<label class="col-xs-4">Username:</label>
							<div class="col-xs-8">
								<p class="static-control"><b><?=$data->u_uname?></b></p>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="col-xs-4">Name:</label>
							<div class="col-xs-8">
								<input type="text" name="u_name" class="form-control input-sm" required value="<?=$data->u_name?>"/>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="col-xs-4">Email:</label>
							<div class="col-xs-8">
								<input type="text" name="u_email" class="form-control input-sm" required value="<?=$data->u_email?>"/>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom clearfix">
							<label class="col-xs-4">Group:</label>
							<div class="col-xs-8">
								<select name="u_ugid" class="form-control input-sm">
									<? foreach($ug as $group){
										if($group->ugid == $data->u_ugid){?>
											<option value="<?=$group->ugid?>" selected><?=$group->ug_name?></option>
										<?}
										else{?>
											<option value="<?=$group->ugid?>"><?=$group->ug_name?></option>
									<?}}?>
								</select>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom clearfix">
							<label class="col-xs-4">Status:</label>
							<div class="col-xs-8">
							<?if($data->u_stat == 0){?>
								<label class="radio-inline">
									<input type="radio" name="u_stat" value="0" checked> Disabled
								</label>
								<label class="radio-inline">
									<input type="radio" name="u_stat" value="1"> Active
								</label>
							<?}
							else{?>
								<label class="radio-inline">
									<input type="radio" name="u_stat" value="0"> Disabled
								</label>
								<label class="radio-inline">
									<input type="radio" name="u_stat" value="1" checked> Active
								</label>
							<?}?>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="site-btn-wrapper">
				<input type="submit" id="update-post" name="update_user" class="btn btn-sm btn-primary btn-post" value="Update"/>
				<input type="button" class="btn btn-sm btn-danger btn-delete-2" data-cat="user" data-id="<?=$data->uid?>" data-redirect="<?=$this->admin_url.'users'?>" value="Delete"/>
			</div>
		</form>
	<?php }
	else { ?>
		<form class="from-user" action="<?=$this->admin_url?>add_user" method="POST">
			<input id="user-avatar-hidden" type="hidden" name="u_pic" value=""/>
			<div class="clearfix">
				<div class="col-xs-12 col-sm-4 pull-right padding-0-10 clearfix">
					<div class="sec-wrapper clearfix">
						<div class="col-xs-12 text-center">
							<label class="font-9 margin-top-3">Avatar:</label>
                            <a class="btn btn-default btn-xs btn-browse" href="<?=$this->admin_url?>/get_uploader?full=user-avatar-hidden&target=null&alt=user-avatar" data-fancybox-type="iframe"><i class="fa fa-picture-o"></i>&nbsp;Choose image...</a>
						</div>
						<div class="col-xs-12 img-wrapper post-img">
							<div>
								<img id="user-avatar" src="<?php echo base_url('asset/img/no-image.jpg') ?>"/>
							</div>
						</div>
					</div>
				</div>
				<div class="sec-wrapper col-xs-12 col-sm-8 clearfix no-border no-padding">
					<div class="sec-wrapper clearfix">
						<div class="col-xs-12 form-group-custom">
							<label class="col-xs-4">Username:</label>
							<div class="col-xs-8">
								<input type="text" name="u_uname" class="form-control input-sm" required placeholder="-- Username -- (Required)"/>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="col-xs-4">Password:</label>
							<div class="col-xs-8">
								<input type="password" id="u_pass" name="u_pass" class="form-control input-sm" required placeholder="-- Password -- (Required)"/>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="col-xs-4">Password again:</label>
							<div class="col-xs-8">
								<input type="password" id="re_pass" class="form-control input-sm" required placeholder="-- Re-enter password -- (Required)"/>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="col-xs-4">Name:</label>
							<div class="col-xs-8">
								<input type="text" name="u_name" class="form-control input-sm" required placeholder="-- Nickname or fullname -- (Required)"/>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="col-xs-4">Email:</label>
							<div class="col-xs-8">
								<input type="text" name="u_email" class="form-control input-sm" required placeholder="-- Email -- (Required)"/>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom clearfix">
							<label class="col-xs-4">Group:</label>
							<div class="col-xs-8">
								<select name="u_ugid" class="form-control input-sm">
									<option value="2">Admin</option>
									<option value="3">Publisher</option>
									<option value="4" selected>Author</option>
								</select>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom clearfix">
							<label class="col-xs-4">Status:</label>
							<div class="col-xs-8">
								<label class="radio-inline">
									<input type="radio" name="u_stat" value="0"> Disabled
								</label>
								<label class="radio-inline">
									<input type="radio" name="u_stat" value="1" checked> Active
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="site-btn-wrapper">
				<input type="submit" id="add-post" name="add_user" class="btn btn-sm btn-primary btn-user" value="Submit"/>
				<input type="button" class="btn btn-sm btn-warning" value="Cancel"/>
			</div>
		</form>
	<?php } ?>
</div>
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/jquery.iframe-transport.js"></script>
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/vendor/jquery.ui.widget.js"></script>
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/jquery.fileupload.js"></script>
<script>
	/*jslint unparam: true */
	/*global window, $ */
	$(function () {
		$(window).load(function(){
			$(document).check();
		});
		'use strict';
		// Change this to the location of your server-side upload handler:
		var url = '<?=$this->admin_url?>upload/user';
		$('#fileupload').fileupload({
			url: url,
			dataType: 'json',
			maxNumberOfFiles: 1,
			limitConcurrentUploads: 1,
			disableImageResize: false,
			maxFileSize: 2000000,
			imageMaxWidth: 900,
			imageMaxHeight: 900,
			done: function (e, data) {
				$.each(data.result.files, function (index, file) {
					$('<div class="uploaded-img" data-name="'+file.name+'"><img src="'+file.thumbnailUrl+'"/><div class="img-action-btn btn-delete-img"></div><div class="loading-overlay">Deleting...</div></div>').appendTo('#files');
					$(document).check();
				});
				console.log(data);
			/* 	$('#progress .progress-bar-success').css('background-color', '#00a5f0'); */
			},
			progressall: function (e, data) {
				var progress = parseInt(data.loaded / data.total * 100, 10);
				$('#progress .progress-bar-success').css('background-color', '#5cb85c');
				$('#progress .progress-bar').css('width',progress + '%');
			}
		}).prop('disabled', !$.support.fileInput)
			.parent().addClass($.support.fileInput ? undefined : 'disabled');

		$(document).on('click','.btn-delete-img',function(){
			$(this).siblings('.loading-overlay').show();
			var parent = $(this).parent();
			var dir = 'user';
			var name = parent.data('name');
			var ajax_data = '{"dir" : "'+dir+'","name" : "'+name+'"}';
			ajax_data = $.parseJSON(ajax_data);
			console.log(ajax_data);
			$.ajax({
				url: '<?=$this->admin_url?>unlink_img',
				type: 'POST',
				data: ajax_data,
				success: function(data){
					parent.remove();
					$(document).check();
				}
			});
		});
		$.fn.check = function(){
			var num = $('.uploaded-img').size();
			if(num > 0){
				$('#fileupload').prop('disabled', true);
				$('#fileinput-1').attr('disabled', 'disabled');
				$('#pic_cover').attr('value',$('.uploaded-img').data('name'));
			}
			else{
				$('#fileupload').removeAttr('disabled');
				$('#fileinput-1').removeAttr('disabled');
				$('#pic_cover').attr('value','');
			}
		};
		$(document).on('click','.choose-category',function(e){
			e.preventDefault();
			$('#hidden-category').val($(this).data('cid'));
			$('#category').val($(this).html());
		});
	});
</script>
<script src="asset/ckeditor/ckeditor.js"></script>
<script>
	$(function(){

	})
</script>