$(function(){
	var sep = window.location.hostname == 'localhost' ? window.location.pathname.substr(1).split('/')[0]+'/'+window.location.pathname.substr(1).split('/')[1] : window.location.pathname.substr(1).split('/')[0];
	var admin_url = window.location.protocol+'//'+window.location.hostname+'/'+sep;
	$page = window.location.hostname == 'localhost' ? location.pathname.substr(1).split('/')[2] : location.pathname.substr(1).split('/')[1];
	if($page != '')
		menu_active($page);
	else
		menu_active('settings');
	function menu_active($page){
	//	$('#left-wrapper').removeClass('active');
		var active = $('li[class*="menu-'+$page+'"]');
		active.addClass('active');
		active.closest('.menu-parent').addClass('active');
	}
	$(document).on('click', '.btn-stat', function(){
		var wrapper = $(this).closest('tr');
		var parent = $(this).parent();
		var cat = wrapper.data('cat');
		var id = wrapper.data('id');
		var type = $(this).data('type');
		var class1 = '';
		var class2 = '';
		switch(type){
			case 'stat':
				class1 = 'fa-check-square-o';
				class2 = 'fa-square-o';
				break;
			case 'featured':
				class1 = 'fa-star';
				class2 = 'fa-star-o';
				break;
		}
		var stat = $(this).data('stat');
		if(stat == 0)
			stat = 1;
		else
			stat = 0;
		url = admin_url+'/ajax_update';
		$.ajax({
			type: "POST",
			url: url,
			data: { cat: cat, id: id, type : type, stat : stat }
		})
		.done(function( data ){
			if(data == 'ok'){
				if(stat == 0){
					$('.btn-stat', parent).removeClass(class1);
					$('.btn-stat', parent).addClass(class2);
				}
				else{
					$('.btn-stat', parent).removeClass(class2);
					$('.btn-stat', parent).addClass(class1);
				}
				$('.btn-stat', parent).data('stat', stat);
			}
		});
	});

	$(document).on('click','.btn-delete',function(){
		var answer = confirm("Really sure want to delete this?");
		if (answer){
			var wrapper = $(this).closest('tr');
			var cat = wrapper.data('cat');
			var id = wrapper.data('id');
			var container = $(this).closest('.dynamic-container');
			var url = admin_url+"/ajax_delete";
			$.ajax({
				type: "POST",
				url: url,
				data: { cat: cat, id: id }
			})
			.done(function( data ) {
				if(data == 'ok')
					wrapper.remove();
				else
					alert(data);
			});
		}
		else {
            return false;
        }
	})

	$(document).on('click','.btn-delete-2',function(){
		var answer = confirm("Really sure want to delete this?");
		if (answer){
			var id = $(this).data('id');
			var cat = $(this).data('cat');
			var redirect = $(this).data('redirect');
			var url = admin_url+"/ajax_delete";
			$.ajax({
				type: "POST",
				url: url,
				data: { cat: cat, id: id }
			})
			.done(function( data ) {
				if(data == 'ok')
					window.location.replace(redirect);
				else
					alert(data);
			//	container.empty();
			//	container.append(data);
			});
		}
		else {
            return false;
        }
	})


	$(document).on('focus','table.cke_dialog_contents > tbody > tr > td.cke_dialog_contents_body > .cke_dialog_page_contents > table > tbody > tr:first-child .cke_dialog_ui_hbox_first input',function(){
	//	$('.cke_dialog_ui_hbox_last').remove();
		var container = $(this).closest('tr');
		var ck = $(document).checkBtn(container);
		if(ck && $('table.cke_dialog_contents a.btn-browse').length == 0) {
			$(container).append('<a class="btn btn-browse btn-ck" data-fancybox-type="iframe" href="'+admin_url+'/get_uploader?full='+$(container).find('input.cke_dialog_ui_input_text').attr('id')+'&target=null&alt=null">Choose image</a>');
        }
	})

	$('.btn-depend, .btn-browse, #media-loader a').fancybox({
		padding : 10,
		height: '80%'
	});

	$.fn.checkBtn = function(obj){
		var num = $('.btn-depend', obj).size();
	//	alert(num);
		if(num > 0){
			return false;
		}
		else{
			return true;
		}
	}

	$('#menu-type').change(function(){
		var selected = $(this).find('option:selected');
		if(selected.data('type'))
			$('#article-chooser').show();
		else{
			$('#article-chooser').hide();
			$('#target').val(0);
			$('#choosen-post').val('');
		}
	})

	$(document).on('change', '#alt-val', function(){
		var val = $(this).val();
		var key = $('#form-module-wrapper').data('ytkey');
		var url = 'https://www.googleapis.com/youtube/v3/videos?id='+val+'&key='+key+'&part=snippet&fields=items(id,snippet(channelId,title,thumbnails,channelTitle))';
		$.ajax({
			type: "GET",
			url: url
		})
		.done(function(data){
			console.log(data);
			var content = '';
			if(data.items.length > 0){
				content = '{"val":"'+val+'","title":"'+data.items[0].snippet.title+'","thumbnail":"'+data.items[0].snippet.thumbnails.medium.url+'","channelId":"'+data.items[0].snippet.channelId+'","channelTitle":"'+data.items[0].snippet.channelTitle+'"}';
			}
			else
				content = '{"val":"'+val+'"}'
			$('#meta').val(content);

		})
	})

	$('#article-browser').fancybox({
		padding : 10,
		height: '80%'
	});

	$(document).ajaxStart(function(){
		$('#overlay').show();
	})

	$(document).ajaxStop(function(){
		$('#overlay').hide();
	//	$('input:not(:button, :submit)').val('');
	})

})