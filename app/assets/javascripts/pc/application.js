
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.infinitescroll
//= require turbolinks

//= require swiper
//= require photoswipe
//= require photoswipe-ui-default
//= require index
//= require timeline.coffee

$(document).ready(function() {
  if ($('.pagination').length) {
    $(window).scroll(function() {
      var url = $('.pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.pagination').text("Please Wait...");
        return $.getScript(url);
        var swiper = new Swiper('.swiper-container', {
          pagination: '.swiper-pagination',
          effect: 'coverflow',
          grabCursor: true,
          centeredSlides: true,
          slidesPerView: 'auto',
          coverflow: {
            rotate: 50,
            stretch: 0,
            depth: 100,
            modifier: 1,
            slideShadows : true
          }
        });
        console.log('pagenated')
      }
    });
    return $(window).scroll();
  }
});