<html>
<body style="width: 600px; margin: 5px auto; border-color: #DFDFDF; font-family: tahoma">
	<div style="background:#fff;">
		<a href="<?php echo base_url()?>"><img style="width:80px" src="<?=$this->site_config['logo']?>" alt="logo"/></a>
	</div>
	<table rules="all" style="width: 100%; border: 1px solid #ECECEC" cellpadding="8">
		<colgroup>
			<col style="width:126px; background:#fafafa">
			<col style="">
		</colgroup>		
		<tr style="background-color: rgba(132, 168, 41, 1); color: #fff"><td colspan="2"><strong>New submission</strong></td></tr>
		<?php if(isset($data)) {?>
			<tr>				
				<td style="text-align:right"><strong>Contact's name</strong></strong></td>
				<td><?=$data['s_name']?></td>
			</tr>
			<tr>
				<td style="text-align:right"><strong>Contact's number</strong></td>
				<td><?=$data['s_mobi']?></td>
			</tr>
			<tr>				
				<td style="text-align:right"><strong>Contact's email</strong></td>
				<td><a href="mailto:<?=$data['s_email']?>"><?=$data['s_email']?></a></td>
			</tr>
			<tr>				
				<td style="text-align:right"><strong>Title</strong></td>
				<td><strong><?=strip_tags($data['s_title'])?></strong></td>
			</tr>
			<tr>				
				<td style="text-align:right"><strong>Content</strong></td>
				<td><?=strip_tags($data['s_content'], '<strong>')?></td>
			</tr>
			
			<tr>				
				<td style="text-align:right"><strong>Date time</strong></td>
				<td><?=date('d/m/Y | H:i', strtotime($data['s_datetime']))?></td>
			</tr>	
		<?php }
		else { ?>
			<tr><td colspan="2" style="text-align:center">No data</td></tr>
		<?php } ?>
	</table>
</body>
</html>