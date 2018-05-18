<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<?=base_url()?>" />
	<meta charset="UTF-8" />
	<title>Husol Admin Panel</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="author" content="Agrosmart">
	<link rel="stylesheet" href="asset/css/reset.css"/>
	<link rel="stylesheet" href="asset/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="asset/css/bootstrap.theme.min.css"/>
	<link rel="stylesheet" href="asset/css/bootstrap-datetimepicker.min.css"/>
	<link rel="stylesheet" href="asset/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="asset/jQueryFileUpload/css/blueimp-gallery.min.css">
	<link rel="stylesheet" href="asset/jQueryFileUpload/css/jquery.fileupload.css">
	<link rel="stylesheet" href="asset/jQueryFileUpload/css/jquery.fileupload-ui.css">
	<noscript><link rel="stylesheet" href="asset/jQueryFileUpload/css/jquery.fileupload-noscript.css"></noscript>
	<noscript><link rel="stylesheet" href="asset/jQueryFileUpload/css/jquery.fileupload-ui-noscript.css"></noscript>
	<link rel="stylesheet" href="asset/css/jquery.fancybox.css"/>
	<link rel="stylesheet" href="asset/jquery-ui/jquery-ui.css"/>
	<link rel="stylesheet" href="asset/css/style.css"/>
	<link rel="stylesheet" href="asset/css/admin.css"/>
	<script src="asset/js/jquery-1.11.1.min.js"></script>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default navbar-fixed-top top-wrapper" role="navigation">
			<div class="logo-wrapper">
				<a href="<?base_url()?>"><img src="<?php echo $this->site_config['logo']?>" /></a>
			</div>
			<button type="button" id="menu-icon" class="navbar-toggle navbar-toggle-custom" data-toggle="collapse" data-target="#hidden-menu">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<ul id="hidden-menu" class="collapse hidden-menu a-block">
				<?if($this->session->userdata['auth'] == 1) { ?>
					<li class="menu-menus"><a href="<?=$this->admin_url?>menus"><i class="fa fa-bars fa-lg"></i>Menu</a></li>
				<? } ?>
				<li class="menu-modules"><a href="<?=$this->admin_url?>modules"><i class="fa fa-th-large fa-lg"></i>Module</a></li>
				<li class="menu-users"><a href="<?=$this->admin_url?>users"><i class="fa fa-users fa-lg"></i>User</a></li>
				<li class="menu-categories"><a href="<?=$this->admin_url?>categories"><i class="fa fa-sitemap fa-lg"></i>Category</a></li>
				<li class="menu-posts"><a href="<?=$this->admin_url?>posts"><i class="fa fa-edit fa-lg"></i>Post</a></li>
				<li class="menu-members"><a href="<?=$this->admin_url?>members"><i class="fa fa-smile-o fa-lg"></i>Member</a></li>
				<li class="menu-partners"><a href="<?=$this->admin_url?>partners"><i class="fa fa-coffee fa-lg"></i>Partner</a></li>
				<li class="menu-vouchers"><a href="<?=$this->admin_url?>vouchers"><i class="fa fa-list-alt fa-lg"></i>Voucher</a></li>
				<li class="menu-submissions"><a href="<?=$this->admin_url?>submissions"><i class="fa fa-envelope-o fa-lg"></i>Submission</a></li>
				<li><a href="<?=$this->admin_url?>/logout"><i class="fa fa-sign-out fa-lg"></i>Logout</a></li>
			</ul>
		</nav>