<div id="wrapper" class="wrapper-2col-right clearfix">
<div id="left-wrapper" class="col col-sm-2 main-col-wrapper">
	<ul class="nav nav-pills nav-stacked left-menu">
		<?if($this->session->userdata['auth'] != 100) { ?>		
			<li class="menu-menus"><a href="<?=$this->admin_url?>menus"><i class="fa fa-bars fa-lg"></i>Menu</a></li>
		<? } ?>		
		<li class="menu-modules"><a href="<?=$this->admin_url?>modules"><i class="fa fa-th-large fa-lg"></i>Module</a></li>
		<li class="menu-parent">
			<a href="javascript:;"><i class="fa fa-users fa-lg"></i>User</a>
			<ul>
				<li class="menu-users"><a href="<?=$this->admin_url?>users"><i class="fa fa-users"></i>All Users</a></li>
				<li class="menu-account"><a href="<?=$this->admin_url?>account"><i class="fa fa-user"></i>Current User</a></li>
			</ul>
		</li>
		
		<li class="menu-parent">
			<a href="javascript:;"><i class="fa fa-edit fa-lg"></i>Post</a>
			<ul>
				<li class="menu-posts"><a href="<?=$this->admin_url?>posts"><i class="fa fa-edit"></i>All posts</a>
				<li class="menu-categories"><a href="<?=$this->admin_url?>categories"><i class="fa fa-sitemap"></i>Categories</a></li>
			</ul>
		</li>
		
		<li class="menu-partners">
			<a href="<?=$this->admin_url?>partners"><i class="fa fa-smile-o fa-lg"></i>Partners</a>			
		</li>
		<li id="media-loader" class="menu-medias"><a data-fancybox-type="iframe" href="<?=$this->admin_url?>get_uploader?full=null&target=null&alt=null"><i class="fa fa-image fa-lg"></i>Media</a></li>
		<li class="menu-parent">
			<a href="javascript:;"><i class="fa fa-gears fa-lg"></i>Settings</a>
			<ul>
				<li class="menu-settings"><a href="<?=$this->admin_url?>settings"><i class="fa fa-gears"></i>Site config</a></li>				
				<li class="menu-homepageModules"><a href="<?=$this->admin_url?>homepageModules"><i class="fa fa-desktop"></i>Home page</a></li>
			</ul>
		</li>
		<li class="menu-submissions"><a href="<?=$this->admin_url?>submissions"><i class="fa fa-envelope-o fa-lg"></i>Submission</a></li>
		<li><a href="<?=$this->admin_url?>/logout"><i class="fa fa-sign-out fa-lg"></i>Logout</a></li>
	</ul>
</div>
<script>
	$(function(){
		$('.left-menu > li:has(ul) > a').click(function(){
			var list = $(this).next('ul');
			window.location = $('li:first-child > a', list).attr('href');
		})
	})
</script>