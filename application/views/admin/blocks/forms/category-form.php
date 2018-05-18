<div class="sec-wrapper no-border clearfix">
	<?php if(isset($data)) {?>
		<form class="form-category" action="<?=$this->admin_url?>update_category" method="POST">
			<input id="cid" type="hidden" name="cid" value="<?=$data->cid?>"/>
			<input id="parent" type="hidden" name="c_parent" value="<?=$data->parent?>"/>
			<input id="grparent" type="hidden" name="c_grparent" value="<?=$data->grparent?>"/>
			<input id="level" type="hidden" name="c_level" value="<?=$data->level?>"/>
			<div class="sec-wrapper clearfix">
				<div class="col-xs-12 col-sm-6 col-group-input">
					<div class="form-group-custom clearfix">
						<label class="col-xs-12 col-sm-4">Parent:</label>
						<div class="col-xs-12 col-sm-8">
							<div class="col-xs-12 input-group">
								<input type="text" id="category" name="category" class="form-control input-sm" required disabled value="<?if($data->parentname != '') echo $data->parentname; else echo 'No parent'?>"/>
								<span class="input-group-btn">
									<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
										Category
										<span class="caret"></span>
									</button>
									<ul id="dropdown-cate" class="dropdown-menu custom-dropdown">
										<li><a class="choose-category <? echo $data->parent == 0 ? 'cate-active' : ''?>" href="#" data-cid="0" data-parent="0" data-level="0" data-name="-- Root --">No parent</a>
											<ul>
											<?foreach($category[1] as $cate[1]){?>
												<li><a class="choose-category lv-1 <? echo $cate[1]->cid == $data->parent ? 'cate-active' : ''?>" href="#" data-cid="<?=$cate[1]->cid?>" data-parent="<?=$cate[1]->c_parent?>" data-level="<?=$cate[1]->c_level?>" data-name="<?=$cate[1]->c_name?>"><span><?=$cate[1]->c_name?></span> | <span class="help-block"><?=$cate[1]->name_trans?></span></a>
													<?if(isset($category[2])){?>
														<ul>
															<?foreach($category[2] as $cate[2]){
																if($cate[2]->c_parent == $cate[1]->cid){?>
																<li><a class="choose-category lv-2 <? echo $cate[2]->cid == $data->parent ? 'cate-active' : ''?>" href="#" data-cid="<?=$cate[2]->cid?>" data-parent="<?=$cate[2]->c_parent?>" data-level="<?=$cate[2]->c_level?>" data-name="<?=$cate[2]->c_name?>"><span><?=$cate[2]->c_name?></span> | <span class="help-block"><?=$cate[2]->name_trans?></span></a></li>
															<?}}?>
														</ul>
													<?}?>
												</li>
											<?}?>
											</ul>
										</li>
									</ul>
								</span>
							</div>
						</div>
					</div>
				</div>
				<div id="hidden-ordering" class="col-xs-6 col-sm-3 col-sm-offset-1 form-group-custom <?php echo $data->level == 1 ? 'collapse' : ''?>">
					<label class="col-xs-6 col-sm-4">Ordering:</label>
					<div class="col-xs-6 col-sm-6">
						<select name="c_ordering" class="form-control input-sm">
							<?php foreach($orders as $order) {?>
								<option <? echo $data->ordering == $order ? 'selected="selected"' : ''?>><?php echo $order?></option>
							<?php }?>
						</select>
					</div>
				</div>
				<div class="col-xs-4 col-sm-2 col-group-input pull-right">
					<div class="form-group-custom">
						<label class="col-xs-6">Level:</label>
						<div class="col-xs-6"><p class="static-control"><?=$data->level?></p></div>
					</div>
				</div>
			</div>
			<div class="sec-wrapper clearfix">
				<div class="col-xs-12 col-sm-8 form-group-custom clearfix">
					<label class="col-xs-12 col-sm-3">Category name (VN):</label>
					<div class="col-xs-12 col-sm-5">
						<input type="text" name="c_name" class="form-control input-sm" required value="<?=$data->name?>"/>
					</div>
				</div>
				<div class="col-xs-12 col-sm-8 form-group-custom clearfix">
					<label class="col-xs-12 col-sm-3">Category name (EN):</label>
					<div class="col-xs-12 col-sm-5">
						<input type="text" name="c_name_2" class="form-control input-sm" required value="<?=$data->name_trans?>"/>
					</div>
				</div>
			</div>
			<div class="col-xs-12 form-group-custom">
				<label class="custom-label">Category introduce (VN):</label>
				<textarea name="c_intro" id="post-content-1"><?=$data->intro?></textarea>
			</div>
			<div class="col-xs-12 form-group-custom">
				<label class="custom-label">Category introduce (EN):</label>
				<textarea name="c_intro" id="post-content-2"><?=$data->intro_trans?></textarea>
			</div>
			<?if($data->editable == 1){?>
				<div class="site-btn-wrapper">
					<input type="submit" id="update-category" name="update_category" class="btn btn-sm btn-primary btn-category" value="Update"/>
					<input type="button" class="btn btn-sm btn-danger btn-delete-2" data-cat="category" data-id="<?=$data->cid?>" data-redirect="<?=$this->admin_url.'categories'?>" value="Delete"/>
				</div>
			<?}?>
		</form>

	<?php }
	else { ?>
		<form class="form-category" action="<?=$this->admin_url?>add_category" method="POST">
			<input id="parent" type="hidden" name="c_parent"/>
			<input id="grparent" type="hidden" name="c_grparent"/>
			<input id="level" type="hidden" name="c_level"/>
			<div class="sec-wrapper clearfix clearfix">
				<div class="col-xs-12 col-sm-6 col-group-input">
					<div class="form-group-custom">
						<label class="col-xs-12 col-sm-4">Parent:</label>
						<div class="col-xs-12 col-sm-8">
							<div class="col-xs-12 input-group">
								<input id="category" type="text" name="category" class="form-control input-sm" required disabled placeholder="-- Parent category --"/>
								<span class="input-group-btn">
									<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
										Category
										<span class="caret"></span>
									</button>
									<ul id="dropdown-cate" class="dropdown-menu custom-dropdown">
										<li><a class="choose-category" href="#" data-cid="0" data-parent="0" data-level="0" data-name="-- Root --">No parent</a>
											<ul>
											<?foreach($category[1] as $cate[1]){?>
												<li><a class="choose-category lv-1" href="#" data-cid="<?=$cate[1]->cid?>" data-parent="<?=$cate[1]->c_parent?>" data-level="<?=$cate[1]->c_level?>" data-name="<?=$cate[1]->c_name?>"><span><?=$cate[1]->c_name?></span> | <span class="help-block"><?=$cate[1]->name_trans?></span></a>
													<?if(isset($category[2])){?>
														<ul>
															<?foreach($category[2] as $cate[2]){
																if($cate[2]->c_parent == $cate[1]->cid){?>
																<li><a class="choose-category lv-2" href="#" data-cid="<?=$cate[2]->cid?>" data-parent="<?=$cate[2]->c_parent?>" data-level="<?=$cate[2]->c_level?>" data-name="<?=$cate[2]->c_name?>"><span><?=$cate[2]->c_name?></span> | <span class="help-block"><?=$cate[2]->name_trans?></span></a></li>
															<?}}?>
														</ul>
													<?}?>
												</li>
											<?}?>
											</ul>
										</li>
									</ul>
								</span>

							</div>
						</div>
					</div>
				</div>
				<div id="hidden-ordering" class="col-xs-12 col-sm-3 col-sm-offset-1 form-group-custom collapse">
					<label class="col-xs-12 col-sm-5">Ordering:</label>
					<div class="col-xs-12 col-sm-7">
						<select name="c_ordering" class="form-control input-sm">
							<?php foreach($orders as $order) {?>
								<option><?php echo $order?></option>
							<?php }?>
						</select>
					</div>
				</div>	
			</div>			
			<div class="sec-wrapper clearfix">
				<div class="col-xs-12 col-sm-8 form-group-custom clearfix">
					<label class="col-xs-12 col-sm-3">Category name (VN):</label>
					<div class="col-xs-12 col-sm-5">
						<input type="text" name="c_name" class="form-control input-sm" required placeholder="-- Category name --"/>
					</div>
				</div>				
				<div class="col-xs-12 col-sm-8 form-group-custom clearfix">
					<label class="col-xs-12 col-sm-3">Category name (EN):</label>
					<div class="col-xs-12 col-sm-5">
						<input type="text" name="c_name_2" class="form-control input-sm" required placeholder="-- Category name --"/>
					</div>
				</div>
			</div>
			<div class="site-btn-wrapper">
				<input type="submit" id="add-category" name="add_category" class="btn btn-sm btn-primary btn-category" value="Add category"/>
				<input type="button" class="btn btn-sm btn-warning" value="Cancel"/>
			</div>
		</form>
	<?php } ?>
</div>
<script src="asset/ckeditor/ckeditor.js"></script>
<script>
	/*jslint unparam: true */
	/*global window, $ */
	$(function () {
		$(document).on('click','.choose-category',function(e){
			e.preventDefault();
			$('.choose-category').removeClass('cate-active');
			$('#parent').val($(this).data('cid'));
			$('#grparent').val($(this).data('parent'));
			$('#level').val($(this).data('level') + 1);
			$('#category').val($(this).data('name'));
			$(this).addClass('cate-active');
			if($(this).hasClass('lv-1') || $(this).hasClass('lv-2'))
				$('#hidden-ordering').show();
			else
				$('#hidden-ordering').hide();
		});
		$('input, .select-category', 'form').on('change',function(){
			$('.btn-category').removeAttr('disabled');
		});

		CKEDITOR.replace('post-content-1');
		CKEDITOR.replace('post-content-2');
	});
</script>