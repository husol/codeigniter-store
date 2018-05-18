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
    'use strict';
    // Initialize the jQuery File Upload widget:
    $('#fileupload-2').fileupload({
        // Uncomment the following to send cross-domain cookies:
        //xhrFields: {withCredentials: true},
        url: 'ad_admin/upload',
		disableImageResize: /Android(?!.*Chrome)|Opera/
			.test(window.navigator.userAgent),		
		maxFileSize: 5000000,		
		acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
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
		console.log(result);
		$(this).fileupload('option', 'done')
			.call(this, $.Event('done'), {result: result});
	});
    

});
