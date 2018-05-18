<div id="form-module-wrapper" class="sec-wrapper clearfix" data-ytkey="<?=$this->site_config['youtube_api_key']?>">
	<?php if(isset($data)) {?>
		<form class="form-module" action="<?=$this->admin_url?>update_module" method="POST">
			<input id="mid" type="hidden" name="mid" value="<?=$data->mid?>"/>
			<input id="mcid" type="hidden" name="m_mcid" value="<?=$data->m_mcid?>"/>
			<input id="gallery" type="hidden" name="p_gallery"/>
			<input id="del-imgs" type="hidden" name="del_imgs"/>
			<input id="new-imgs" type="hidden" name="new_imgs"/>
			<?	$category_data = array(
					'default_cate_name' => $data->mc_name,
					'default_cate_id' => $data->m_mcid,
					'category' => $category
				);
				$this->load->view('admin/blocks/append/categories', $category_data);
			?>
			<?if($data->m_meta != ''){?>
				<?$meta = json_decode($data->m_meta, true);?>
				<? $slideshow_data['slideshow'] = null;
				if(!isset($meta['slideshow'])){?>
					<? switch($data->mc_fn){
						case 'featured_s1':
						case 'featured_s2':
							$tree_data = array(
								'default_tree_id' => $meta['id'],
								'default_tree_name' => $meta['name'],
								'category' => $category_tree
							);
							$this->load->view('admin/blocks/append/category_tree', $tree_data);
							break;
						default:
							$this->load->view('admin/blocks/append/category_tree', array('category' => $category_tree, 'default_id' => null));
							break;
						?>
					<?}?>
				<?}
				else{?>
					<?$slideshow_data['slideshow'] = $meta['slideshow']?>
				<?}?>
			<?}
			else{?>
				<?$this->load->view('admin/blocks/append/category_tree', array('category' => $category_tree));?>
			<?}?>
			<div id="adordering-wrapper" class="col-xs-12 form-group-custom">
				<label class="col-xs-12 col-sm-2">Ordering:</label>
				<div class="col-xs-12 col-sm-5">
					<select id="adordering" name="m_ordering" class="form-control input-sm">
						<?for($i=0;$i<=10;$i++){?>
							<?if($i == $data->m_ordering){?>
								<option selected><?=$i?></option>
							<?}
							else{?>
								<option><?=$i?></option>
							<?}?>
						<?}?>
					</select>
				</div>
			</div>
			<div class="col-xs-12 form-group-custom clearfix">
				<label class="col-xs-12 col-sm-2">Public:</label>
				<div class="col-xs-12 col-sm-5">
					<?if($data->m_stat == 0){?>
						<label class="radio-inline">
							<input type="radio" name="m_stat" value="0" checked> No
						</label>
						<label class="radio-inline">
							<input type="radio" name="m_stat" value="1"> Yes
						</label>
					<?}
					else{?>
						<label class="radio-inline">
							<input type="radio" name="m_stat" value="0"> No
						</label>
						<label class="radio-inline">
							<input type="radio" name="m_stat" value="1" checked> Yes
						</label>
					<?}?>
				</div>
			</div>
			<div class="col-xs-12 form-group-custom clearfix collapse">
				<label class="custom-label">Meta</label>
				<textarea name="m_meta" id="meta" class="form-control input-sm" readonly><?=$data->m_meta?></textarea>
			</div>
			<?$this->load->view('admin/blocks/append/slideshow', $slideshow_data);?>

			<div class="col-xs-12 margin-10-0">
				<ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#lang-1" data-toggle="tab"><strong>Language 1 (VN)</strong></a></li>
					<li><a href="#lang-2" data-toggle="tab"><strong>Language 2 (EN)</strong></a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active clearfix" id="lang-1">
						<div class="col-md-7 col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-3">Name:</label>
							<div class="col-xs-12 col-sm-9">
								<input type="text" name="m_name" class="form-control input-sm" required placeholder="-- Name --" value="<?php echo $data->m_name?>"/>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="custom-label">Content</label>
							<textarea class="module-content" name="m_content" id="module-content"><?=$data->m_content?></textarea>
						</div>
					</div>
					<div class="tab-pane clearfix" id="lang-2">
						<div class="col-md-7 col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-3">Name:</label>
							<div class="col-xs-12 col-sm-9">
								<input type="text" name="m_name_2" class="form-control input-sm" required placeholder="-- Name --" value="<?php echo $data->m_name_trans?>"/>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="custom-label">Content</label>
							<textarea class="module-content" name="m_content_2" id="module-content-2"><?=$data->m_content_trans?></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="site-btn-wrapper">
				<input type="submit" id="update-module" name="update_module" class="btn btn-sm btn-primary btn-module" value="Update"/>
				<input type="button" class="btn btn-sm btn-danger btn-delete-2" data-cat="module" data-id="<?=$data->mid?>" data-redirect="<?=$this->admin_url.'modules'?>" value="Delete"/>
			</div>
		</form>
	<?php }
	else { ?>
		<form class="form-module" action="<?=$this->admin_url?>add_module" method="POST">
			<input id="mcid" type="hidden" name="m_mcid"/>
			<input id="gallery" class="img-list" type="hidden" name="p_gallery" value=""/>
			<?$this->load->view('admin/blocks/append/categories')?>
			<?$this->load->view('admin/blocks/append/category_tree', array('category' => $category_tree));?>
			<div id="adordering-wrapper" class="col-xs-12 form-group-custom">
				<label class="col-xs-12 col-sm-2">Ordering:</label>
				<div class="col-xs-12 col-sm-5">
					<select id="adordering" name="m_ordering" class="form-control input-sm">
						<?for($i=0;$i<=10;$i++){?>
							<?if($i==1){?>
								<option selected><?=$i?></option>
							<?}
							else{?>
								<option><?=$i?></option>
							<?}?>
						<?}?>
					</select>
				</div>
			</div>
			<div class="col-xs-12 form-group-custom clearfix">
				<label class="col-xs-12 col-sm-2">Public:</label>
				<div class="col-xs-12 col-sm-5">
					<label class="radio-inline">
						<input type="radio" name="m_stat" value="0"> No
					</label>
					<label class="radio-inline">
						<input type="radio" name="m_stat" checked value="1"> Yes
					</label>
				</div>
			</div>
			<div class="col-xs-12 form-group-custom clearfix collapse">
				<label class="custom-label">Meta</label>
				<textarea name="m_meta" id="meta" class="form-control input-sm" readonly></textarea>
			</div>

			<?$this->load->view('admin/blocks/append/slideshow');?>
			<div class="col-xs-12 margin-10-0">
				 <ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#lang-1" data-toggle="tab"><strong>Language 1 (VN)</strong></a></li>
					<li><a href="#lang-2" data-toggle="tab"><strong>Language 2 (EN)</strong></a></li>
				  </ul>
				  <!-- Tab panes -->
				  <div class="tab-content">
					<div class="tab-pane active clearfix" id="lang-1">
						<div class="col-md-7 col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-3">Name:</label>
							<div class="col-xs-12 col-sm-9">
								<input type="text" name="m_name" class="form-control input-sm" required placeholder="-- Name --"/>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="custom-label">Content</label>
							<textarea class="module-content" name="m_content" id="module-content"></textarea>
						</div>
					</div>
					<div class="tab-pane clearfix" id="lang-2">
						<div class="col-md-7 col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-3">Name:</label>
							<div class="col-xs-12 col-sm-9">
								<input type="text" name="m_name_2" class="form-control input-sm" required placeholder="-- Name --"/>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="custom-label">Content</label>
							<textarea class="module-content" name="m_content_2" id="module-content-2"></textarea>
						</div>
					</div>
				  </div>
			</div>
			<div class="site-btn-wrapper">
				<input type="submit" id="update-module" name="add_module" class="btn btn-sm btn-primary btn-module" value="Submit"/>
			</div>
		</form>
	<?php } ?>
</div>
<script src="asset/ckeditor/ckeditor.js"></script>
<script>
	$(function(){
		CKEDITOR.replace('module-content');
		CKEDITOR.replace('module-content-2');
		$(document).on('click','.choose-type',function(e){
			e.preventDefault();
			if($(this).hasClass('cate-active'))
				return false;
			else{
				$('#alt-val').val('');
				$('#meta').val('');
				$('#mcid').val($(this).data('mcid'));
				$('#module-type').val($(this).html());
				if($(this).data('st')){
					if($(this).data('fn')){
						switch($(this).data('fn')){
							case 'slideshow':
								activeField('#slideshow-block-wrapper');
								break;
							default:
								activeField('#category-tree');
								break;
						}
					}
				}
				else{
					activeField();
				}
				$('.choose-type').removeClass('cate-active');
				$(this).addClass('cate-active');
			};
		});
		function activeField( wrapper ){
			if(typeof wrapper !== undefined){
				$('.additional-val:not(wrapper)').hide();
				$('.additional-val:not(wrapper) input').removeAttr('required');
				$(wrapper).show();
				$('input', wrapper).attr('required', 'required');
			}
			else{
				$('.additional-val').hide();
				$('.additional-val input').removeAttr('required');
			}
		};
		$('input', '.form-module').on('change',function(){
			$('.btn-module').removeAttr('disabled');
		});
	})
</script>
<script src="asset/js/addImgs.js"></script>