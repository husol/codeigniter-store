$(function() {
    var baseurl = window.location.protocol + '//' + window.location.hostname;
    $(document).ready(function() {
        $('.form-quick-search input').keyup(function() {
            var empty = false;
            if ($('.form-quick-search input[type="text"]').val().length == 0) empty = true;
            if (empty) $('input[type="submit"]').attr('disabled', 'disabled');
            else
                $('input[type="submit"]').removeAttr('disabled');
        })
    });
    $(window).on('scroll', function() {
        if ($(window).scrollTop() > 200) { $('#header-sec-1').hide();
            $('.skyscrapper').css('margin-top', '50px'); } else { $('#header-sec-1').show();
            $('.skyscrapper').css('margin-top', '182px'); }
        if ($(window).scrollTop() > 500) $('#floating-up').show();
        else
            $('#floating-up').hide();
    });
    $(document).on('click', '#floating-up', function() { $('html, body').animate({ scrollTop: 0 }, 500, 'swing'); });
    var offset = $('#header-sec-3').offset();
    var top = offset.top;
    $(window).on('scroll', function() { check_scroll(); })

    function check_scroll() {
        var scroll_top = $(window).scrollTop();
        if (scroll_top > top) { $('#header-sec-3').addClass('fixed'); } else { $('#header-sec-3').removeClass('fixed'); }
    }

    if($('#partners-carousel').length){
        $("#partners-carousel").marquee({
                        //speed in milliseconds of the marquee
                        duration: 15000,
                        //gap in pixels between the tickers
                        gap: 50,
                        //time in milliseconds before the marquee will start animating
                        delayBeforeStart: 0,
                        //'left' or 'right'
                        direction: 'left',
                        //true or false - should the marquee be duplicated to show an effect of continues flow
                        duplicated: true,
                        // pauseOnHover
                        pauseOnHover: true
                    });
    }

    $('#gallery').flexslider({
        animation: "slide",
        controlNav: true,
        animationLoop: false,
        slideshow: true,
        start: function(slider){
            $('#gallery').removeClass('loading');
        }
    });

    $('#big-slider').camera({
        alignment: 'center',
		height: '33.3%',
        loader: 'none',
        time: 4000,
        fx: 'random',
		portrait: true,
        playPause: false,
        transPeriod: 500
    });

    if($("div.post-cover").length){
        $("div.post-cover img").elevateZoom({easing : true});
    }
})
