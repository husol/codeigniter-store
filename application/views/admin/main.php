<?php 
	$this->load->view('admin/templates/header');
	$this->load->view('admin/templates/left');
?>
<div id="content-wrapper" class="col col-sm-10 main-col-wrapper clearfix">
	<div class="panel panel-primary">
		<div class="panel-heading"><?=$heading?></div>
		<div class="panel-body">
			<?php if($page_type == 1) { ?>
				<div class="container-type-1 no-padding-no-margin">
					<?php if(isset($btn_add)){ ?>
						<div class="sec-wrapper">
							<div class="btn btn-sm btn-primary a-block color-white no-padding"><a id="blank-form" href="<?=$this->admin_url.$btn_add_url?>" class="product-form" data-type="blank-form"><?=$btn_add?></a></div>
						</div>
					<?php } ?>				
					<?php if(isset($search_block)){?>
						<div id="search-<?=$block?>" class="sec-wrapper">
							<?php require 'application/views/admin/blocks/'.$search_block.'.php';?>
						</div>
					<?php } ?>
					<?php require 'application/views/admin/blocks/'.$block.'.php';?>				
					<?php if(isset($pagination)){ ?>
						<div class="sec-wrapper clearfix pagination-wrapper text-right">
							<?=$pagination?>
						</div>
					<?php }?>
				</div>
			<?php }
			if($page_type == 2) { ?>
				<div class="container-type-2 padding-20-10 col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
					<?php require 'application/views/admin/blocks/'.$block.'.php';?>
				</div>
			<?php }
			if($page_type == 3) { ?>
				<div class="container-type-3 padding-20-10 col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
					<?php require 'application/views/admin/blocks/'.$block.'.php';?>
				</div>
			<?php } ?>
		</div>
	</div>
<?php $this->load->view('admin/templates/footer'); ?>
