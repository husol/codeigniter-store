<!DOCTYPE HTML>
<html lang="en">
<head>
	<base href="<?=base_url()?>" />
	<meta charset="UTF-8" />
	<title>Upload page</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="author" content="XwheelTV">
	<link rel="stylesheet" href="asset/css/reset.css"/>
	<link rel="stylesheet" href="asset/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="asset/css/bootstrap.theme.min.css"/>	
	<link rel="stylesheet" href="asset/css/font-awesome.css"/>		
	<link rel="stylesheet" href="asset/jQueryFileUpload/css/blueimp-gallery.min.css">
	<link rel="stylesheet" href="asset/jQueryFileUpload/css/jquery.fileupload.css">
	<link rel="stylesheet" href="asset/jQueryFileUpload/css/jquery.fileupload-ui.css">
	<noscript><link rel="stylesheet" href="asset/jQueryFileUpload/css/jquery.fileupload-noscript.css"></noscript>
	<noscript><link rel="stylesheet" href="asset/jQueryFileUpload/css/jquery.fileupload-ui-noscript.css"></noscript>	
	<link rel="stylesheet" href="asset/css/style.css"/>
	<link rel="stylesheet" href="asset/css/admin.css"/
</head>
<body>
<div class="container">
	<?foreach($data as $text){?>
	<div class="col col-sm-3">
		<span><?=$text?></span>
	</div>	
	<?}?>
</div>
</body> 
</html>