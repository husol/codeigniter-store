<?php if(isset($data)){?>
<table class="table table-striped table-img table-admin table-type-1">					
<thead>		
	<tr>						
		<th>#</th>			
		<th class="th-image th-txtcenter">Picture</th>		
		<?php foreach($fields as $alias => $val){?>
			<th class="<?=$val[1]?>"><a href="<?=base_url($current.'/'.$alias.'/'.(($order == $alias && $sort == 'asc') ? 'desc' : 'asc'))?>"><?=$val[0]?><i class="fa <? if($order == $alias) echo $sort == 'desc' ? ' fa-level-down' : ' fa-level-up'?> fa-lg margin-0-5"></i></a></th>					
		<?php }?>	
		<th></th>		
	</tr>	
</thead>	
<tbody>		
	<?php $i = 1;				
	foreach($data as $user) {?>				
		<tr data-cat="user" data-id="<?=$user['uid']?>">				
			<td><?=$i?></td>				
			<td class="img-contain text-center"><a href="<?=$this->admin_url?>user/<?=$user['uid']?>"><img src="<?=$user['u_pic']?>" alt="<?=$user['name']?>" /></td>			
			<td><a href="<?=$this->admin_url?>user/<?=$user['uid']?>"><?=$user['username']?></td>
			<td><?=$user['name']?></td>				
			<td><?=$user['authority']?></td>				
			<?if($user['status'] == 0){?>					
				<td class="published-state icon-contain text-center"><i class="fa fa-square-o btn-stat" data-type="stat" data-stat="<?=$user['status']?>"></i></td>				
			<?}				
			else{?>					
				<td class="published-state icon-contain text-center"><i class="fa fa-check-square-o btn-stat" data-type="stat" data-stat="<?=$user['status']?>"></i></td>				
			<?}?>				
			<td class="icon-contain text-center"><span class="glyphicon glyphicon-trash btn-delete"></span></td>							
		</tr>		
	<?php $i++; } ?>	
</tbody>	</table>
<?php }else { ?>	
<div class="sec-wrapper">No data</div>
<?php } ?>