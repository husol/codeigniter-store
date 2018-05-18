<?php if(isset($data)){?>
<table class="table table-img table-admin">				
	<thead>
		<tr>
			<th>#</th>
			<th class="th-txtcenter"></th>
			<?php foreach($fields as $alias => $val){?>
				<th class="<?=$val[1]?>"><a href="<?=base_url($current.'/'.$alias.'/'.(($order == $alias && $sort == 'asc') ? 'desc' : 'asc'))?>"><?=$val[0]?><i class="fa <? if($order == $alias) echo $sort == 'desc' ? ' fa-level-down' : ' fa-level-up'?> fa-lg margin-0-5"></i></a></th>					
			<?php }?>	
			<th></th>
		</tr>
	</thead>
	<tbody>
		<?php $i=1; foreach($data as $submission) {?>
			<?if($submission['status'] == 0){?>
				<tr data-cat="submission" data-id="<?=$submission['sid']?>">		
			<?}
			else{?>
				<tr class="tr-blur" data-cat="submission" data-id="<?=$submission['sid']?>">
			<?}?>			
				<td><?=$i?></td>
				<?if($submission['status'] == 0){?>					
					<td class="published-state icon-contain td-txtcenter"><a href="<?=$this->admin_url?>submission/<?=$submission['sid']?>"><i class="fa fa-envelope-o"></i></a></td>				
				<?}				
				else{?>					
					<td class="published-state icon-contain td-txtcenter"><a href="<?=$this->admin_url?>submission/<?=$submission['sid']?>"><i class="fa fa-envelope-square"></i></a></td>				
				<?}?>
				<td><a href="<?=$this->admin_url?>submission/<?=$submission['sid']?>"><?=$submission['title']?></td>
				<td><?=$submission['name']?></td>				
				<td><?=$submission['datetime']?></td>
				<td class="featured-state icon-contain td-txtcenter"><span class="glyphicon glyphicon-trash btn-delete"></span></td>
			</tr>
		<?php $i++;} ?>
	</tbody>	
</table>
<?php }
else { ?>
	<div class="sec-wrapper">No data</div>
<?php } ?>