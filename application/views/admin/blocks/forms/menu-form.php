<div class="sec-wrapper no-border clearfix">
	<?php if(isset($data)) {?>
		<form class="form-menu" action="<?=$this->admin_url?>update_menu" method="POST">	
			<input id="mnid" type="hidden" name="mnid" value="<?=$data->mnid?>"/>
			<input id="target" type="hidden" name="mn_target" value="<?=$data->mn_target?>"/>
			<div class="col-xs-12 no-margin clearfix">
				<ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#lang-1" data-toggle="tab"><strong>Language 1 (VN)</strong></a></li>
					<li><a href="#lang-2" data-toggle="tab"><strong>Language 2 (EN)</strong></a></li>
				 </ul>
				  <!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active clearfix" id="lang-1">
						<div class="col-xs-12 form-group-custom clearfix">
							<label class="col-xs-12 col-sm-2">Menu name:</label>
							<div class="col-xs-12 col-sm-5">
								<input type="text" name="mn_name" class="form-control input-sm" required value="<?=$data->mn_name?>"/>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom clearfix">
							<label class="col-xs-12 col-sm-2">Title:</label>
							<div class="col-xs-12 col-sm-5">
								<input type="text" name="mn_title" class="form-control input-sm" value="<?=$data->mn_title?>"/>
							</div>
						</div>			
					</div>
					<div class="tab-pane clearfix" id="lang-2">						
						<div class="col-xs-12 form-group-custom clearfix">
							<label class="col-xs-12 col-sm-2">Menu name:</label>
							<div class="col-xs-12 col-sm-5">
								<input type="text" name="mn_name_trans" class="form-control input-sm" required value="<?=$data->mn_name_trans?>"/>
							</div>
						</div>						
						<div class="col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-2">Title:</label>
							<div class="col-xs-12 col-sm-5">
								<input type="text" name="mn_title_trans" class="form-control input-sm" value="<?=$data->mn_title_trans?>"/>
							</div>
						</div>						
					</div>
				</div>
			</div>
			<div class="clr padding-5-0"></div>
			<div class="col-xs-12 form-group-custom">			
				<label class="col-xs-12 col-sm-2">Target:</label>
				<div class="col-xs-12 col-sm-5">
					<select id="menu-type" name="mn_cid" class="form-control input-sm">
						<?if(isset($types)){
							foreach($types as $type){
								if($data->mn_cid == $type->cid){?>
									<option value="<?=$type->cid?>" data-type="<?=$type->hasmeta?>" selected><?=$type->name?></option>
								<?}
								else{?>
									<option value="<?=$type->cid?>" data-type="<?=$type->hasmeta?>"><?=$type->name?></option>
								<?}?>
							<?}?>
						<?}?>
					</select>
				</div>
			</div>
			<?if(isset($data->p_title)){?>
				<div id="article-chooser" class="col-xs-12 form-group-custom">		
					<div class="col-xs-12 col-sm-5 col-sm-offset-2 no-padding">
						<input id="choosen-post" type="text" class="form-control input-sm" required readonly value="<?=$data->p_title?>"/>
					</div>
					<div class="col-xs-12 col-sm-3 padding-0-5">
						<div class="btn btn-default btn-xs"><a id="article-browser" data-fancybox-type="iframe" href="<?=$this->admin_url?>get_all_posts">Choose article</a></div>
					</div>
				</div>
			<?}
			else{?>
				<div id="article-chooser" class="col-xs-12 form-group-custom collapse">			
					<div class="col-xs-12 col-sm-5 col-sm-offset-2 no-padding">
						<input id="choosen-post" type="text" class="form-control input-sm" required readonly/>
					</div>
					<div class="col-xs-12 col-sm-3 padding-0-5">
						<div class="btn btn-default btn-xs"><a id="article-browser" data-fancybox-type="iframe" href="<?=$this->admin_url?>get_all_posts">Choose article</a></div>
					</div>
				</div>
			<?}?>
			<div id="ordering-wrapper" class="col-xs-12 form-group-custom">			
				<label class="col-xs-12 col-sm-2">Ordering:</label>
				<div class="col-xs-12 col-sm-5">
					<select id="ordering" name="mn_ordering" class="form-control input-sm">
						<?for($i=0;$i<=8;$i++){?>
							<?if($data->mn_ordering == $i){?>
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
					<?if($data->mn_stat == 0){?>
						<label class="radio-inline">
							<input type="radio" name="mn_stat" value="0" checked> No
						</label>
						<label class="radio-inline">
							<input type="radio" name="mn_stat" value="1"> Yes
						</label>
					<?}
					else{?>
						<label class="radio-inline">
							<input type="radio" name="mn_stat" value="0"> No
						</label>
						<label class="radio-inline">
							<input type="radio" name="mn_stat" value="1" checked> Yes
						</label>
					<?}?>
				</div>
			</div>			
			<div class="site-btn-wrapper">
				<input type="submit" id="update-menu" name="update_menu" class="btn btn-sm btn-primary btn-menu" value="Update"/>
			</div>
		</form>		
	<?php } 
	else { ?>
		<form class="form-menu" action="<?=$this->admin_url?>add_menu" method="POST">
			<input id="target" type="hidden" name="mn_target" value="0"/>
			<div class="col-xs-12 no-margin clearfix">
				<ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#lang-1" data-toggle="tab"><strong>Language 1 (VN)</strong></a></li>
					<li><a href="#lang-2" data-toggle="tab"><strong>Language 2 (EN)</strong></a></li>
				 </ul>
				  <!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active clearfix" id="lang-1">
						<div class="col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-2">Menu name:</label>
							<div class="col-xs-12 col-sm-5">
								<input type="text" name="mn_name" class="form-control input-sm" required placeholder="-- Name in Vietnamese --"/>
							</div>
						</div>
						<div class="col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-2">Title:</label>
							<div class="col-xs-12 col-sm-5">
								<input type="text" name="mn_title" class="form-control input-sm" placeholder="-- Title --"/>
							</div>
						</div>		
					</div>
					<div class="tab-pane clearfix" id="lang-2">						
						<div class="col-xs-12 form-group-custom clearfix">
							<label class="col-xs-12 col-sm-2">Menu name:</label>
							<div class="col-xs-12 col-sm-5">
								<input type="text" name="mn_name_trans" class="form-control input-sm" required placeholder="-- Name in English --"/>
							</div>
						</div>				
						<div class="col-xs-12 form-group-custom">
							<label class="col-xs-12 col-sm-2">Title:</label>
							<div class="col-xs-12 col-sm-5">
								<input type="text" name="mn_title_trans" class="form-control input-sm" placeholder="-- Title --"/>
							</div>
						</div>						
					</div>
				</div>
			</div>	
			<div class="clr padding-5-0"></div>
			<div class="col-xs-12 form-group-custom">			
				<label class="col-xs-12 col-sm-2">Target:</label>
				<div class="col-xs-12 col-sm-5">
					<select id="menu-type" name="mn_cid" class="form-control input-sm">
						<?if(isset($types)){
							foreach($types as $type){?>
								<option value="<?=$type->cid?>" data-type="<?=$type->hasmeta?>"><?=$type->name?></option>
							<?}?>
						<?}?>
					</select>
				</div>
			</div>
			<div id="article-chooser" class="col-xs-12 form-group-custom collapse">				
				<div class="col-xs-12 col-sm-5 col-sm-offset-2 no-padding">
					<input id="choosen-post" type="text" class="form-control input-sm" required readonly/>
				</div>
				<div class="col-xs-12 col-sm-3 padding-0-5">
					<div class="btn btn-default btn-xs"><a id="article-browser" data-fancybox-type="iframe" href="<?=$this->admin_url?>get_all_posts">Choose article</a></div>
				</div>
			</div>
			<div id="ordering-wrapper" class="col-xs-12 form-group-custom">			
				<label class="col-xs-12 col-sm-2">Ordering:</label>
				<div class="col-xs-12 col-sm-5">
					<select id="ordering" name="mn_ordering" class="form-control input-sm">
						<?for($i=0;$i<=8;$i++){?>
							<option><?=$i?></option>
						<?}?>
					</select>
				</div>
			</div>
			<div class="col-xs-12 form-group-custom clearfix">
				<label class="col-xs-12 col-sm-2">Public:</label>
				<div class="col-xs-12 col-sm-5">
					<label class="radio-inline">
						<input type="radio" name="mn_stat" value="0"> No
					</label>
					<label class="radio-inline">
						<input type="radio" name="mn_stat" checked value="1"> Yes
					</label>
				</div>
			</div>			
			<div class="site-btn-wrapper">
				<input type="submit" id="update-menu" name="add_menu" class="btn btn-sm btn-primary btn-menu" value="Submit"/>
			</div>
		</form>	
	<?php } ?>
</div>
<script>
	$(function(){	
		$('.form-menu form-control').on('change',function(){
			$('.btn-menu').removeAttr('disabled');
		})
	})	
</script>