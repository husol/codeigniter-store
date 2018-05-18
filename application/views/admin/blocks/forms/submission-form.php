<div class="sec-wrapper no-border clearfix">
	<?php if(isset($data)) {?>	
		<div id="detail-wrapper" class="sec-wrapper clearfix" data-state="<?=$data->s_stat?>">
			<div class="col-xs-12 static-group-custom clearfix">				
				<label class="col-xs-12 col-sm-3">Contact's name:</label>
				<div class="col-xs-12 col-sm-9"><?=$data->s_name?></div>
			</div>
			<div class="col-xs-12 static-group-custom clearfix">
				<label class="col-xs-12 col-sm-3">Contact's number:</label>
				<div class="col-xs-12 col-sm-9"><?=$data->s_mobi?></div>
			</div>
			<div class="col-xs-12 static-group-custom clearfix">				
				<label class="col-xs-12 col-sm-3">Contact's email:</label>
				<div class="col-xs-12 col-sm-9"><?=$data->s_email?></div>
			</div>
			<div class="col-xs-12 static-group-custom clearfix">				
				<label class="col-xs-12 col-sm-3">Title:</label>
				<div class="col-xs-12 col-sm-9"><?=$data->s_title?></div>
			</div>
			<div class="col-xs-12 static-group-custom clearfix">				
				<label class="col-xs-12 col-sm-3">Content:</label>
				<div class="col-xs-12 col-sm-9"><?=$data->s_content?></div>
			</div>
			
			<div class="col-xs-12 static-group-custom clearfix">				
				<label class="col-xs-12 col-sm-3">Date time:</label>
				<div class="col-xs-12 col-sm-9"><?=date('d-m-Y | H:i', strtotime($data->s_datetime))?></div>
			</div>						
		</div>			
		<div class="site-btn-wrapper">
			<input type="submit" id="delete-submission" name="delete_submission" class="btn btn-sm btn-danger btn-delete-2" data-cat="submission" data-id="<?=$data->sid?>" data-redirect="<?=$this->admin_url.'submissions'?>" value="Delete"/>
		</div>	
	<?php }
	else { ?>
		<div class="sec-wrapper">No data</div>
	<?php } ?>
</div>
<script>
	$(function(){
		if($('#detail-wrapper').data('state') == 0){
			var sid = $('.btn-delete-2').data('id');
			url = admin_url+'/ajax_update_submission';
		//	alert(sid);
			$.ajax({
				type: "POST",
				url: url,
				data: { sid: sid }
			})
			.done(function(data){
				
			})
		}
	})	
</script>