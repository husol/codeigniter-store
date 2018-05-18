<div class="col-xs-12 form-group-custom clearfix">
	<label class="col-xs-12 col-sm-2">Type:</label>
	<div class="col-xs-12 col-sm-5">
		<?if(isset($default_cate_id)){?>
			<div class="col-xs-12 input-group">
				<input id="module-type" type="text" name="category" class="form-control input-sm" required disabled value="<?=$default_cate_name?>"/>
				<span class="input-group-btn">
					<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
						Choose module type
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu custom-dropdown">
						<?foreach($category[1] as $cate[1]){?>
							<li><a class="choose-type lv-1 <? echo $cate[1]->mcid == $default_cate_id ? 'cate-active' : ''?>" href="#" data-mcid="<?=$cate[1]->mcid?>" data-st="<?=$cate[1]->mc_hasmeta?>"><?=$cate[1]->mc_name?></a>
								<?if(isset($category[2])){?>
									<ul>
										<?foreach($category[2] as $cate[2]){
											if($cate[2]->mc_parent == $cate[1]->mcid){?>
												<li>
													<a class="choose-type lv-2 <? echo $cate[2]->mcid == $default_cate_id ? 'cate-active' : ''?>" href="#" data-mcid="<?=$cate[2]->mcid?>" data-st="<?=$cate[2]->mc_hasmeta?>" <?=isset($cate[2]->mc_fn) ? 'data-fn="'.$cate[2]->mc_fn.'"' : ''?>><?=$cate[2]->mc_name?></a>
												</li>
										<?}}?>
									</ul>
								<?}?>
							</li>
						<?}?>
					</ul>
				</span>
			</div>
		<?}
		else{?>
			<div class="col-xs-12 input-group">
				<input id="module-type" type="text" name="category" class="form-control input-sm" required disabled placeholder="-- Select type --"/>
				<span class="input-group-btn">
					<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
						Choose module type
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu custom-dropdown">
						<?foreach($category[1] as $cate[1]){?>
							<li>
								<a class="choose-type lv-1" href="#" data-mcid="<?=$cate[1]->mcid?>" data-st="<?=$cate[1]->mc_hasmeta?>"><?=$cate[1]->mc_name?></a>
								<?if(isset($category[2])){?>
									<ul>
										<?foreach($category[2] as $cate[2]){
											if($cate[2]->mc_parent == $cate[1]->mcid){?>
												<li>
													<a class="choose-type lv-2" href="#" data-mcid="<?=$cate[2]->mcid?>" data-st="<?=$cate[2]->mc_hasmeta?>" <?=isset($cate[2]->mc_fn) ? 'data-fn="'.$cate[2]->mc_fn.'"' : ''?>><?=$cate[2]->mc_name?></a>
												</li>
										<?}}?>
									</ul>
								<?}?>
							</li>
						<?}?>
					</ul>
				</span>
			</div>
		<?}?>
	</div>
</div>
