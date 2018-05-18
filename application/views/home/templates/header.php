<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<?=base_url()?>" />
		<meta charset="UTF-8" />
		<title><?php if(!is_null($this->page_title) && $this->page_title != '') echo $this->page_title.' - '.$this->site_config['sitename']; else echo $this->site_config['title'].' - '.$this->site_config['sitename']?></title>
		<meta name="description" content="<?=$this->site_config['metadescription']?>" />
		<meta name="keywords" content="<?=$this->site_config['metakeyword']?>" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<meta name="author" content="<?=$this->site_config['sitename']?>">
		<?php if(isset($og)){?>
			<meta property="og:title" content="<?=$og['title']?>" />
			<meta property="og:type" content="website" />
			<meta property="og:url" content="<?=$og['url']?>" />
			<meta property="og:image" content="<?=$og['image']?>" />
			<meta property="og:description" content="<?=$og['des']?>" />
			<meta property="og:site_name" content="<?=$this->site_config['sitename']?>" />
		<?php } else{ ?>
			<meta property="og:title" content="<?=$this->site_config['sitename']?>" />
			<meta property="og:type" content="website" />
			<meta property="og:url" content="<?=base_url()?>" />
			<meta property="og:image" content="<?=$this->site_config['logo']?>" />
			<meta property="og:description" content="<?=$this->site_config['metadescription']?>" />
			<meta property="og:site_name" content="<?=$this->site_config['sitename']?>" />
		<?php }?>
        <link rel="shortcut icon" href="<?php echo vurl('asset/img/favicon.png')?>">
		<link rel="stylesheet" href="<?php echo vurl('asset/css/bootstrap.min.css')?>"/>
		<link rel="stylesheet" href="<?php echo vurl('asset/css/font-awesome.min.css')?>"/>
		<?php if(isset($extra_css)){?>
			<?php foreach($extra_css as $css){?>
				<link rel="stylesheet" href="<?php echo vurl('asset/css/'.$css)?>"/>
			<?php }?>
		<?php }?>
		<link rel="stylesheet" href="<?php echo vurl('asset/css/flexslider.css')?>" />
		<link rel="stylesheet" href="<?php echo vurl('asset/css/camera.css')?>" />
		<link rel="stylesheet" href="<?php echo vurl('asset/css/style.css')?>"/>
		<link rel="stylesheet" href="<?php echo vurl('asset/css/site.css')?>"/>
		<?php if(!$this->uri->segment(1) || ($this->uri->segment(1) == 'en' && (!$this->uri->segment(2) || $this->uri->segment(2) == 'about-us')) || $this->uri->segment(1) == 'gioi-thieu' || $this->uri->segment(1) == 'lien-he') {?>
		<link rel="stylesheet" href="<?php echo vurl('asset/css/home.css')?>"/>
		<?php }?>
	</head>
	<body>
		<header>
			<div id="header-sec-2" class="header-sec clearfix">
				<div class="container">
					<div id="top-banner-img">
						<img class="img-responsive" src="<?=vurl('asset/data/upload/new/banner.jpg')?>" />
						<ul class="site-lang-wrapper">
							<li><a href="<?php echo base_url()?>"></a></li>
							<li><a href="<?php echo base_url('en')?>"></a></li>
						</ul>
					</div>
					<?php if(isset($this->base_info['banner'])){?>
						<div id="top-banner" class="col-xs-12 sec-sepa no-padding clearfix">
							<?=$this->base_info['banner']->m_content?>
							<ul class="site-lang-wrapper">
								<li><a href="<?php echo base_url()?>"></a></li>
								<li><a href="<?php echo base_url('en')?>"></a></li>
							</ul>
						</div>
					<?php }?>
				</div>
			</div>
			<div id="header-sec-3" class="header-sec clearfix">
				<div class="container">
					<div id="header-sec-3-inner" class="sec-inner clearfix">
						<nav id="menu" class="header-element">
							<div class="menu-item <?php echo $page == 'Home' ? 'menu-active' : ''?>">
								<a href="<? echo base_url($this->lgPath)?>"><?php echo lang('home')?></a>
							</div>
							<?php $is_product_page = false;?>
							<?php foreach($this->mainmenu as $menu){?>
								<div class="menu-item <?php echo isset($menu['isActive']) ? 'menu-active' : ''?>">
								<?php if(isset($menu['children'])){?>
									<a href="javascript:;" class="hassub"><?=$menu['mn_name']?></a>
									<ul class="sub-menu-wrapper">
										<?php foreach($menu['children'] as $sub_menu){?>
											<?php
												if(isset($sub_menu['isActive'])) {
													$is_product_page = true;
												}
												$menu_names = explode(",", str_replace("May ", "", $sub_menu[0]));
												foreach($menu_names as $menu) {
											?>
											<li class="sub-menu-item">
												<a href="<?php echo base_url($this->lgPath.$sub_menu[1])?>" title="<?php echo mb_convert_case(str_replace("May ", "", $sub_menu[0]), MB_CASE_TITLE, "UTF-8")?>"><?php echo $menu?></a>
											</li>
										<?php }}?>
									</ul>
								<?php } else{?>
									<a href="<?php echo base_url($this->lgPath.$menu['mn_slug'])?>"><?=$menu['mn_name']?></a>
								<?php }?>
							</div>
							<?php }?>
							<div class="menu-item <?php echo $this->uri->segment(1) == 'lien-he' || $this->uri->segment(2) == 'contact' ? 'menu-active' : ''?>">
								<a href="<?php echo base_url($this->lgPath.($this->lg == 1 ? 'lien-he' : 'contact'))?>"><?php echo lang('contact')?></a>
							</div>
						</nav>
						<div id="menu-responsive" class="header-element">
							<div id="menu-icon" data-toggle="collapse" data-target="#hidden-menu">
								<div class="thin-line"></div>
								<div class="thin-line"></div>
								<div class="thin-line"></div>
							</div>
							<ul id="hidden-menu" class="collapse hidden-menu">
								<li class="menu-item <?php echo $page == 'Home' ? 'menu-active' : ''?>"><a href="<? echo base_url()?>"><?php echo lang('home')?></a></li>
								<?php foreach($this->mainmenu as $menu){?>
									<li class="menu-item <?php echo isset($menu['isActive']) ? 'menu-active' : ''?>">
										<a href="<?php echo base_url($menu['mn_slug'])?>"><?=$menu['mn_name']?></a>
									</li>
								<?php }?>
                                <li class="menu-item <?php echo $this->uri->segment(1) == 'lien-he' || $this->uri->segment(2) == 'contact' ? 'menu-active' : ''?>">
                                    <a href="<?php echo base_url($this->lgPath.($this->lg == 1 ? 'lien-he' : 'contact'))?>"><?php echo lang('contact')?></a>
                                </li>
							</ul>
						</div>
						<div id="menu-search-wrapper" class="menu-search-wrapper">
							<div class="col-xs-12 no-padding">
								<form class="form-quick-search" action="<?php echo $this->lgPath?>quick_search" method="POST">
									<div class="input-group">
									  <input type="text" name="input" class="form-control input-sm" placeholder="<?php echo lang('search')?>">
									  <span class="input-group-btn">
										<button class="btn btn-sm"><i class="fa fa-search"></i></button>
									  </span>
									</div>
								</form>
							 </div>
						</div>
					</div>
				</div>
			</div>
		</header>

		<?php if(($this->uri->segment(1) == 'en' && !$this->uri->segment(2)) || !$this->uri->segment(1)) {?>
    <div class="container ">
      <div id="big-slider" class="sec-wrapper sec-sepa no-padding clearfix">
          <?php foreach($this->home_modules['slideshow']['content'] as $item){?>
              <div data-src="<?=vurl('asset/data/'.preg_replace('/\/medium\/|\/thumbnail\//', '/large/', $item['src']))?>"></div>
          <?php }?>
      </div>
    </div>
    <?php }?>

		<div class="container cols-wrapper col-5 clearfix">
			<?php if(!$is_product_page){
							foreach($this->mainmenu as $menu){
								if(isset($menu['children'])){
									foreach($menu['children'] as $index=>$sub_menu){?>
										<a href="<?php echo base_url($this->lgPath.$sub_menu[1])?>" class="item img-wrapper square">
											<div>
												<img src="<?=vurl('asset/img/u'.($index+1).'.jpg')?>" alt="">
												<div style="position: absolute; top: 75%; left: 0; width: 100%; background: rgba(37, 76, 120, 0.7);">
													<p style="text-align: center; font-size: 16px; color: white; width: 150px; margin: 0 auto; padding-top: 3px;"><?php echo mb_convert_case(explode(",", str_replace("May ", "", $sub_menu[0]))[0], MB_CASE_TITLE, "UTF-8")?></p>
												</div>
											</div>
										</a>
						<?php }
								}
							}
						} else if(!$this->uri->segment(2)){ ?>
				<b>Thông tin sản phẩm:</b>
				<?php echo $this->product_intro;?>
			<?php }?>
		</div>

		<div id="body-wrapper">