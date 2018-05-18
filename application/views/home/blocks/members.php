<div id="members-wrapper" class="sec-wrapper sec-sepa content-show-wrapper clearfix">	
	<div id="sec-header-members" class="sec-header"><h1><?=$heading?></h1></div>
	<div id="color-filter" class="col-xs-12 col-sm-12 no-padding margin-bottom-10">
		<div class="color-wrapper">
			<?foreach($classes as $class){?>
				<?if($class->cl_name == $current){?>
					<div class="color-tab col-xs-2 text-center no-padding a-block font-9" style="background-color:<?=$class->cl_color?>"><a href="<?=base_url($page.'/'.$class->cl_name)?>"><?=$class->cl_name?></a></div>
				<?}
				else{?>
					<div class="color-tab col-xs-2 text-center no-padding a-block font-9" style="color:<?=$class->cl_color?>"><a href="<?=base_url($page.'/'.$class->cl_name)?>"><?=$class->cl_name?></a></div>
				<?}?>
			<?}?>
			
		</div>
	</div>
	<?if(isset($data)){?>	
	<?$i=1;foreach($data as $member){?>
		<div id="member-<?=$i?>" class="col-3 member">
			<div class="member-img img-wrapper square">
				<div>
					<a href="<?=base_url($page.'/'.$member->m_slug.'-'.$member->mid)?>"><img src="<?echo base_url().'asset/data/member/small/'.$member->m_pic?>" alt="<?=$member->m_name?>"></a>
					<div class="overlay"><span></span><span class="glyphicon glyphicon-search"></span></div>
				</div>
			</div>
			<div class="member-info">
				<div class="col-xs-6 member-class padding-5-0">
					<span style="background-color: <?=$member->cl_color?>"></span>
				</div>
				<div class="col-xs-6 f32 text-right no-padding">
					<span class="flag <?=strtolower($member->ct_code)?>"></span>
				</div>
				<div class="member-name text-upper clearfix">						
					<h2 class="font-95 no-margin a-block"><a href="<?=base_url($page.'/'.$member->m_slug.'-'.$member->mid)?>"><span><?=$member->m_name?></span></a></h2>
				</div>
				
			</div>
		</div>
	<?$i++;}?>
	<?}
	else{?>
		<div class="sec-wrapper sec-sepa clearfix">Chưa có thành viên</div>
	<?}?>
	<?if(isset($page_count)){?>
		<div class="custom-pagination font-arial font-9 clr"><?echo $this->pagination->create_links();?></div>
	<?}?>
</div>

