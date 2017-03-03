$(document).on('turbolinks:load', function() {
	$('.owl-carousel').owlCarousel({
       	autoPlay: 2000,
	  	responsiveClass:true,
	    items: 1
    });
    window.lightbox.init();
});
