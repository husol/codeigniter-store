<?php if(isset($data)){ ?>
	<div id="posts-wrapper" class="sec-wrapper sec-sepa clearfix">
		<?php $this->load->view('home/blocks/posts-block'); ?>
	</div>
<?php } else {?>
	<?php if(isset($heading)){ ?>
		<div class="sec-header no-margin">
			<?php if(isset($header_icon)){?>
				<i class="fa fa-<?php echo $header_icon?>"></i>
			<?php } ?>
				<h1><?=$heading?></h1>
		</div>
	<?php }?>
	<div class="sec-wrapper sec-sepa padding-10 clearfix"><?=$no_data?></div>
<?php } ?>
