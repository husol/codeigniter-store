<?php
	require 'application/views/home/templates/header.php';	
	if(isset($page) && page == 'index')
		require 'application/views/home/index.php';
	if(isset($page) && page == 'product')
		require 'application/views/home/product.php';
	require 'application/views/home/templates/footer.php'; 
?>