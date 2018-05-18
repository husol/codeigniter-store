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
<div class="container media-container">
	<div id="folder-wrapper" class="col col-xs-4 col-sm-3 col-dir" data-last="<?=$this->admin_url.'upload/'.$this->session->userdata('dir').'/'?>">
		<ul id="folders">
			<li class="btn btn-default btn-sm btn-create-folder"><i class="fa fa-plus"></i>Create new folder</li>
		</ul>
	</div>
	<div class="col col-xs-8 col-sm-9 col-img-list pull-right no-radius table-responsive">
    <form id="fileupload-2" action="" class="table-responsive" method="POST" enctype="multipart/form-data">
        <div class="row fileupload-buttonbar no-radius">
            <div class="col-lg-7">
                <!-- The fileinput-button span is used to style the file input field as button -->
                <span class="btn btn-success btn-xs fileinput-button">
                    <span>Add files...</span>
                    <input type="file" name="files[]" multiple>
                </span>
                <button type="submit" class="btn btn-primary btn-xs start">
                    <span>Start upload</span>
                </button>
                <button type="reset" class="btn btn-warning btn-xs cancel">
                    <span>Cancel upload</span>
                </button>
                <button type="button" class="btn btn-danger btn-xs delete">
                    <span>Delete</span>
                </button>
                <input type="checkbox" class="toggle">
                <!-- The global file processing state -->
                <span class="fileupload-process"></span>
            </div>
            <!-- The global progress state -->
            <div class="col-lg-5 fileupload-progress fade">
                <!-- The global progress bar -->
                <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                    <div class="progress-bar progress-bar-success" style="width:0%;"></div>
                </div>
                <!-- The extended global progress state -->
                <div class="progress-extended">&nbsp;</div>
            </div>
        </div>
        <table role="presentation" class="table table-striped table-show table-img">
		<thead>
			<th>Image</th>
			<th style="display:none">Name</th>
			<th>Image URL</th>
			<th>File size</th>
			<th></th>
		</thead>
		<tbody class="files"></tbody>
		</table>
    </form>
    <br>
	</div>
</div>
<!-- The blueimp Gallery widget -->
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
    <div class="slides"></div>
    <h3 class="title"></h3>
    <a class="prev"></a>
    <a class="next"></a>
    <a class="close"></a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
</div>
<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td>
            <span class="preview"></span>
        </td>
        <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn btn-primary btn-xs start" disabled>
                    <span>Start</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn btn-warning btn-xs cancel">
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
	{% for (var i=0, file; file=o.files[i]; i++) { %}
	{% if(file.name != 'index.html') { %}
    <tr class="template-download fade">
        <td>
            <span class="preview">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                {% } %}
            </span>
        </td>
        <td style="display:none">
            <p class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl ? 'data-gallery' : ''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
            </p>
            {% if (file.error) { %}
                <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } %}
        </td>
		<td>
			<div data-url="{%=file.url%}"><i class="fa fa-mail-forward get-url"></i><input type="text" value="{%=file.url%}" onclick="this.select();"/><span>Original</span></div>
			{% if (file.largeUrl) { %}
				<div data-url="{%=file.largeUrl%}"><i class="fa fa-mail-forward get-url"></i><input type="text" value="{%=file.largeUrl%}" onclick="this.select();"/><span>Large (720x720)</span></div>
			{% } %}
			{% if (file.mediumUrl) { %}
				<div data-url="{%=file.mediumUrl%}"><i class="fa fa-mail-forward get-url"></i><input type="text" value="{%=file.mediumUrl%}" onclick="this.select();"/><span>Medium (540x540)</span></div>
			{% } %}
			<div data-url="{%=file.thumbnailUrl%}"><i class="fa fa-mail-forward get-url"></i><input type="text" value="{%=file.thumbnailUrl%}" onclick="this.select();"/><span>Thumbnail (280x280)</span></div>
		<!--	<button class="btn btn-xs btn-info a-block no-padding"><a class="get-url color-white" href="{%=file.largeUrl%}">Get URL</a></button> -->
		</td>
		 <td>
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
        <td>
            {% if (file.deleteUrl) { %}
                <button class="btn btn-danger btn-xs delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <span>Delete</span>
                </button>
                <input type="checkbox" name="delete" value="1" class="toggle">
            {% } else { %}
                <button class="btn btn-warning cancel">
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>

	 {% } %}

{% } %}

</script>
<script src="<?=base_url()?>/asset/js/jquery-1.11.1.min.js"></script>
<script src="<?=base_url()?>/asset/js/bootstrap.min.js"></script>
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/vendor/jquery.ui.widget.js"></script>
<!-- The Templates plugin is included to render the upload/download listings -->
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/tmpl.min.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/load-image.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/canvas-to-blob.min.js"></script>
<!-- blueimp Gallery script -->
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/jquery.blueimp-gallery.min.js"></script>
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/jquery.iframe-transport.js"></script>
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/jquery.fileupload-image.js"></script>
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/jquery.fileupload-ui.js"></script>
<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="js/cors/jquery.xdr-transport.js"></script>
<![endif]-->


<script>
	$(function(){
		var admin_url = "admin";
		$(document).on('click','.fileupload-caller', function(e){
			e.preventDefault();
			$('.fileupload-caller').parent().removeClass('active');
			$(this).parent().addClass('active');
			$('.files').empty();
			$('.container').callFileUpload($(this).attr('href'));
		});
		$.fn.callFileUpload = function(url){
			'use strict';
			// Initialize the jQuery File Upload widget:
			$('#fileupload-2').fileupload({
				// Uncomment the following to send cross-domain cookies:
				//xhrFields: {withCredentials: true},
				url: url,
				disableImageResize: /Android(?!.*Chrome)|Opera/
					.test(window.navigator.userAgent),
				maxFileSize: 2000000,
				acceptFileTypes: /(\.|\/)(gif|jpe?g|png|swf|rar|zip)$/i,
				imageMaxWidth: 1000,
			//	imageQuality: .9
			});

			// Enable iframe cross-domain access via redirect option:
			$('#fileupload-2').fileupload(
				'option',
				'redirect',
				window.location.href.replace(
					/\/[^\/]*$/,
					'/cors/result.html?%s'
				)
			);

			// Load existing files:
			$('#fileupload-2').addClass('fileupload-processing');
			$.ajax({
				// Uncomment the following to send cross-domain cookies:
				//xhrFields: {withCredentials: true},
				url: $('#fileupload-2').fileupload('option', 'url'),
				dataType: 'json',
				context: $('#fileupload-2')[0]
			}).always(function () {
				$(this).removeClass('fileupload-processing');
			}).done(function (result) {
				$(this).fileupload('option', 'done')
					.call(this, $.Event('done'), {result: result});
			});
		}
		$.ajax({
			url: admin_url+'/get_folder',
			dataType: 'json',
			data: '',
		})
		.done(function(data){
		//	console.log(data);
			if(data.length > 0){
			var level = 1;
			for($i=0;$i<data.length;$i++){
					var html = '';
					html += '<li class="panel folder" data-level="1">';
					if('sub' in data[$i]){
						html += '<div class="btn-delete-folder" data-path="'+data[$i]['name']+'"><i class="fa fa-times"></i></div>'
						html += '<a class="fileupload-caller" href="<?=$this->admin_url?>upload/'+data[$i]['name']+'/'+'" data-toggle="collapse" data-target="#sub-folders-'+($i+1)+'" data-parent="#folders"><i class="fa fa-folder-open fa-lg"></i><span>'+data[$i]['name']+'</span></a>';
						html += '<ul id="sub-folders-'+($i+1)+'" class="sub-folders collapse">';
						html += '<li class="btn btn-default btn-sm btn-create-folder"><i class="fa fa-plus"></i>Create new folder</li>';
						for($j=0;$j<data[$i]['sub'].length;$j++){
							html += '<li class="panel folder" data-level="2">';
							if('sub' in data[$i]['sub'][$j]){
								html += '<div class="btn-delete-folder" data-path="'+data[$i]['name']+'/'+data[$i]['sub'][$j]['name']+'"><i class="fa fa-times"></i></div>';
								html += '<a class="fileupload-caller" href="<?=$this->admin_url?>upload/'+data[$i]['name']+'/'+data[$i]['sub'][$j]['name']+'/'+'" data-toggle="collapse" data-target="#closest-'+($i+'-'+($j+1))+'" data-parent="#sub-folders-'+($i+1)+'"><i class="fa fa-folder-open fa-lg"></i><span>'+data[$i]['sub'][$j]['name']+'</span></a>';
								html += '<ul id="closest-'+($i+'-'+($j+1))+'" class="sub-sub-folders collapse">';
								html += '<li class="btn btn-default btn-sm btn-create-folder"><i class="fa fa-plus"></i>Create new folder</li>';
								for($k=0;$k<data[$i]['sub'][$j]['sub'].length;$k++){
									html += '<li class="folder" data-level="3">';
										html += '<div class="btn-delete-folder" data-path="'+data[$i]['name']+'/'+data[$i]['sub'][$j]['name']+'/'+data[$i]['sub'][$j]['sub'][$k]+'"><i class="fa fa-times"></i></div>';
										html += '<a class="fileupload-caller" href="<?=$this->admin_url?>upload/'+data[$i]['name']+'/'+data[$i]['sub'][$j]['name']+'/'+data[$i]['sub'][$j]['sub'][$k]+'/"><i class="fa fa-folder-open fa-lg"></i><span>'+data[$i]['sub'][$j]['sub'][$k]+'</span></a>';
									html += '</li>';
								}
								html += '</ul>';
							}
							else{
								html += '<div class="btn-delete-folder" data-path="'+data[$i]['name']+'/'+data[$i]['sub'][$j]['name']+'"><i class="fa fa-times"></i></div>';
								html += '<a class="fileupload-caller" href="<?=$this->admin_url?>upload/'+data[$i]['name']+'/'+data[$i]['sub'][$j]['name']+'/'+'" data-toggle="collapse" data-target="#closest-'+($i+'-'+($j+1))+'" data-parent="#sub-folders-'+($i+1)+'"><i class="fa fa-folder-open fa-lg"></i><span>'+data[$i]['sub'][$j]['name']+'</span></a>';
								html += '<ul id="closest-'+($i+'-'+($j+1))+'" class="sub-sub-folders collapse">';
								html += '<li class="btn btn-default btn-sm btn-create-folder"><i class="fa fa-plus"></i>Create new folder</li>';
								html += '</ul>';
							}
							html += '</li>';
						}
						html += '</ul>';
					}
					else{
						html += '<div class="btn-delete-folder" data-path="'+data[$i]['name']+'"><i class="fa fa-times"></i></div>';
						html += '<a class="fileupload-caller" href="<?=$this->admin_url?>upload/'+data[$i]['name']+'/" data-toggle="collapse" data-target="#sub-folders-'+($i+1)+'" data-parent="#folders"><i class="fa fa-folder-open fa-lg"></i><span>'+data[$i]['name']+'</span></a>';
						html += '<ul id="sub-folders-'+($i+1)+'" class="sub-folders collapse">';
						html += '<li class="btn btn-default btn-sm btn-create-folder"><i class="fa fa-plus"></i>Create new folder</li>';
						html += '</ul>';
					}
					html += '</li>';
					$('#folder-wrapper > ul').append(html);
				}
				var last = $('#folder-wrapper').data('last');
				$('.container').callFileUpload(last);
				var activeCat = $('.fileupload-caller[href="'+last+'"]');
				activeCat.parent().addClass('active');
				activeCat.parents('ul').addClass('in');
			}
		});
		var uni = 100;
		$(document).on('click', '.btn-create-folder', function(){
			if($('#create-folder').length > 0)
				$('#create-folder').remove();
			$(this).after('<li id="create-folder" class="input-group"><input class="form-control input-sm"/><span class="input-group-btn"><button class="btn btn-default btn-sm btn-add-folder">Create</button></span></li>');
			$('#create-folder > input').focus();
			$('.btn-add-folder').click(function(){
				var wrapper = $(this).closest('.input-group'),
					parent_folder = $('#create-folder').closest('.folder'),
					full_name = '',
					name = $('#create-folder input').val() != '' ? $('#create-folder input').val() : '';
				var parent_level = parent_folder.data('level') || 0;
				console.log($(parent_folder).closest('.folder').length);
				if(parent_folder.length > 0)
					full_name = ($(parent_folder).parent().closest('.folder').length > 0 ? $(parent_folder).parent().closest('.folder').find('a>span').html()+'/' : '') + $(parent_folder).find('a>span').html() +'/'+ name;
				else
					full_name = name;

				if(full_name != '')
				{
					if(!/[^a-z|^A-Z|^0-9|^_]/g.test(name)){
						$.ajax({
							type: 'post',
							url: admin_url+'/create_folder',
							data: { 'name' : full_name }
						})
						.done(function(response){
							if(response == 'ok'){
								var append = '<li class="panel folder" data-level="'+(parent_level+1)+'">';
								append += '<div class="btn-delete-folder" data-path="'+full_name+'"><i class="fa fa-times"></i></div>';
								if(parent_level < 2){
									append += '<a href="<?=$this->admin_url?>upload/'+full_name+'/" class="fileupload-caller" data-toggle="collapse" data-target="#'+uni+'" data-parent="#'+parent_folder.find('>ul').attr("id")+'"><i class="fa fa-folder-open-o fa-lg"></i><span>'+$('#create-folder input').val()+'</span></a>';
									append += '<ul id="'+uni+'" class="'+ (parent_level == 0 ? "sub-folders" :	"sub-sub-folders") + ' collapse in">';
									append += '<li class="btn btn-default btn-sm btn-create-folder"><i class="fa fa-plus"></i>Create new folder</li>';
									append += '</ul>';
								}
								else{
									append += '<a href="<?=$this->admin_url?>upload/'+full_name+'/" class="fileupload-caller"><i class="fa fa-folder-open-o fa-lg"></i><span>'+$('#create-folder input').val()+'</span></a>';
								}
								append += '</li>';
								wrapper.after(append);
								$('#create-folder').remove();
							}
							else
								alert('Can not create folder');
						})
					}
					else
						alert('Folder name contains disallowed characters');
				}
				else
					alert('Folder name can not be null');
			})
			uni++;
		})
		$(document).on('click', '.btn-delete-folder', function(){
			if(confirm('Delete?')){
				var container = $(this).closest('.folder'),
					path = $(this).data('path');
				$.ajax({
					type: 'post',
					url: admin_url+'/delete_folders',
					data: { 'path' : path }
				})
				.done(function(response){
					if(container.hasClass('active')){
						$('.files').empty();
						var next = $(container).next('.folder');
						if(next.length > 0){
							next.addClass('active');
							$('.container').callFileUpload($(next).children('.fileupload-caller').attr('href'));
						}
						else{
							$(container).parent().closest('.folder').addClass('active');
							$('.container').callFileUpload($(container).parent().siblings('.fileupload-caller').attr('href'));
						}
					}
					container.remove();
				})
			}
			else
				return false;
		});
		var full = '<?=$_GET['full']?>';
		var target = '<?=$_GET['target']?>';
		var alt = '<?=$_GET['alt']?>';
		$(document).on('click','.get-url',function(){
			$url = $(this).parent().data('url');
			var iparent = window.parent.document.body;
			var list = ['input#cke_112_textInput', 'input#cke_104_textInput', 'input#cke_81_textInput', 'input.pasted-url'];
			/* for($i=0;$i<list.length;$i++){
				var target = $(list[$i],iparent);
				if(target.length > 0){
					target.val($url);
				}
			} */
			if(full != 'null')
				$('input#'+full, iparent).val($url);
			if(target != 'null')
				$('input#'+target, iparent).val($url.substr($url.indexOf('data/')+5));
			if(alt != 'null')
				$('img#'+alt, iparent).attr('src',$url);
			parent.$.fancybox.close();
		});
	})
</script>
</body>
</html>