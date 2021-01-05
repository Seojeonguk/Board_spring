$(window).resize(function (){
  var width_size = window.innerWidth;
  // 800 이하인지 if문으로 확인
  if (width_size >= 991) {
  	$('.content').removeClass('menu-toggle-active');
  	$('nav').removeClass('active');
  }
})