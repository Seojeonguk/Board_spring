$(document).ready(function() {
	$('.menu-toggle').click(function() {
		$('nav').toggleClass('active');
		$('.content').toggleClass('menu-toggle-active');
	});
	
	$('ul li').click(function(){
		$(this).siblings().removeClass('active');
		$(this).toggleClass('active');
	});
});

