<?if(isset($data)){?>
	<div id="post-detail-wrapper" class="post-detail sec-wrapper sec-sepa padding-15 clearfix">
		<div class="post-title"><h1><?=$data->p_title?></h1></div>
		<div class="top-info">
			<i class="fa fa-info-circle"></i>
			<div class="clearfix">
				<? if($data->c_name != 'Single page'){?>
				<a class="cate-link" href="<?=base_url($this->lgPath.$data->c_slug)?>"><?=$data->c_name?> |</a>
				<?}?>
				<span><?=date('d/m/Y', strtotime($data->p_datetime))?></span>
			</div>
			<div class="fb-like" data-href="<?echo $preferred?>" data-layout="button_count" data-action="like" data-show-faces="true" data-share="true"></div>
		</div>
		<div class="col-xs-12 clearfix">
			<?if($data->c_name != 'Tin tức' && $data->p_img != ''){?>
				<div class="post-cover col-xs-12 col-sm-3 clearfix">
					<img style="width: 185px; height: 185px;" src="<?echo vurl('asset/data/'.$data->p_ym.'large/'.$data->p_img)?>" alt="<?=$data->p_title?>">
				</div>
			<?}?>
			<div class="col-xs-12 <?php if($data->c_name != 'Tin tức' && $data->p_img != '') { echo 'col-sm-9';}?> margin-10-0 clearfix">
				<?if(isset($data->p_shorttext) && $data->p_shorttext != ''){?>
					<div class="post-content font-arial margin-5-0"><strong><?=$data->p_shorttext?></strong></div>
				<?}?>
				<div class="post-content font-arial"><?=$data->p_content?></div>
			</div>
		</div>
		<div class="clr"></div>
		<? if($data->p_meta != ''){
			$meta = json_decode($data->p_meta, true);?>
			<div id="gallery" class="gallery clearfix">
				<ul class="slides clearfix">
				<?foreach($meta['slideshow'] as $item){?>
					<li>
						<img src="<?=vurl('asset/data/'.preg_replace('/\/medium\/|\/thumbnail\//', '/large/', $item['src']))?>" />
						<?if(isset($item['caption']) && $item['caption'] != ''){?>
							<p class="flex-caption"><?php echo $item['caption']?></p>
						<?}?>
					</li>
				<?}?>
				</ul>
			</div>
			<div id="carousel" class="carousel">
				<ul class="slides">
				<? foreach($meta['slideshow'] as $item){?>
					<li>
						<img src="<?=vurl('asset/data/'.preg_replace('/\/medium\/|\/large\//', '/crop/', $item['src']))?>" />
					</li>
				<?}?>
				</ul>
			</div>
		<?}?>
		<?if(isset($tags)){?>
			<div id="post-tags-wrapper" class="post-tag-wrapper margin-20-0">
				<i class="fa fa-tags fa-lg"></i>
				<?foreach($tags as $tag){?>
				<a href="<?=vurl($this->lgPath.'tag/'.$tag)?>"><span class="tag"><?=$tag?></span></a>
				<?}?>
			</div>
		<?}?>
		<div class="post-related clearfix">
		</div>
	</div>
<?}?>