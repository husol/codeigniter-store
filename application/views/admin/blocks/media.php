<div class="clearfix">
	<div id="folder-wrapper" class="col col-xs-12 col-sm-3">
		<ul id="folders" class="no-padding">
		</ul>
	</div>
	<div class="col col-xs-12 col-sm-9 col-img-list border radius">
    <form id="fileupload-2" action="" class="table-responsive" method="POST" enctype="multipart/form-data">
        <div class="fileupload-buttonbar-2 no-radius">
            <div class="col-lg-7 padding-5">
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
        <table role="presentation" class="table table-striped table-img">
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
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
            </p>
            {% if (file.error) { %}
                <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } %}
        </td>       
		<td>
			<a class="get-url color-white" href="{%=file.url%}" target="_blank">Original</a>
			{% if (file.largeUrl) { %}
				<a class="get-url color-white" href="{%=file.largeUrl%}" target="_blank">Large (670x670)</a>
			{% } %}
			{% if (file.mediumUrl) { %}
				<a class="get-url color-white" href="{%=file.mediumUrl%}" target="_blank">Medium (540x540)</a>
			{% } %}
			<a class="get-url color-white" href="{%=file.smallUrl%}" target="_blank">Small (320x320)</a>
			<a class="get-url color-white" href="{%=file.thumbnailUrl%}" target="_blank">Thumbnail (150x150)</a>
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
</script>
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
<!-- The main application script -->
<script src="<?=base_url()?>/asset/jQueryFileUpload/js/main.js"></script>
<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
<script>
	$(function(){
		
	})
</script>