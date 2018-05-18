$(function(){
	$(document).on('click','.btn-delete-img',function(e){
		e.stopPropagation();
		var parent = $(this).parent();
		parent.remove();
		$('#img-caption-wrapper').hide();
		updateGallery();
	});
//	var gallery = $('#gallery').val() != '' ? $('#gallery').val().split(', ') : [];
	$('a.btn-gallery').fancybox({
		padding: 10,
		height: '80%',
		afterClose: function(){
			if($('.gallery-item>img[src=""]').length == 0){
				$('.gallery-item > img').removeAttr('id');
				var html = '<span class="gallery-item new" ><img id="gallery-img" src=""/><span class="btn-delete-img"><i class="fa fa-times"></i></span></span>';
				$('#gallery-wrapper').append(html);
				updateGallery();
			}
		}
	});
	$(document).on('click', '.gallery-wrapper .gallery-item', function(){
		$('.gallery-item').removeClass('active');
		$(this).addClass('active');
		var _this = $(this).index();
		$('#img-caption-wrapper').show();
		var target = $('#img-caption');
		$('div:first-child textarea', target).focus().val($(this).data('caption'));
		$('div:last-child textarea', target).val($(this).data('caption-trans'));
	})
	$('#img-caption > div').each(function(){
		var _this = $(this).index();
		$(this).find('textarea').change(function(){
			_this == 0 ? $('#gallery-wrapper .gallery-item.active').data('caption', $(this).val()) : $('#gallery-wrapper .gallery-item.active').data('caption-trans', $(this).val());
			updateGallery();
		})
	})
	function updateGallery(){
		var meta = {'slideshow': {}};
			i = 0;
		$('.gallery-item>img:not([src=""])').each(function(){
			
			meta.slideshow[i] = {'src': filterSrc($(this).attr('src')), 'caption': $(this).parent().data('caption'), 'caption_trans': $(this).parent().data('caption-trans')};
			i++;
		})
		$('#meta').val(JSON.stringify(meta));
	}
	function filterSrc(url){
		var str = url.substring(url.lastIndexOf('/asset/data/') + 12);
		return str;
	}
})