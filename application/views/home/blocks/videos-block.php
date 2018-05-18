<?for($i=0; $i<count($data['items']); $i++){
	$item = $data['items'][$i];
	if(isset($item['id']['videoId'])){?>
		<div id="video-<?=$item['id']['videoId']?>" class="col-3 video no-border no-padding">
			<div class="video-thumbnail img-wrapper non-square">
				<div>
					<a href="<?=base_url('video/'.$item['slug'].'-'.$item['encrypt'])?>"><img src="<?=$item['snippet']['thumbnails']['medium']['url']?>" alt="<?=$item['snippet']['title']?>"></a>
				</div>
			</div>
			<div class="video-info no-transform">
				<div><i class="fa fa-clock-o"></i> <span class="font-85 lightblue"><?=date('d-m-Y H:i', strtotime($item['snippet']['publishedAt']))?></span></div>
				<div class="video-title clearfix">						
					<h2 class="no-margin a-block"><a href="<?=base_url('video/'.$item['slug'].'-'.$item['encrypt'])?>"><span class="font-9"><?=character_limiter($item['snippet']['title'], 60)?></span></a></h2>
				</div>
			</div>
		</div>
	<?}?>
<?}?>
<?if(isset($data['nextPageToken'])){?>
	<div class="next-check" data-next="<?=$data['nextPageToken']?>"></div>
<?}?>