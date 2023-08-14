$('#menuHome').hover(function(){
	$(this).children('#subMenuHome').stop().slideDown();
}, function(){
	$(this).children('#subMenuHome').stop().slideUp();
});

$('#menuCategory').hover(function(){
	$(this).children('#subMenuCategory').stop().slideDown();
}, function(){
	$(this).children('#subMenuCategory').stop().slideUp();
});


$('#menuCustomTravelAdventure').hover(function(){
	$(this).children('#subMenuCustomTravelAdventure').stop().slideDown();
}, function(){
	$(this).children('#subMenuCustomTravelAdventure').stop().slideUp();
});

$('#menuReview').hover(function(){
	$(this).children('#subMenuReview').stop().slideDown();
}, function(){
	$(this).children('#subMenuReview').stop().slideUp();
});
