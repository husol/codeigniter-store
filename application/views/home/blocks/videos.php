<?if(isset($data['items'])){?>
	<div id="videos-wrapper" class="sec-wrapper content-show-wrapper sec-sepa clearfix">	
		<div id="sec-header-latest" class="sec-header"><h1><?=$heading?></h1></div>
		<?//var_dump($data)?>
			<?$this->load->view('home/blocks/videos-block')?>
	</div>
	<div id="yt-showmore" class="btn-showmore text-center text-upper" data-token="<?=$data['nextPageToken']?>">Xem thêm <i class="fa fa-angle-double-right"></i></div>
<?}
else{?>
	<div class="sec-wrapper sec-sepa clearfix"><?=$no_data?></div>
<?}?>