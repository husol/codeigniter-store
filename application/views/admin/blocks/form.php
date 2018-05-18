<?php 
	$this->load->view('admin/templates/header');
	$this->load->view('admin/templates/left');
?>
<div id="content-wrapper" class="col col-sm-10 main-col-wrapper">
	<div class="panel panel-primary">
		<?php if(!isset($heading)){?>
			<div class="panel-heading"><?=$page?></div>
		<?php }
		else { ?>
			<div class="panel-heading"><?=$heading?></div>
		<?php } ?>			
		<div class="panel-body">
			<?php $this->load->view('admin/blocks/forms/'.$page.'-form'); ?>
		</div>
	</div>
</div>
<script src="asset/js/jquery.fancybox.pack.js"></script>
<?php $this->load->view('admin/templates/footer'); ?>
