<html lang="en" class=""><head>	<base href="<?=base_url()?>">
	<meta charset="UTF-8">
	<title>Report</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link rel="stylesheet" href="asset/css/bootstrap.min.css">	<link rel="stylesheet" href="asset/css/bootstrap.theme.min.css">
	<link rel="stylesheet" href="asset/css/style.css">
	<link rel="stylesheet" href="asset/css/admin.css">
	<body>
		<div class="container">	
			<div id="wrapper" class="wrapper-full">		
				<div class="main-col-wrapper">	
					<div class="sec-wrapper text-center" style="margin-top:50px">	
				<?php echo $message?>		
					</div>	
					<script>setTimeout(function(){ window.location.replace('<?php echo $url?>'); }, 2000);</script>			
				</div>		
			</div>	
		</div>
	</body>
</html>