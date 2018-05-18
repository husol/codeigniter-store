<?if($posts_style == 1){?>
	<?if(isset($heading)){?>
		<div class="sec-header">
		<?php if(isset($header_icon)){?>
			<i class="fa fa-<?php echo $header_icon?>"></i>
		<?}?>
			<h1><?=$heading?></h1>
		</div>
	<?}?>
	<?$i=1;foreach($data as $post){?>
		<div id="newpost-<?=$i?>" class="post-wrapper post-type-1 clearfix">
			<div class="col-sm-5 col-xs-6 item-img post-img no-padding">
				<a href="<?=base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid)?>"><img src="<?echo vurl('asset/data/'.$post->p_ym.'thumbnail/'.$post->p_img)?>" alt="<?=$post->p_title?>"></a>
			</div>
			<div class="post-txt a-block text-center">
				<h3><a href="<?echo base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid)?>"><?=$post->p_title?></a></h3>
				<div class="short font-arial"><?=$post->p_shorttext?></div>
			</div>
		</div>
	<?$i++;}?>
<?}?>
<?if($posts_style == 2){?>
		<?if(isset($heading)){?>
			<div class="sec-header">
			<?php if(isset($header_icon)){?>
				<i class="fa fa-<?php echo $header_icon?>"></i>
			<?}?>
				<h1><?=$heading?></h1>
			</div>
		<?}?>
		<?$i=1;foreach($data as $post){?>
				<div id="post-<?=$i?>" class="col-md-<?= ($post->c_name == 'Tin tức' ? "4" : "3"); ?> col-xs-<?= ($post->c_name == 'Tin tức' ? "4" : "3"); ?> post-wrapper post-type-2 clearfix" style="margin-top: 5px; margin-bottom: 0px; height: <?= ($post->c_name == 'Tin tức' ? "350" : "270"); ?>px;">
					<div class="no-padding">
						<a href="<?=base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid)?>">
                            <img <?= ($post->c_name == 'Tin tức' ? 'style="width: 255px; height: 245px;"' : ""); ?> src="<?echo vurl('asset/data/'.$post->p_ym.'thumbnail/'.$post->p_img)?>" alt="<?=$post->p_title?>">
						</a>
					</div>
					<div class="post-txt a-block no-padding text-center">
						<h2><a href="<?echo base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid)?>"><?=$post->p_title?></a></h2>
					</div>
				</div>
		<?php $i++; }?>
	<?php if(isset($pagination) && $pagination != ''){?>
		<div class="custom-pagination font-arial clr"><?echo $pagination?></div>
	<?php }?>
<?php }?>
<?php if($posts_style == 3){ ?>
	<?php if(isset($heading)){?>
		<div id="sec-header-latest" class="sec-header">
			<?php if(isset($header_icon)){?>
				<i class="fa fa-<?php echo $header_icon?>"></i>
			<?php }?>
			<h1><?=$heading?></h1>
		</div>
	<?php }?>
	<?php if(isset($total)){?>
		<div class="total-count padding-5" style="color:red"><?=$total?> <?php echo lang('post')?></div>
	<?php }?>
	<?php $i=1;foreach($data as $post){?>
		<div id="post-<?=$i?>" class="col-xs-12 post-wrapper post-type-3 clearfix">
			<div class="col-xs-3 item-img post-img no-padding">
				<a href="<?=base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid)?>"><img src="<?echo vurl('asset/data/'.$post->p_ym.'thumbnail/'.$post->p_img)?>" alt="<?=$post->p_title?>"></a>
			</div>
			<div class="post-txt a-block text-center">
				<h2><a href="<?echo base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid)?>"><?=$post->p_title?></a></h2>
				<span class="short font-arial">
					<?=word_limiter($post->p_shorttext, 16)?>
				</span>
				<span class="link">
					<a href="<?=base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid)?>"><span><?php echo lang('read_it')?> <i class="fa fa-caret-right font-8"></i></span></a>
				</span>
			</div>
		</div>
	<?php $i++; }?>
	<?php if(isset($pagination) && $pagination != ''){ ?>
		<div class="custom-pagination font-arial clr"><?echo $pagination?></div>
	<?php } ?>
<?php } ?>