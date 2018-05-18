<?php if(isset($slideshow)){ ?>
	<div id="slideshow-block-wrapper" class="additional-val clearfix">
		<div id="img-caption-wrapper" class="col-xs-12 col-sm-10 form-group-custom img-caption-wrapper collapse">
			<label class="custom-label">Image caption</label>
			<div id="img-caption" class="clearfix">
				<div class="col-sx-12 col-sm-6">
					<textarea class="form-control" rows="3" placeholder="Caption in language 1 (VN)..."></textarea>
				</div>
				<div class="col-sx-12 col-sm-6">
					<textarea class="form-control" rows="3" placeholder="Caption in language 2 (EN)..."></textarea>
				</div>
			</div>
		</div>
		<div class="col-xs-12 form-group-custom margin-10-0">
			<label class="custom-label">Images</label>
			<div id="gallery-wrapper" class="sec-wrapper gallery-wrapper clearfix">
				<?foreach($slideshow as $item){?>
					<span class="gallery-item" data-caption="<?php echo isset($item['caption']) ? $item['caption'] : ''?>" data-caption-trans="<?php echo isset($item['caption_trans']) ? $item['caption_trans'] : ''?>">
						<img src="<?=base_url('asset/data/'.preg_replace('/\/large\/|\/medium\//', '/thumbnail/', $item['src']))?>"/>
						<span class="btn-delete-img"><i class="fa fa-times"></i></span>
					</span>
				<?}?>				
				<span class="gallery-item new" >
					<img id="gallery-img" src=""/>
					<span class="btn-delete-img"><i class="fa fa-times"></i></span>
				</span>
			</div>
			<div><a class="btn btn-default btn-xs no-padding btn-gallery" href="<?=$this->admin_url?>/get_uploader?full=null&target=null&alt=gallery-img" data-fancybox-type="iframe"><i class="fa fa-plus"></i>&nbsp;Add image</a></div>
		</div>
	</div>
<?php } else{ ?>
	<div id="slideshow-block-wrapper" class="additional-val clearfix <? echo !isset($show) ? 'collapse' : ''?>">
		<div id="img-caption-wrapper" class="col-xs-12 col-sm-10 form-group-custom img-caption-wrapper collapse">
			<label class="custom-label">Image caption</label>
			<div id="img-caption" class="clearfix">
				<div class="col-sx-12 col-sm-6">
					<textarea class="form-control" rows="3" placeholder="Caption in language 1 (VN)..."></textarea>
				</div>
				<div class="col-sx-12 col-sm-6">
					<textarea class="form-control" rows="3" placeholder="Caption in language 2 (EN)..."></textarea>
				</div>
			</div>
		</div>
		<div class="col-xs-12 form-group-custom margin-10-0">
			<label class="custom-label">Images</label>
			<div id="gallery-wrapper" class="sec-wrapper gallery-wrapper clearfix">
				<span class="gallery-item">
					<img id="gallery-img" src=""/>			
					<span class="btn-delete-img"><i class="fa fa-times"></i></span>
				</span>
			</div>
			<div><a class="btn btn-default btn-xs no-padding btn-gallery" href="<?=$this->admin_url?>/get_uploader?full=null&target=null&alt=gallery-img" data-fancybox-type="iframe"><i class="fa fa-plus"></i>&nbsp;Add image</a></button></div>
		</div>
	</div>
<?php }?>





