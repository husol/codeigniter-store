<?php if(isset($data)){?>
	<table class="table table-img table-admin">
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
			foreach($data as $menu) {?>
				<tr data-cat="menu" data-id="<?=$menu['mnid']?>">
					<td><?=$i?></td>
					<td>
						<a href="<?=$this->admin_url?>menu/<?=$menu['mnid']?>"><?=$menu['name']?></a>
						<span class="help-block"><?=$menu['name_trans']?></span>
					</td>
					<td><?=$menu['mnGroup']?></td>
					<td><?=ucfirst($menu['type'])?></td>
					<td class="text-center"><?=$menu['ordering']?></td>
					<?if($menu['status'] == 0){?>
						<td class="published-state icon-contain text-center"><i class="fa fa-square-o btn-stat" data-type="stat" data-stat="<?=$menu['status']?>"></i></td>
					<?}
					else{?>
						<td class="published-state icon-contain text-center"><i class="fa fa-check-square-o btn-stat" data-type="stat" data-stat="<?=$menu['status']?>"></i></td>
					<?}?>
					<td class="icon-contain text-center"><span class="glyphicon glyphicon-trash btn-delete"></span></td>
				</tr>
			<?php $i++; } ?>
		</tbody>
	</table>
<?php }else { ?>
	<div class="sec-wrapper">No data</div>
<?php } ?>