<div class="toggle-search" data-toggle="collapse" data-target="#hidden-search">
	<span class="glyphicon glyphicon-search"></span> Tìm kiếm
</div>
<div id="hidden-search" class="collapse a-block">
	<div id="search-wrapper" class="margin-10-0">
	<form class="form-search" action="ad_admin/search_product" method="POST">
		<input id="cid" type="hidden" name="cid"/>
			<div class="sec-wrapper clearfix">
				<div class="col-xs-12 col-sm-12 col-group-input no-padding">
					<div class="form-group-custom">
						<label class="col-xs-12 col-sm-2">Danh mục:</label>
						<div class="col-xs-12 col-sm-5">
							<div class="col-xs-12 input-group">
								<input type="text" id="category" name="category" class="form-control input-sm" disabled placeholder="-- Danh mục --" />
								<span class="input-group-btn">
									<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
										Danh mục
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu custom-dropdown">		
										<?foreach($category[1] as $cate[1]){?>
												<li><a class="choose-category" href="#" data-cid="<?=$cate[1]->cid?>" data-parent="<?=$cate[1]->c_parent?>" data-level="<?=$cate[1]->c_level?>"><?=$cate[1]->c_name?></a>
													<?if(isset($category[2])){?>
														<ul>
															<?foreach($category[2] as $cate[2]){
																if($cate[2]->c_parent == $cate[1]->cid){?>
																<li><a class="choose-category" href="#" data-cid="<?=$cate[2]->cid?>" data-parent="<?=$cate[2]->c_parent?>" data-level="<?=$cate[2]->c_level?>"><?=$cate[2]->c_name?></a>
																<?if(isset($category[3])){?>
																	<ul>
																		<?foreach($category[3] as $cate[3]){
																			if($cate[3]->c_parent == $cate[2]->cid){?>
																			<li><a class="choose-category" href="#" data-cid="<?=$cate[3]->cid?>" data-parent="<?=$cate[3]->c_parent?>" data-level="<?=$cate[3]->c_level?>"><?=$cate[3]->c_name?></a></li>
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
								</span>
								
							</div>
						</div>
					</div>					
				</div>
			</div>
			<div class="sec-wrapper clearfix">
			<div class="col-xs-12 col-sm-6 form-group-custom clearfix">				
				<label class="col-xs-12 col-sm-5">Tên sản phẩm:</label>
				<div class="col-xs-12 col-sm-7">
					<input type="text" name="p_name" class="form-control input-sm" placeholder="-- Tất cả --"/>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 form-group-custom clearfix">
				<label class="col-xs-12 col-sm-5">Mã sản phẩm:</label>
				<div class="col-xs-12 col-sm-7">
					<input type="text" name="p_sku" class="form-control input-sm" placeholder="-- Tất cả --"/>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 form-group-custom clearfix">				
				<label class="col-xs-12 col-sm-5">Chất liệu:</label>
				<div class="col-xs-12 col-sm-7">
					<input type="text" name="p_material" class="form-control input-sm" placeholder="-- Tất cả --"/>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 form-group-custom clearfix">				
				<label class="col-xs-12 col-sm-5">Màu sắc:</label>
				<div class="col-xs-12 col-sm-7">
					<input type="text" name="p_color" class="form-control input-sm" placeholder="-- Tất cả --"/>
				</div>
			</div>			
			</div>
			<div class="site-btn-wrapper">
				<input type="submit" id="search" name="search" class="btn btn-sm btn-primary btn-search" value="Tìm"/>
			</div>
	</form>
	</div>
</div>
<script>
	$(function () {
		$(document).on('click','.choose-category',function(e){
			e.preventDefault();
		//	$('#parent').val($(this).data('parent'));
		//	$('#grparent').val($(this).data('parent'));		
			$('#cid').val($(this).data('cid'));			
			$('#category').val($(this).html());
		});	
	});
</script>