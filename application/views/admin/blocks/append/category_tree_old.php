<?if(isset($default_tree_id)){ ?>	
	<div id="category-tree" class="additional-val col-xs-12 form-group-custom clearfix">
		<label class="col-xs-12 col-sm-2">Category:</label>
		<div class="col-xs-12 col-sm-5">		
			<div class="col-xs-12 input-group">
				<input type="text" id="category-name" name="category" class="form-control input-sm" required disabled value="<?=$default_tree_name?>"/>
				<span class="input-group-btn">
					<button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown">
						Choose category
						<span class="caret"></span>
					</button>
					<ul id="dropdown-cate" class="dropdown-menu custom-dropdown">
						<li><a class="choose-category" href="#" data-cid="0" data-parent="0" data-level="0">- No parent</a>
							<ul>
							<?foreach($category[1] as $cate[1]){?>
								<li><a class="choose-category <?=$cate[1]->cid == $default_tree_id ? 'cate-active' : ''?>" href="#" data-cid="<?=$cate[1]->cid?>" data-parent="<?=$cate[1]->c_parent?>" data-level="<?=$cate[1]->c_level?>" data-name="<?=$cate[1]->c_name?>"><span><?=$cate[1]->c_name?></span> | <span class="help-block"><?=$cate[1]->name_trans?></span></a>
									<?if(isset($category[2])){?>
										<ul>
											<?foreach($category[2] as $cate[2]){
												if($cate[2]->c_parent == $cate[1]->cid){?>
												<li><a class="choose-category <?=$cate[2]->cid == $default_tree_id ? 'cate-active' : ''?>" href="#" data-cid="<?=$cate[2]->cid?>" data-parent="<?=$cate[2]->c_parent?>" data-level="<?=$cate[2]->c_level?>" data-name="<?=$cate[2]->c_name?>"><span><?=$cate[2]->c_name?></span> | <span class="help-block"><?=$cate[2]->name_trans?></span></a>
												<?if(isset($category[3])){?>
													<ul>
														<?foreach($category[3] as $cate[3]){
															if($cate[3]->c_parent == $cate[2]->cid){?>
															<li class="disabled"><span><?=$cate[3]->c_name?></span> | <span class="help-block"><?=$cate[3]->name_trans?></span></li>
														<?}}?>
													</ul>
													<?}?>
												</li>
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
<?}
else{?>		
	<div id="category-tree" class="additional-val col-xs-12 form-group-custom clearfix collapse">
		<label class="col-xs-12 col-sm-2">Category:</label>
		<div class="col-xs-12 col-sm-5">	
			<div class="col-xs-12 input-group">
				<input type="text" id="category-name" name="category" class="form-control input-sm" required disabled value=""/>
				<span class="input-group-btn">
					<button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown">
						Choose category
						<span class="caret"></span>
					</button>
					<ul id="dropdown-cate" class="dropdown-menu custom-dropdown">
						<li><a class="choose-category" href="#" data-cid="0" data-parent="0" data-level="0">- No parent</a>
							<ul>
							<?foreach($category[1] as $cate[1]){?>
								<li><a class="choose-category" href="#" data-cid="<?=$cate[1]->cid?>" data-parent="<?=$cate[1]->c_parent?>" data-level="<?=$cate[1]->c_level?>" data-name="<?=$cate[1]->c_name?>"><span><?=$cate[1]->c_name?></span> | <span class="help-block"><?=$cate[1]->name_trans?></span></a>
									<?if(isset($category[2])){?>
										<ul>
											<?foreach($category[2] as $cate[2]){
												if($cate[2]->c_parent == $cate[1]->cid){?>
												<li><a class="choose-category" href="#" data-cid="<?=$cate[2]->cid?>" data-parent="<?=$cate[2]->c_parent?>" data-level="<?=$cate[2]->c_level?>" data-name="<?=$cate[2]->c_name?>"><span><?=$cate[2]->c_name?></span> | <span class="help-block"><?=$cate[2]->name_trans?></span></a>
												<?if(isset($category[3])){?>
													<ul>
														<?foreach($category[3] as $cate[3]){
															if($cate[3]->c_parent == $cate[2]->cid){?>
															<li class="disabled"><span><?=$cate[3]->c_name?></span> | <span class="help-block"><?=$cate[3]->name_trans?></span></li>
														<?}}?>
													</ul>
													<?}?>
												</li>
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
<?}?>

<script>
	$(function(){
		$(document).on('click','.choose-category',function(e){
			e.preventDefault();	
			if($(this).hasClass('cate-active'))
				return false;
			else{
				$('#meta').val('{"id":"'+$(this).data('cid')+'","name":"'+$(this).data('name')+'"}');
				$('#category-name').val($(this).data('name'));				
				$('.choose-category').removeClass('cate-active');
				$(this).addClass('cate-active');
			};			
		});
	})
</script>