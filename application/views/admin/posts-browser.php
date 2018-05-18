<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<?=base_url()?>" />
	<meta charset="UTF-8" />
	<title>Topride admin panel</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="author" content="Topride | XwheelTV">
	<link rel="stylesheet" href="asset/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="asset/css/bootstrap.theme.min.css"/>	
	<link rel="stylesheet" href="asset/css/font-awesome.css"/>	
	<link rel="stylesheet" href="asset/jQueryFileUpload/css/jquery.fileupload.css">
	<link rel="stylesheet" href="asset/jQueryFileUpload/css/jquery.fileupload-ui.css">
	<noscript><link rel="stylesheet" href="asset/jQueryFileUpload/css/jquery.fileupload-noscript.css"></noscript>
	<noscript><link rel="stylesheet" href="asset/jQueryFileUpload/css/jquery.fileupload-ui-noscript.css"></noscript>
	<link rel="stylesheet" href="asset/css/jquery.fancybox.css"/>	
	<link rel="stylesheet" href="asset/jquery-ui/jquery-ui.css"/>
	<link rel="stylesheet" href="asset/css/style.css"/>
	<link rel="stylesheet" href="asset/css/admin.css"/>
	<script src="asset/js/jquery-1.9.1.min.js"></script>	
</head>
<body>	
	<script>
		var admin_url = 'tradmin';
	</script>
	<div class="container">
		<div id="iframe-content-wrapper" class="col col-sx-12 main-col-wrapper no-margin clearfix">
			<?if(isset($btn_add)){?>
				<div class="sec-wrapper">
					<div class="btn btn-sm btn-primary a-block color-white no-padding"><a id="blank-form" href="<?=$this->admin_url.$btn_add_url?>" class="product-form" data-type="blank-form"><?=$btn_add?></a></div>
				</div>
			<?}?>				
			<?if(isset($search_block)){?>
				<div id="search-<?=$block?>" class="sec-wrapper">
					<?php require 'application/views/admin/blocks/'.$search_block.'.php';?>
				</div>
			<?}?>
			<div id="<?=$container_id?>" class="sec-wrapper table-responsive dynamic-container">
				<?php require 'application/views/admin/blocks/'.$block.'.php';?>
			</div>
			<?if(isset($page_count)){?>
				<div class="sec-wrapper clearfix pagination-wrapper text-right"><span>Page </span>
					<ul class="pagination pagination-sm margin-5">
						<?for($i=1;$i<=$page_count;$i++){?>
							<?if($i == $page_current){?>
								<li class="active"><a href="<?=$this->admin_url.$page.'/'.$i?>"><?=$i?></a><li>
							<?}
							else{?>
								<li><a href="<?=$this->admin_url.$page.'/'.$i?>"><?=$i?></a><li>
							<?}?>
						<?}?>
					</ul>
				</div>
			<?}?>	
		</div>		
	</div>		
	<div class="clr"></div>		
	<div id="overlay"></div>
	<script src="asset/js/bootstrap.min.js"></script>
	<script src="asset/js/jquery.fancybox.pack.js"></script>
	<script>
		$(function(){
			$('a').click(function(e){
				e.preventDefault();
				var post_id = $(this).closest('tr').data('id');
				var post_title = $(this).closest('tr').data('title');
				var iparent = window.parent.document.body;
				$('#target', iparent).val(post_id);
				$('#choosen-post', iparent).val(post_title);
				parent.$.fancybox.close();
			})
		})
	</script>
	<script src="asset/js/admin.js"></script>
</body>
</html>