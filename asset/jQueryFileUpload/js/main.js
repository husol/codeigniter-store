/*
 * jQuery File Upload Plugin JS Example 8.9.0
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */

/*jslint nomen: true, regexp: true */
/*global $, window, blueimp */

$(function () {
	var admin_url = "tradmin";
	$(document).on('click','.fileupload-caller', function(e){
	//	alert($(this).attr('href'));
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
			acceptFileTypes: /(\.|\/)(gif|jpe?g|png|rar|zip)$/i,
			imageMaxWidth: 1200,
			imageMaxHeight: 1200
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
		//	console.log(result);
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
		console.log(data);
	//	alert(data.length);
		for($i=0;$i<data.length;$i++){
		//	console.log(data[0]);
			if(data[$i].length != 0){
				var html = '';
				if(data[$i]['name'] == 'upload')
					html += '<li class="folder active">';
				else
					html += '<li class="folder">';
				if('sub' in data[$i])
				{						
					html += '<span data-toggle="collapse" href="#sub-folders-'+($i+1)+'" data-parent="#folders"><i class="fa fa-plus-square"></i>'+data[$i]['name']+'</span>';
					html += '<ul id="sub-folders-'+($i+1)+'" class="collapse">';
					for($j=0;$j<data[$i]['sub'].length;$j++){
						html += '<li><a class="fileupload-caller" href="<?=$this->admin_url?>upload/'+data[$i]['name']+'/'+data[$i]['sub'][$j]+'"><i class="fa fa-folder-open fa-lg"></i>'+data[$i]['sub'][$j]+'</a></li>';
					}
					html += '</ul>';
				}
				else
				{
					html += '<a class="fileupload-caller" href="<?=$this->admin_url?>upload/'+data[$i]['name']+'"><i class="fa fa-folder-open fa-lg"></i>'+data[$i]['name']+'</a>';
				}
				html += '</li>';
				$('#folder-wrapper > ul').append(html);
			}
		}
	});
	$(window).load(function(){
		$('.container').callFileUpload(admin_url+'/upload/upload');
	})
	$(document).on('click','.get-url',function(e){
		e.preventDefault();
		$url = $(this).attr('href');
		var iparent = window.parent.document.body;
		var list = ['input#cke_104_textInput','input.pasted-url'];
		for($i=0;$i<list.length;$i++){
			var target = $(list[$i],iparent);
			if(target.length > 0){
				target.val($url);						
			}
		}	
		parent.$.fancybox.close();
	})	
});
