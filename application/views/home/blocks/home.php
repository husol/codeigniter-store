<?php if($this->session->flashdata('result')){?>
	<div class="alert alert-<?php echo ($this->session->flashdata('result') ? 'success' : 'danger')?> fade in home-alert">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
      <span><?php echo $this->session->flashdata('result')['message']?></span>
    </div>
	<script>
		setTimeout(function(){
			$('.alert').fadeOut();
		}, 3000)
	</script>
<?php }?>
<?if(isset($this->home_modules)){
	foreach($this->home_modules as $data){
		if(isset($data['content'])){
			switch($data['function']){
                case 'featured_s1':
					//if(count($data['content']['posts']) > 0){
					if(false){?>
					<div id="posts-wrapper-<? echo $data['content']['header']?>" class="sec-wrapper sec-sepa clearfix">
						<div class="sec-header"><i class="fa fa-list-alt"></i><h2><? echo $data['content']['header']?></h2></div>
						<div class="col-xs-12 content-show-wrapper clearfix">
							<?$i=1;foreach($data['content']['posts'] as $post){?>
								<div class="col col-4">
									<div class="img-wrapper square">
										<div>
											<img src="<?echo vurl('asset/data/'.$post->p_ym.'thumbnail/'.$post->p_img)?>" alt="<?=$post->p_title?>" alt="">
										</div>
									</div>
									<div class="product-name"><h3><a href="<?=base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid)?>"><div><?php echo $post->p_title?></div></a></h3></div>
									<div class="overlay a-block"><a href="<?=base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid)?>"><span></span><span><i class="fa fa-leaf font-12"></i><?=$post->p_shorttext?></span></a></div>
								</div>
							<?$i++;}?>
						</div>
					</div>
				<?}
				break;?>
				<?case 'featured_s2':
					if(count($data['content']['news']) > 0){?>
					<div id="posts-wrapper-<? echo $data['content']['header']?>" class="sec-wrapper sec-sepa clearfix">
						<div class="sec-header"><i class="fa fa-list-alt"></i><h2><? echo $data['content']['header']?></h2></div>
						<div class="col-xs-12 content-show-wrapper clearfix">
							<?$i=1;foreach($data['content']['news'] as $post){?>
                                <div class="col col-4">
                                    <a href="<?=base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid)?>">
                                        <div class="img-wrapper square">
                                            <div>
                                                <img src="<?echo vurl('asset/data/'.$post->p_ym.'thumbnail/'.$post->p_img)?>" alt="<?=$post->p_title?>" alt="">
                                            </div>
                                        </div>
                                        <div class="product-name">
                                            <h3><?php echo $post->p_title?></h3>
                                        </div>
                                    </a>
								</div>
							<?$i++;}?>
						</div>
					</div>

					<!-- <div id="posts-wrapper-<? echo $data['content']['header']?>" class="sec-wrapper sec-sepa clearfix">
						<div class="sec-header"><i class="fa fa-list-alt"></i><h2><? echo $data['content']['header']?></h2></div>
						<?$i=1;foreach($data['content']['news'] as $post){?>
							<div class="post-wrapper post-type-1 clearfix">
								<div class="col-sm-5 col-xs-6 item-img post-img no-padding">
									<a href="<?=base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid)?>"><img src="<?echo vurl('asset/data/'.$post->p_ym.'thumbnail/'.$post->p_img)?>" alt="<?=$post->p_title?>"></a>
								</div>
								<div class="post-txt a-block">
									<h3><a href="<?echo base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid)?>"><?=$post->p_title?></a></h3>
									<div class="time-views">
										<a class="cate-link" href="<?=base_url($this->lgPath.$post->c_slug)?>"><i class="fa fa-angle-double-right"></i> <?=$post->c_name?></a>
										<span> | <i class="fa fa-clock-o"></i> <?=date('d/m/Y', strtotime($post->p_published))?> | </span>
										<a class="fb-share" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=<?=urlencode(base_url($this->lgPath.$post->c_slug.'/'.$post->p_slug.'-'.$post->pid))?>"><i class="fa fa-facebook"></i> Share</a>
									</div>
									<div class="short font-arial"><?=$post->p_shorttext?></div>
								</div>
							</div>
						<?$i++;}?>
					</div> -->
				<? }
				break;?>
			<?}?>
		<?}?>
	<?}?>
<?}?>
