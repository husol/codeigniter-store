<div class="sec-wrapper no-border clearfix">
	<?php if(isset($data)) {?>
		<form class="form-news" action="<?=$this->admin_url?>update_post" method="POST">
			<input id="pid" type="hidden" name="pid" value="<?=$data->pid?>"/>
			<input id="pic-cover" class="pasted-url" type="hidden" name="p_url" value="<?=$data->path.$data->img?>"/>
			<input id="gallery" type="hidden" name="p_gallery"/>
			<input id="del-imgs" type="hidden" name="del_imgs"/>
			<input id="new-imgs" type="hidden" name="new_imgs"/>
			<input id="tags" type="hidden" name="p_tags" value=""/>
			<input id="tags-2" type="hidden" name="p_tags_2" value=""/>
			<input id="del-tags" type="hidden" name="del_tags" value=""/>
			<input id="del-tags-2" type="hidden" name="del_tags_2" value=""/>
			<input id="hidden-category" type="hidden" name="p_cid" value="<?=$data->cid?>"/>
			<? 	$slideshow_data['show'] = true;
				$slideshow_data['slideshow'] = null;
				if($data->p_meta != ''){
					$meta = json_decode($data->p_meta, true);
					$slideshow_data['slideshow'] = $meta['slideshow'];
				}
			?>
			<div class="clearfix">
				<div class="col-xs-12 col-sm-4 pull-right padding-0-10">					
					<div class="sec-wrapper clearfix">
						<div class="col-xs-12 text-center">
							<label class="font-9 margin-top-3">Posts cover:</label>
                            <a class="btn btn-default btn-xs btn-browse" href="<?=$this->admin_url?>/get_uploader?full=null&target=pic-cover&alt=post-cover" data-fancybox-type="iframe"><i class="fa fa-picture-o"></i>&nbsp;Choose image...</a>
						</div>
						<div class="col-xs-12 img-wrapper post-img">
							<div>
								<img id="post-cover" src="<?=base_url().'asset/data/'.$data->path.'thumbnail/'.$data->img?>"/>
							</div>
						</div>
					</div>
				</div>
				<div class="sec-wrapper col-xs-12 col-sm-8 clearfix no-border no-padding">
					<div class="margin-5-0 text-right">
						<span class="margin-0-5">Created: <?=date('d-m-Y H:i', strtotime($data->datetime))?></span> | 
						<span class="margin-0-5">Viewed: <?=$data->views?> times</span>	| 
						<span class="margin-0-5">
							View post: 
							<a href="<?echo base_url($data->c_slug.'/'.$data->slug.'-'.$data->pid)?>" target="_blank" class="margin-0-5 lightblue">VN</a>|
							<a href="<?echo base_url('en/'.$data->c_slug_trans.'/'.$data->slug_trans.'-'.$data->pid)?>" target="_blank" class="margin-0-5 lightblue">EN</a>
						</span>
					</div>
					<div class="sec-wrapper clearfix">
						<div class="col-xs-12 form-group-custom col-group-input">
							<label class="col-xs-12 col-sm-3">Category:</label>
							<div class="col-xs-12 col-sm-7">
								<div class="col-xs-12 input-group">
									<input type="text" id="category" name="category" class="form-control input-sm" required disabled value="<?=$data->c_name?>"/>
									<span class="input-group-btn">
										<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
											Choose category
											<span class="caret"></span>
										</button>
										<ul id="dropdown-cate" class="dropdown-menu custom-dropdown">
											<?foreach($category[1] as $index => $cate[1]){
												if($index != 0) {
											?>
												<li><a class="choose-category lv-1 <? echo $data->cid == $cate[1]->cid ? 'cate-active' : ''?>" href="#" data-cid="<?=$cate[1]->cid?>" data-parent="<?=$cate[1]->c_parent?>" data-level="<?=$cate[1]->c_level?>" data-name="<?=$cate[1]->c_name?>"><?=$cate[1]->c_name?> | <span class="help-block"><?=$cate[1]->name_trans?></span></a>
													<?if(isset($category[2])){?>
														<ul>
															<?foreach($category[2] as $cate[2]){
																if($cate[2]->c_parent == $cate[1]->cid){?>
																<li><a class="choose-category lv-2 <? echo $data->cid == $cate[2]->cid ? 'cate-active' : ''?>" href="#" data-cid="<?=$cate[2]->cid?>" data-parent="<?=$cate[2]->c_parent?>" data-level="<?=$cate[2]->c_level?>" data-name="<?=$cate[2]->c_name?>"><?=$cate[2]->c_name?> | <span class="help-block"><?=$cate[2]->name_trans?></span></a>
																<?if(isset($category[3])){?>
																	<ul>
																		<?foreach($category[3] as $cate[3]){
																			if($cate[3]->c_parent == $cate[2]->cid){?>
																			<li><a class="choose-category lv-3 <? echo $data->cid == $cate[3]->cid ? 'cate-active' : ''?>" href="#" data-cid="<?=$cate[3]->cid?>" data-parent="<?=$cate[3]->c_parent?>" data-level="<?=$cate[3]->c_level?>" data-name="<?=$cate[3]->c_name?>"><?=$cate[3]->c_name?> | <span class="help-block"><?=$cate[3]->name_trans?></span></a></li>
																		<?}}?>
																	</ul>
																	<?}?>
																</li>
															<?}}?>
														</ul>
													<?}?>
												</li>
											<?} else {?>
														<?if(isset($category[2])){?>
															<?foreach($category[2] as $cate[2]){
																if($cate[2]->c_parent == $cate[1]->cid){?>
																<li><a class="choose-category lv-1 <?=$cate[2]->cid == $default_tree_id ? 'cate-active' : ''?>" href="#" data-cid="<?=$cate[2]->cid?>" data-parent="<?=$cate[2]->c_parent?>" data-level="<?=$cate[2]->c_level?>" data-name="<?=$cate[2]->c_name?>"><span><?=$cate[2]->c_name?></span> | <span class="help-block"><?=$cate[2]->name_trans?></span></a></li>
														<?}}?>
											<?}}}?>
										</ul>
									</span>
								</div>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-3">Published datetime:</label>
							<div class="col-xs-12 col-sm-7">
								<input id="publicdate" type="text" name="p_published" class="form-control input-sm"readonly value="<?=date('d-m-Y H:i', strtotime($data->published))?>"></input>
							</div>
						</div>

					</div>
					<div class="sec-wrapper clearfix">
						<div class="col-sm-6 col-xs-12 form-group-custom clearfix">
							<label class="col-xs-12 col-sm-3">Published:</label>
							<div class="col-xs-12 col-sm-9">
							<?if($data->stat == 0){?>
								<label class="radio-inline">
									<input type="radio" name="p_stat" value="0" checked> No
								</label>
								<label class="radio-inline">
									<input type="radio" name="p_stat" value="1"> Yes
								</label>
							<?}
							else{?>
								<label class="radio-inline">
									<input type="radio" name="p_stat" value="0"> No
								</label>
								<label class="radio-inline">
									<input type="radio" name="p_stat" value="1" checked> Yes
								</label>
							<?}?>
							</div>
						</div>
						<div class="col-sm-6 col-xs-12 form-group-custom clearfix">
							<label class="col-xs-12 col-sm-3">Featured:</label>
							<div class="col-xs-12 col-sm-9">
							<?if($data->featured == 0){?>
								<label class="radio-inline">
									<input type="radio" name="p_featured" value="0" checked> No
								</label>
								<label class="radio-inline">
									<input type="radio" name="p_featured" value="1"> Yes
								</label>
							<?}
							else{?>
								<label class="radio-inline">
									<input type="radio" name="p_featured" value="0"> No
								</label>
								<label class="radio-inline">
									<input type="radio" name="p_featured" value="1" checked> Yes
								</label>
							<?}?>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 margin-10-0">
				 <ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#lang-1" data-toggle="tab"><strong>Language 1 (VN)</strong></a></li>
					<li><a href="#lang-2" data-toggle="tab"><strong>Language 2 (EN)</strong></a></li>
				  </ul>
				  <!-- Tab panes -->
				  <div class="tab-content">
					<div class="tab-pane active clearfix" id="lang-1">
						<div class="col-sm-7 col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-3">Title:</label>
							<div class="col-xs-12 col-sm-9">
								<input type="text" name="p_title" class="form-control input-sm" required placeholder="-- Title --" value="<?=$data->title?>"/>
							</div>
						</div>
						<div class="col-xs-12 col-sm-7 form-group-custom">
							<label class="col-xs-12 col-sm-3"></label>
							<div class="col-xs-12 col-sm-9">
								<div id="tag-cloud" class="tag-cloud" data-target="#tags" data-del="#del-tags">
									<? if(isset($tags[1])){
										foreach($tags[1] as $tag){?>
											<span class="tag"><span><?=$tag?></span><i class="fa fa-times del indexed" ></i></span>
										<?}?>
									<?}?>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-7 form-group-custom">
							<label class="col-xs-12 col-sm-3">Tags:</label>
							<div class="col-xs-12 col-sm-9">
								<input type="text" id="tag" name="tag" class="form-control input-sm tag-input" data-target="#tags" data-cloud="#tag-cloud" placeholder="-- separated by colon --"/>
							</div>
						</div>
						<div class="col-sm-7 col-xs-12 form-group-custom font-9">
							<label class="custom-label">Short description</label>
							<textarea name="p_shorttext" id="short-content-1" class="form-control" rows="4"><?=$data->shorttext?></textarea>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="custom-label">Content</label>
							<textarea name="p_content" id="post-content-1"><?=$data->content?></textarea>
						</div>
					</div>
					<div class="tab-pane clearfix" id="lang-2">
						<div class="col-sm-7 col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-3">Title:</label>
							<div class="col-xs-12 col-sm-9">
								<input type="text" name="p_title_2" class="form-control input-sm" required placeholder="-- Title --" value="<?=$data->title_trans?>"/>
							</div>
						</div>
						<div class="col-xs-12 col-sm-7 form-group-custom">
							<label class="col-xs-12 col-sm-3"></label>
							<div class="col-xs-12 col-sm-9">
								<div id="tag-cloud-2" class="tag-cloud" data-target="#tags-2" data-del="#del-tags-2">
									<? if(isset($tags[2])){
										foreach($tags[2] as $tag){?>
											<span class="tag"><span><?=$tag?></span><i class="fa fa-times del indexed" ></i></span>
										<?}?>
									<?}?>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-7 form-group-custom">
							<label class="col-xs-12 col-sm-3">Tags:</label>
							<div class="col-xs-12 col-sm-9">
								<input type="text" id="tag" name="tag" class="form-control input-sm tag-input" data-target="#tags-2" data-cloud="#tag-cloud-2" placeholder="-- separated by colon --"/>
							</div>
						</div>
						<div class="col-sm-7 col-xs-12 form-group-custom font-9">
							<label class="custom-label">Short description</label>
							<textarea name="p_shorttext_2" id="short-content-2" class="form-control" rows="4"><?=$data->shorttext_trans?></textarea>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="custom-label">Content</label>
							<textarea name="p_content_2" id="post-content-2"><?=$data->content_trans?></textarea>
						</div>
					</div>
				  </div>
			</div>
<!--
			<div class="col-xs-12 form-group-custom clearfix collapse">
				<label class="custom-label">Meta</label>
				<textarea name="p_meta" id="meta" class="form-control input-sm" readonly><?php echo $data->p_meta?></textarea>
			</div>
			<?$this->load->view('admin/blocks/append/slideshow', $slideshow_data);?>\
-->
			<div class="site-btn-wrapper margin-20-0 clr">
				<input type="submit" id="update-post" name="update_post" class="btn btn-sm btn-primary btn-post" value="Update"/>
				<input type="button" class="btn btn-sm btn-danger btn-delete-2" data-cat="post" data-id="<?=$data->pid?>" data-redirect="<?=$this->admin_url.'posts'?>" value="Delete"/>
			</div>
		</form>
	<?php }
	else { ?>
		<form class="form-news" action="<?=$this->admin_url?>add_post" method="POST">
			<input id="pic-cover" class="pasted-url" type="hidden" name="p_img" value=""/>
			<input id="gallery" class="img-list" type="hidden" name="p_gallery" value=""/>
			<input id="tags" type="hidden" name="p_tags"/>
			<input id="tags-2" type="hidden" name="p_tags_2"/>
			<input id="hidden-category" type="hidden" name="p_cid" />
			<div class="clearfix">
				<div class="col-xs-12 col-sm-4 pull-right padding-0-10">
					<div class="sec-wrapper clearfix">
						<div class="col-xs-12 text-center">
							<label class="font-9 margin-top-3">Posts cover:</label>
                            <a class="btn btn-default btn-xs btn-browse" href="<?=$this->admin_url?>/get_uploader?full=null&target=pic-cover&alt=post-cover" data-fancybox-type="iframe"><i class="fa fa-picture-o"></i>&nbsp;Choose image...</a>
						</div>
						<div class="col-xs-12 img-wrapper post-img">
							<div>
								<img id="post-cover" src="<?=base_url('asset/img/no-image.jpg')?>"/>
							</div>
						</div>
					</div>
				</div>
				<div class="sec-wrapper col-xs-12 col-sm-8 clearfix no-border no-padding">
					<div class="sec-wrapper clearfix">
						<div class="col-xs-12 form-group-custom col-group-input">
							<label class="col-xs-12 col-sm-3">Category:</label>
							<div class="col-xs-12 col-sm-7">
								<div class="col-xs-12 input-group">
									<input type="text" id="category" name="category" class="form-control input-sm" required disabled  placeholder="Category"/>
									<span class="input-group-btn">
										<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
											Choose category
											<span class="caret"></span>
										</button>
										<ul id="dropdown-cate" class="dropdown-menu custom-dropdown">								
											<?foreach($category[1] as $index => $cate[1]){
												if($index != 0) {
											?>
												<li><a class="choose-category lv-1 <? echo $data->cid == $cate[1]->cid ? 'cate-active' : ''?>" href="#" data-cid="<?=$cate[1]->cid?>" data-parent="<?=$cate[1]->c_parent?>" data-level="<?=$cate[1]->c_level?>" data-name="<?=$cate[1]->c_name?>"><?=$cate[1]->c_name?> | <span class="help-block"><?=$cate[1]->name_trans?></span></a>
													<?if(isset($category[2])){?>
														<ul>
															<?foreach($category[2] as $cate[2]){
																if($cate[2]->c_parent == $cate[1]->cid){?>
																<li><a class="choose-category lv-2 <? echo $data->cid == $cate[2]->cid ? 'cate-active' : ''?>" href="#" data-cid="<?=$cate[2]->cid?>" data-parent="<?=$cate[2]->c_parent?>" data-level="<?=$cate[2]->c_level?>" data-name="<?=$cate[2]->c_name?>"><?=$cate[2]->c_name?> | <span class="help-block"><?=$cate[2]->name_trans?></span></a>
																<?if(isset($category[3])){?>
																	<ul>
																		<?foreach($category[3] as $cate[3]){
																			if($cate[3]->c_parent == $cate[2]->cid){?>
																			<li><a class="choose-category lv-3 <? echo $data->cid == $cate[3]->cid ? 'cate-active' : ''?>" href="#" data-cid="<?=$cate[3]->cid?>" data-parent="<?=$cate[3]->c_parent?>" data-level="<?=$cate[3]->c_level?>" data-name="<?=$cate[3]->c_name?>"><?=$cate[3]->c_name?> | <span class="help-block"><?=$cate[3]->name_trans?></span></a></li>
																		<?}}?>
																	</ul>
																	<?}?>
																</li>
															<?}}?>
														</ul>
													<?}?>
												</li>
											<?} else {?>
														<?if(isset($category[2])){?>
															<?foreach($category[2] as $cate[2]){
																if($cate[2]->c_parent == $cate[1]->cid){?>
																<li><a class="choose-category lv-1 <?=$cate[2]->cid == $default_tree_id ? 'cate-active' : ''?>" href="#" data-cid="<?=$cate[2]->cid?>" data-parent="<?=$cate[2]->c_parent?>" data-level="<?=$cate[2]->c_level?>" data-name="<?=$cate[2]->c_name?>"><span><?=$cate[2]->c_name?></span> | <span class="help-block"><?=$cate[2]->name_trans?></span></a></li>
														<?}}?>
											<?}}}?>
										</ul>
									</span>
								</div>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-3">Published datetime:</label>
							<div class="col-xs-12 col-sm-7">
								<input id="publicdate" name="p_published" type="text" class="form-control input-sm"readonly value="<?=date('d-m-Y H:i')?>"></input>
							</div>
						</div>
					</div>
					<div class="sec-wrapper clearfix">
						<div class="col-sm-6 col-xs-12 form-group-custom clearfix">
							<label class="col-xs-12 col-sm-3">Published:</label>
							<div class="col-xs-12 col-sm-9">
								<label class="radio-inline">
									<input type="radio" name="p_stat" value="0"> No
								</label>
								<label class="radio-inline">
									<input type="radio" name="p_stat" checked value="1"> Yes
								</label>
							</div>
						</div>
						<div class="col-sm-6 col-xs-12 form-group-custom clearfix">
							<label class="col-xs-12 col-sm-3">Featured:</label>
							<div class="col-xs-12 col-sm-9">
								<label class="radio-inline">
									<input type="radio" name="p_featured" checked value="0"> No
								</label>
								<label class="radio-inline">
									<input type="radio" name="p_featured" value="1"> Yes
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 margin-10-0">
				 <ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#lang-1" data-toggle="tab"><strong>Language 1 (VN)</strong></a></li>
					<li><a href="#lang-2" data-toggle="tab"><strong>Language 2 (EN)</strong></a></li>
				  </ul>
				  <!-- Tab panes -->
				  <div class="tab-content">
					<div class="tab-pane active clearfix" id="lang-1">
						<div class="col-md-7 col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-3">Title:</label>
							<div class="col-xs-12 col-sm-9">
								<input type="text" name="p_title" class="form-control input-sm" required placeholder="-- Title --"/>
							</div>
						</div>
						<div class="col-md-7 col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-3"></label>
							<div class="col-xs-12 col-sm-9">
								<div id="tag-cloud" class="tag-cloud" data-target="#tags">

								</div>
							</div>
						</div>
						<div class="col-md-7 col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-3">Tags:</label>
							<div class="col-xs-12 col-sm-9">
								<input type="text" id="tag" class="form-control input-sm tag-input" data-cloud="#tag-cloud" data-target="#tags" placeholder="-- separated by colon --"/>
							</div>
						</div>
						<div class="col-md-7 col-xs-12 form-group-custom font-9">
							<label class="custom-label">Short description</label>
							<textarea name="p_shorttext" id="short-content-1" class="form-control" rows="4"></textarea>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="custom-label">Content</label>
							<textarea name="p_content" id="post-content-1"></textarea>
						</div>
					</div>
					<div class="tab-pane clearfix" id="lang-2">
						<div class="col-md-7 col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-3">Title:</label>
							<div class="col-xs-12 col-sm-9">
								<input type="text" name="p_title_2" class="form-control input-sm" required placeholder="-- Title --"/>
							</div>
						</div>
						<div class="col-md-7 col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-3"></label>
							<div class="col-xs-12 col-sm-9">
								<div id="tag-cloud-2" class="tag-cloud" data-target="#tags-2">

								</div>
							</div>
						</div>
						<div class="col-md-7 col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-3">Tags:</label>
							<div class="col-xs-12 col-sm-9">
								<input type="text" id="tag-2" class="form-control input-sm tag-input" data-cloud="#tag-cloud-2" data-target="#tags-2" placeholder="-- separated by colon --"/>
							</div>
						</div>
						<div class="col-md-7 col-xs-12 form-group-custom font-9">
							<label class="custom-label">Short description</label>
							<textarea name="p_shorttext_2" id="short-content-2" class="form-control" rows="4"></textarea>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="custom-label">Content</label>
							<textarea name="p_content_2" id="post-content-2"></textarea>
						</div>
					</div>
				  </div>
			</div>
<!--
			<div class="col-xs-12 form-group-custom clearfix collapse">
				<label class="custom-label">Meta</label>
				<textarea name="p_meta" id="meta" class="form-control input-sm" readonly></textarea>
			</div>
			<? $slideshow_data['show'] = true;
				$this->load->view('admin/blocks/append/slideshow', $slideshow_data);?>
-->
			<div class="site-btn-wrapper margin-20-0 clr">
				<input type="submit" id="add-post" name="add_post" class="btn btn-sm btn-primary btn-post" value="Submit"/>
				<input type="button" class="btn btn-sm btn-warning" value="Cancel"/>
			</div>
		</form>
	<?php } ?>
</div>
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/jquery.iframe-transport.js"></script>
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/vendor/jquery.ui.widget.js"></script>
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/jquery.fileupload.js"></script>
<script>
	$(function () {
		'use strict';
		$(document).on('click','.choose-category',function(e){
			e.preventDefault();
			$('.choose-category').removeClass('cate-active');
			$(this).addClass('cate-active');
			$('#hidden-category').val($(this).data('cid'));
			$('#category').val($(this).data('name'));
		});
		var tags_array = [];
		$('.tag-input').each(function(){
			var target = $($(this).data('target')),
				cloud = $($(this).data('cloud'));
			$(this).on('keyup', function(e){
				var array = target.val() != '' ? target.val().split(',') : [];
				if(e.which == 188)
				{
					var str = $(this).val();
					str = str.substr(0, str.length-1);
					if(str != ''){
						if(str.length >= 3)
						{
							array.push(str);
							var html = '<span class="tag"><span>'+str+'</span><i class="fa fa-times del" ></i></span>';
							cloud.append(html);
							$(this).val('');
							target.val(array + '');
						}
						else
						{
							$(this).val('');
							alert('tag value must be longer than 3 characters');
							return false;
						}
					}
					else
					{
						$(this).val('');
						return false;
					}
				}
			})
		})
		$(document).on('click', '.tag i.del', function(){
			var parent = $(this).parent(),
				cloud = $(this).closest('.tag-cloud'),
				target = $(cloud.data('target')),
				array = target.val() != '' ? target.val().split(',') : [],
				removedTag = $(this).siblings('span').html();
			if($(this).hasClass('indexed') && $(cloud.data('del')).length > 0)
			{
				var dels = $(cloud.data('del')),
					del_tags = dels.val() != '' ? dels.val().split(',') : [];
				del_tags.push(removedTag);
				dels.val(del_tags + '');
			}
			parent.remove();
			array = $.grep(array, function(value){
				return value != removedTag;
			});
			target.val(array + '');
		});		
	});
</script>
<script src="asset/js/addImgs.js"></script>
<script src="asset/ckeditor/ckeditor.js"></script>
<script src="asset/js/bootstrap-datetimepicker.min.js"></script>
<script>
	$(function(){
		$('#publicdate').datetimepicker({
			format: 'dd-mm-yyyy hh:ii',
			autoclose: true,
			todayBtn: true,
			startDate: "01-01-2014 12:00",
		});
		CKEDITOR.replace('post-content-1');
		CKEDITOR.replace('post-content-2');
		/* $('input', '.form-news').on('change',function(){
			$('.btn-post').removeAttr('disabled');
		}) */
	})
</script>