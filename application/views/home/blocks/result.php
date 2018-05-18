<div id="members-wrapper" class="sec-wrapper sec-sepa content-show-wrapper clearfix">
	<div id="sec-header-result" class="sec-header"><h1>Thông báo</h1></div>
	<?if($state){?>
		<div class="sec-wrapper alert alert-success text-center result-wrapper padding-10">
			<?php echo $message?>	
		</div>
	<?}
	else{?>
		<div class="sec-wrapper alert alert-danger text-center result-wrapper padding-10">
			<?php echo $message?>
		</div>
	<?}?>
	<script>
		setTimeout(function(){ window.location.replace('<?php echo $url?>'); }, 3000);
	</script>
</div>