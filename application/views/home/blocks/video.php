<?if(isset($data)){?>	
	
	<div id="video-detail-wrapper" class="post-detail sec-wrapper sec-sepa padding-15">
		<div class="post-heading">
			<div class="cate text-upper">
				<a class="cate-link" href="<?=base_url('video')?>"><span>Video</span></a>
			</div>
		</div>
		<div class="video-title"><h1><?=$data['snippet']['title']?></h1></div>
		<div><span class="time-views"><i class="fa fa-clock-o"></i> <?=date('d-m-Y H:i', strtotime($data['snippet']['publishedAt']))?></span></div>
		<div class="embeded-player-wrapper margin-5-0">
			<iframe id="ytplayer" class="youtube-iframe"
  src="http://www.youtube.com/embed/<?=$data['id']?>?autoplay=0"
  frameborder="0" allowfullscreen="true"></iframe>
		</div>
		<div class="video-description font-arial"><span><?=$data['snippet']['description']?></span><a href="https://www.youtube.com/watch?v=<?=$data['id']?>">...<span class="font-85 main-color"> Youtube</span></a></div> 
		<div class="font-95 margin-10-0">
			<div class="fb-like" data-href="<?echo $preferred?>" data-layout="button_count" data-action="like" data-show-faces="true" data-share="true"></div>
		</div>
		<div id="fb-comment" class="fb-comment-wrapper clearfix margin-10-0">
			<div class="fb-comments" data-href="<?echo $preferred?>" data-numposts="5" data-width="100%" data-colorscheme="light"></div>
		</div>
	</div>
<?}?>

