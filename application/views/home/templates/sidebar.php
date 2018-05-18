<div id="sidebar" class="col-xs-12 sidebar-wrapper">
	<?php if(isset($this->sidebar_tree)) {
		$cat_tree = $this->sidebar_tree['content'];		
		if(count($cat_tree['data']) > 0) { ?>		
			<div class="sec-sepa">
				<div class="sec-header"><i class="fa fa-list-ul nmargin-top-2"></i><h2><?=$cat_tree['header']?></h2></div>
				<ul id="tree-wrapper" class="tree-wrapper">
					<?php foreach($cat_tree['data'] as $key => $tree) {
						if(!is_null($tree)) { ?>
							<li class="panel">
								<i data-toggle="collapse" data-target="#branch-<?=$tree['cid']?>" data-parent="#tree-wrapper" class="fa fa-plus-square-o"></i>
								<a href="<?=base_url($this->lgPath.$tree['c_slug'])?>"><?=$tree['c_name']?></a>	
								<?php if(!is_null($tree['child'])){
									$branches = explode(',', $tree['child']);?>									
									<ul id="branch-<?php echo $tree['cid']?>" class="tree-level-2 collapse <?php if($key === 0) echo 'in'; ?> clearfix">
										<?php foreach($branches as $branch) {
											$branch = explode('//', $branch);?>
											<li><i class="fa fa-angle-double-right"></i><a href="<?=base_url($this->lgPath.$tree['c_slug'].'/'.$branch[2].'-'.$branch[0])?>"><?=$branch[1]?></a></li>
										<?php }?>
									</ul>
								<?php }?>
							</li>
						<?php }?>
					<?php }?>
				</ul>
			</div>
		<?php } ?>
	<?php } ?>
	<?php if(isset($this->sidebar)){ ?>
		<?php foreach($this->sidebar as $data){
			if(isset($data['content'])){
				switch($data['function']){
                    case 'category_tree': ?>
						<div class="sec-sepa">
							<div class="sec-header"><i class="fa fa-star"></i><h2><?=$data['content']['header']?></h2></div>
							<ul id="tree-wrapper" class="tree-wrapper">
								<?if(count($data['content']['data']) > 0){
									foreach($data['content']['data'] as $tree){?>
										<li class="panel">
											<i class="fa fa-plus-square-o"></i>
											<a data-toggle="collapse" href="#branch-<?=$tree['cid']?>" data-parent="#tree-wrapper"><?=$tree['c_name']?></a>
										<?if(!is_null($tree['child'])){
											$branches = explode(',', $tree['child']);
										?>
										<ul id="branch-<?=$tree['cid']?>" class="tree-level-2 collapse clearfix">
												<?foreach($branches as $branch){
													$branch = explode('//', $branch);
												?>
													<li><i class="fa fa-angle-double-right"></i><a href="<?=base_url($this->lgPath.$tree['c_slug'].'/'.$branch[2].'-'.$branch[0])?>"><?=$branch[1]?></a></li>
												<?}?>
											</ul>
										<?}?>
										</li>
									<?}?>
								<?}?>
							</ul>
						</div>
						<?php break;?>
					<?php case 'facebook_like_box':?>
						<div id="fb-likebox-wrapper" class="sec-sepa">
							<div class="fb-likebox-custom text-center"><div class="fb-like-box" data-href="https://www.facebook.com/<?=$data['content']['val']?>" data-colorscheme="light" data-show-faces="true" data-header="false" data-stream="false" data-show-border="false" data-width="240" data-height="300"></div></div>
						</div>
						<?break;?>
					<?php case 'top_viewed':?>
						<div id="topviewed-wrapper" class="sec-sepa">
							<div id="sec-header-topviewed" class="sec-header"><i class="fa fa-check"></i><h2><?php echo lang('most_viewed')?></h2></div>
							<ul id="topviewed-list" class="sidebar-list">
								<?$i=1;foreach($data['content'] as $post){?>
									<li class="clearfix">
										<div class="item-img">
											<a href="<?echo base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid)?>"><img src="<?echo vurl('asset/data/'.$post->p_ym.'/crop/'.$post->p_img)?>" alt="<?=$post->p_title?>"></a>
										</div>
										<div class="ordering">#<?=$i?></div>
										<div class="item-txt">
											<h3><a href="<?echo base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid)?>"><?=$post->p_title?></a></h3>
										</div>
									</li>
								<?$i++;}?>
							</ul>
						</div>
						<?break;?>
					<?case 'latest':?>
						<div id="latest-wrapper" class="sec-sepa">
							<div id="sec-header-latest" class="sec-header"><i class="fa fa-plus"></i><h2><?php echo lang('latest')?></h2></div>
							<ul id="latest-list" class="sidebar-list">
								<?$i=1;foreach($data['content'] as $post){?>
									<li class="clearfix">
										<div class="item-img">
											<a href="<?echo base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid)?>"><img src="<?echo vurl('asset/data/'.$post->p_ym.'crop/'.$post->p_img)?>" alt="<?=$post->p_title?>"></a>
										</div>
										<div class="ordering">#<?=$i?></div>
										<div class="item-txt">
											<h3><a href="<?echo base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid)?>"><?=$post->p_title?></a></h3>
										</div>
									</li>
								<?$i++;}?>
							</ul>
						</div>
						<?break;?>
					<?case 'youtube_video':?>
						<div id="youtube-wrapper" class="sec-sepa clearfix">
							<div class="sidebar-inner-wrapper">
								<div class="youtube-thumbnail">									
									<div class="embeded-player-wrapper">
										<iframe id="ytplayer" class="youtube-iframe"
							  src="http://www.youtube.com/embed/<?=$data['content']['val']?>?autoplay=0"
							  frameborder="0" allowfullscreen="true"></iframe>
									</div>
								</div>
								<div class="youtube_video_title">
									<h3><a href="https://www.youtube.com/watch?v=<?=$data['content']['val']?>" target="_blank"><i class="fa fa-youtube-play"></i><span><?=$data['content']['title']?></span></a></h3>
								</div>
							</div>
						</div>
						<?break;?>
					<?default:?>
						<div class="sec-sepa ads-wrapper text-center">
							<?=$data['content']?>
						</div>
						<?break;?>
				<?php }?>
			<?php } ?>
		<?php } ?>
	<?php }
	else{ return null; } ?>
</div>
<script>

</script>