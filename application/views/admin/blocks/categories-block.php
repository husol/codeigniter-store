<?if(isset($data)){?>
<div class="col-xs-12 col-sm-3 col-group-input" data-level="<?=$data[0]['c_level']?>">
	<div class="form-group-custom clearfix">
		<div class="col-xs-12">
			<select name="p_cid" class="form-control input-sm select-category">
				<option value="0" disabled selected>-- Sub category --</option>
				<? foreach($data as $cate) {?>
					<option value="<?=$cate['cid']?>"><?=$cate['c_name']?></option>
				<?}?>
			</select>
		</div>
	</div>
</div>
<?}?>