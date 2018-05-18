<div id="contain-wrapper" class="content-show-wrapper col-xs-12 padding-10">
<div class="toggle-search sec-wrapper border padding-10" data-toggle="collapse" data-target="#advanced-search-wrapper-1">
	<span class="glyphicon glyphicon-search"></span> Tìm kiếm
</div>
<?if(isset($is_search)){?>
	<div id="advanced-search-wrapper-1" class="col-xs-12 no-padding collapse border margin-5-0 clearfix">
<?}
else{?>
	<div id="advanced-search-wrapper-2" class="col-xs-12 no-padding border clearfix">
<?}?>
	<div id="search-wrapper" class="margin-10-0">
		<form class="form-search" action="home/search_gift" method="POST">
			<input id="cid" type="hidden" name="cid"/>
				<div class="sec-wrapper clearfix">
					<div class="col-xs-12 col-sm-12 col-group-input no-padding">
						<div class="form-group-custom">
							<label class="col-xs-12 col-sm-6 col-md-3">Danh mục:</label>
							<div class="col-xs-12 col-sm-6 col-md-6">
								<div class="col-xs-12 input-group">
									<input type="text" id="category" name="category" class="form-control input-sm" disabled placeholder="Sản phẩm" />
									<span class="input-group-btn">
										<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
											Danh mục
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu custom-dropdown">
											<?foreach($right_category[1] as $cate[1]){?>
												<li><a class="choose-category" href="#" data-cid="<?=$cate[1]->cid?>" data-parent="<?=$cate[1]->c_parent?>" data-level="<?=$cate[1]->c_level?>"><?=$cate[1]->c_name?></a>
													<?if(isset($right_category[2])){?>
														<ul>
															<?foreach($right_category[2] as $cate[2]){
																if($cate[2]->c_parent == $cate[1]->cid){?>
																<li><a class="choose-category" href="#" data-cid="<?=$cate[2]->cid?>" data-parent="<?=$cate[2]->c_parent?>" data-level="<?=$cate[2]->c_level?>"><?=$cate[2]->c_name?></a>
																<?if(isset($right_category[3])){?>
																	<ul>
																		<?foreach($right_category[3] as $cate[3]){
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
					<div class="col-xs-12 col-md-6 form-group-custom clearfix">				
						<label class="col-xs-12 col-sm-6">Tên sản phẩm:</label>
						<div class="col-xs-12 col-sm-6">
							<input type="text" name="p_name" class="form-control input-sm" placeholder="-- Tất cả --"/>
						</div>
					</div>
					<div class="col-xs-12 col-md-6 form-group-custom clearfix">
						<label class="col-xs-12 col-sm-6">Mã sản phẩm:</label>
						<div class="col-xs-12 col-sm-6">
							<input type="text" name="p_sku" class="form-control input-sm" placeholder="-- Tất cả --"/>
						</div>
					</div>
					<div class="col-xs-12 col-md-6 form-group-custom clearfix">				
						<label class="col-xs-12 col-sm-6">Chất liệu:</label>
						<div class="col-xs-12 col-sm-6">
							<input type="text" name="p_material" class="form-control input-sm" placeholder="-- Tất cả --"/>
						</div>
					</div>
					<div class="col-xs-12 col-md-6 form-group-custom clearfix">				
						<label class="col-xs-12 col-sm-6">Màu sắc:</label>
						<div class="col-xs-12 col-sm-6">
							<input type="text" name="p_color" class="form-control input-sm" placeholder="-- Tất cả --"/>
						</div>
					</div>
					<div class="col-xs-12 col-md-6 form-group-custom clearfix">				
						<label class="col-xs-12 col-sm-6">Kích thước:</label>
						<div class="col-xs-12 col-sm-6">
							<input type="text" name="p_size" class="form-control input-sm" placeholder="-- Tất cả --"/>
						</div>
					</div>
					<div class="col-xs-12 col-md-6 form-group-custom clearfix">				
						<label class="col-xs-12 col-sm-6">Logo:</label>
						<div class="col-xs-12 col-sm-6">
							<input type="text" name="p_decor" class="form-control input-sm" placeholder="-- Tất cả --"/>
						</div>
					</div>
					<div class="col-xs-12 col-md-6 form-group-custom clearfix">				
						<label class="col-xs-12 col-sm-6">Đóng gói:</label>
						<div class="col-xs-12 col-sm-6">
							<input type="text" name="p_package" class="form-control input-sm" placeholder="-- Tất cả --"/>
						</div>
					</div>
				</div>
				<div class="site-btn-wrapper">
					<input type="submit" id="search-btn" name="search" class="btn btn-sm btn-primary" value="Tìm kiếm"/>
				</div>
		</form>
	</div>		
</div>
<?if(isset($is_search)){?>
	<div class="sec-wrapper hili padding-5-10 margin-5-0 clr">
		<span>Kết quả tìm kiếm từ khóa "<?=$key?>"</span>	
	</div>
	<?if(isset($data)){?>
		<div class="sec-wrapper padding-5-10">
			<span class="font-9"><?=$data[0]->pcount?> sản phẩm</span>
		</div>
		<div id="result-wrapper">
			<?foreach($data as $product){?>
				<div class="col col-3">
					<div class="product-img">
						<div class="product-img img-wrapper non-square-80">
							<div>
								<img src="<?echo vurl('asset/data/product/thumbnail/'.$product->p_cover)?>" alt="<?=$product->p_name?>">
								<div class="sale-tag">Sale off!</div>
								<div class="overlay"><a href="<?echo base_url().'san-pham/'.$product->c_slug.'/'.$product->p_slug.'-'.$product->pid.'.html'?>"><span></span><span class="glyphicon glyphicon-search"></span></a></div>
							</div>
						</div>
					</div>
					<div class="product-name a-block">
					<a href="<?echo base_url().'san-pham/'.$product->c_slug.'/'.$product->p_slug.'-'.$product->pid.'.html'?>"><?=$product->p_name?></a>
					<div class="product-price"><?$prices = explode(';',$product->prices); echo $prices[0].' VNĐ'?></div>
					</div>
			
				</div>
			<?}
			if(isset($page_count)){?>
				<div class="sec-wrapper pagination-wrapper text-right no-padding clr border">
					<span>Trang </span>
					<ul class="pagination pagination-sm margin-5">
						<?for($i=1;$i<=$page_count;$i++){?>
							<?if($i == $page_current){?>
								<li class="active"><span><?=$i?></span><li>
							<?}
							else{?>
								<li><a href="<?=base_url().'tim-kiem/'.$key.'/'.$i?>"><?=$i?></a><li>
							<?}?>
						<?}?>
					</ul>
				</div>
			<?}?>
		</div>
	<?}
	else{?>
	<div class="sec-wrapper border text-center">Không tìm thấy</div>
<?}}?>