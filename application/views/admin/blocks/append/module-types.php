<div class="appended-type-selector col-xs-12 form-group-custom">
	<div class="col-xs-12 col-sm-5 col-sm-offset-2">
		<select id="child-module-type" name="cm_mcid" class="form-control input-sm">
			<?if(isset($types)){
				foreach($types as $type){
					$meta = json_decode($type->c_meta);?>
					<option value="<?=$type->cid?>" data-ctype="<?=$meta->type?>" data-st="<?=$meta->st?>"><?=$type->c_name?></option>
				<?}?>
			<?}?>
		</select>
	</div>
</div>