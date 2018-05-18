$(function(){
	CKEDITOR.replace('module-content');
	CKEDITOR.replace('module-content-2');
	$(document).on('click','.choose-type',function(e){
		e.preventDefault();
		console.log('clicked');
		if($(this).hasClass('cate-active') || $(this).siblings('ul:has(li)').length)
			return false;
		else{
			$('#alt-val').val('');
			$('#meta').val('');
			$('#mcid').val($(this).data('mcid'));
			$('#module-type').val($(this).html());
			if($(this).data('st')){
				if($(this).data('fn')){
					switch($(this).data('fn')){
						case 'category_tree':
							activeField('#category-tree');
							break;
						default:
							activeField('#single-value');
							break;
					}
				}
			}
			else{
				activeField();
			}
			$('.choose-type').removeClass('cate-active');
			$(this).addClass('cate-active');
		};
	});
	function activeField( wrapper ){
		if(wrapper !== undefined){
			$('.additional-val:not(wrapper)').hide();
			$('.additional-val:not(wrapper) input').removeAttr('required');
			$(wrapper).show();
			$('input', wrapper).attr('required', 'required');
		}
		else{
			$('.additional-val').hide();
			$('.additional-val input').removeAttr('required');
		}
	};
	$('input', '.form-module').on('change',function(){
		$('.btn-module').removeAttr('disabled');
	})
})