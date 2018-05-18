<?if(isset($default_single_name)){?>
	<div id="single-value" class="additional-val col-xs-12 form-group-custom">	
		<label class="col-xs-12 col-sm-2">Value:</label>
		<div class="col-xs-12 col-sm-5">
			<input type="text" id="alt-val" name="alt_val" class="form-control input-sm" required value="<?=$default_single_name?>"/>
		</div>
	</div>
<?}
else{?>
	<div id="single-value" class="additional-val col-xs-12 form-group-custom collapse">	
		<label class="col-xs-12 col-sm-2">Value:</label>
		<div class="col-xs-12 col-sm-5">
			<input type="text" id="alt-val" class="form-control input-sm"/>
		</div>
	</div>
<?}?>