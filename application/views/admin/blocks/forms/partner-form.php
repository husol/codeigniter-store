<div class="sec-wrapper no-border clearfix">
	<?php if(isset($data)) {?>
		<form class="form-partner" action="<?=$this->admin_url?>update_partner" method="POST">
			<input id="ptid" type="hidden" name="ptid" value="<?=$data->ptid?>"/>
			<input id="pt-logo-hidden" type="hidden" name="pt_img" value="<?=$data->pt_img?>"/>			
			<div class="clearfix">
				<div class="col-xs-12 col-sm-4 pull-right padding-0-10">
					<div class="sec-wrapper clearfix">
						<div class="col-xs-12 text-center">
							<label class="font-9 margin-top-3">Partners logo:</label>
                            <a class="btn btn-default btn-xs btn-browse" href="<?=$this->admin_url?>/get_uploader?full=pt-logo-hidden&target=null&alt=pt-logo" data-fancybox-type="iframe"><i class="fa fa-picture-o"></i>&nbsp;Choose image...</a>
						</div>
						<div class="col-xs-12 img-wrapper post-img">
							<div>
								<img id="pt-logo" src="<?=$data->pt_img?>"/>
							</div>
						</div>
					</div>
				</div>
				<div class="sec-wrapper col-xs-12 col-sm-8 clearfix no-border no-padding">
					<div class="sec-wrapper clearfix">
						<div class="col-xs-12 form-group-custom">				
							<label class="col-xs-12 col-sm-3">Name:</label>
							<div class="col-xs-12 col-sm-7">
								<input type="text" name="pt_name" class="form-control input-sm" required value="<?=$data->pt_name?>"/>
							</div>
						</div>					
						<div class="col-xs-12 form-group-custom">				
							<label class="col-xs-12 col-sm-3">Link:</label>
							<div class="col-xs-12 col-sm-7">
								<input type="text" name="pt_link" class="form-control input-sm" required value="<?=$data->pt_link?>"/>
							</div>
						</div>
					</div>
				</div>
			</div>						
			<div class="site-btn-wrapper">
				<input type="submit" id="update-product" name="update_partner" class="btn btn-sm btn-primary btn-partner" value="Update"/>
				<input type="button" class="btn btn-sm btn-danger btn-delete-2" data-cat="partner" data-id="<?=$data->ptid?>" data-redirect="<?=$this->admin_url.'partners'?>" value="Delete"/>
			</div>
		</form>
		
	<?php } 
	else { ?>
		<form class="form-partner" action="<?=$this->admin_url?>add_partner" method="POST">	
			<input id="pt-logo-hidden" type="hidden" name="pt_img" value=""/>			
			<div class="clearfix">
				<div class="col-xs-12 col-sm-4 pull-right padding-0-10">
					<div class="sec-wrapper clearfix">
						<div class="col-xs-12 text-center">
							<label class="font-9 margin-top-3">Partners logo:</label>
                            <a class="btn btn-default btn-xs btn-browse" href="<?=$this->admin_url?>/get_uploader?full=pt-logo-hidden&target=null&alt=pt-logo" data-fancybox-type="iframe"><i class="fa fa-picture-o"></i>&nbsp;Choose image...</a>
						</div>
						<div class="col-xs-12 img-wrapper post-img">
							<div>
								<img id="pt-logo" src="<?=base_url('asset/img/no-image.jpg')?>"/>
							</div>
						</div>
					</div>
				</div>
				<div class="sec-wrapper col-xs-12 col-sm-8 clearfix no-border no-padding">
					<div class="sec-wrapper clearfix">
						<div class="col-xs-12 form-group-custom">				
							<label class="col-xs-12 col-sm-3">Name:</label>
							<div class="col-xs-12 col-sm-7">
								<input type="text" name="pt_name" class="form-control input-sm" required palceholder="Partner's Company"/>
							</div>
						</div>					
						<div class="col-xs-12 form-group-custom">				
							<label class="col-xs-12 col-sm-3">Link:</label>
							<div class="col-xs-12 col-sm-7">
								<input type="text" name="pt_link" class="form-control input-sm" required palceholder="Website link"/>
							</div>
						</div>
					</div>
				</div>	
			</div>
					
			<div class="site-btn-wrapper">
				<input type="submit" id="add-product" name="add_partner" class="btn btn-sm btn-primary btn-partner" value="Submit"/>
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
		var url = '<?=$this->admin_url?>upload/upload';
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
			//	console.log(data);
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
			var dir = 'upload';
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
				$('#fileinput').attr('disabled', 'disabled');
				$('#pic_cover').attr('value',$('.uploaded-img').data('name'));
			}
			else{
				$('#fileupload').removeAttr('disabled');
				$('#fileinput').removeAttr('disabled');
				$('#pic_cover').attr('value','');
			}
		};
		$('input', '.form-partner').on('change',function(){
			$('.btn-partner').removeAttr('disabled');
		})
	});
</script>