<?php if(isset($data)){?>
	<table class="table table-striped table-img table-admin">
		<thead>
			<tr>
			<th>#</th>
			<?php foreach($fields as $alias => $val){?>
				<th class="<?=$val[1]?>"><a href="<?=base_url($current.'/'.$alias.'/'.(($order == $alias && $sort == 'asc') ? 'desc' : 'asc'))?>"><?=$val[0]?><i class="fa <? if($order == $alias) echo $sort == 'desc' ? ' fa-level-down' : ' fa-level-up'?> fa-lg margin-0-5"></i></a></th>
			<?php }?>
			<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $i = 1;
			foreach($data as $category) {?>
				<tr data-cat="category" data-id="<?=$category['cid']?>">
					<td><?=$i?></td>
					<td>
						<a href="<?=$this->admin_url?>category/<?=$category['cid']?>"><?=$category['category']?></a>
						<span class="help-block"><?=$category['category_trans']?></span>
					</td>
					<td class="text-center"><?=$category['level']?></td>
					<td><? echo $category['parent'] != 0 ? $category['parentname'] : '- No parent'?></td>
					<?if($category['status'] == 0){?>
						<td class="published-state icon-contain text-center"><i class="fa fa-square-o btn-stat" data-type="stat" data-stat="<?=$category['status']?>"></i></td>
					<?}
					else{?>
						<td class="published-state icon-contain text-center"><i class="fa fa-check-square-o btn-stat" data-type="stat" data-stat="<?=$category['status']?>"></i></td>
					<?}?>
					<?if($category['editable'] == 1){?>
						<td class="icon-contain text-center"><span class="glyphicon glyphicon-trash btn-delete"></span></td>
					<?}
					else{?>
						<td></td>
					<?}?>
				</tr>
			<?php $i++; } ?>
		</tbody>
	</table>
<?php }else { ?>
	<div class="sec-wrapper">No data</div>
<?php } ?>