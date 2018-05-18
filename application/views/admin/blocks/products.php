<?php if(isset($data)){?>
	<table class="table table-img">
		<thead>
			<tr>
				<th>#</th>
				<th class="th-image th-txtcenter">Hình ảnh</th>
				<th>Tên sản phẩm</th>
				<th>Danh mục sản phẩm</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $i=1; foreach($data as $product) {?>
				<tr data-cat="product" data-id="<?=$product->pid?>">
					<td><?=$i?></td>
					<td class="img-contain td-txtcenter"><a href="<?=$this->admin_url?>product/<?=$product->pid?>"><img src="<?=base_url('asset/data/product/crop').'/'.$product->p_cover?>" alt="<?=$product->p_name?>" /></td>
					<td><a href="<?=$this->admin_url?>product/<?=$product->pid?>"><?=$product->p_name?></td>
					<td><?=$product->c_name?></td>					
					<td class="featured-state icon-contain td-txtcenter"><span class="glyphicon glyphicon-trash btn-delete"></span></td>	
					<td><i class="fa fa-trash-o fa-lg"></i></td>
				</tr>
			<?php $i++;} ?>	
		</tbody>	
	</table>
<?php }
else { ?>	
	<div class="sec-wrapper clearfix">Không có dữ liệu</div>
<?php } ?>