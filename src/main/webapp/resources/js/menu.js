/* 서브메뉴창 추가 */

$("#menuCategory").hover(function() {
	console.log("in");
	$("#subMenuSpan").stop().fadeIn(200);
}, function() {
	console.log("out");	
	$("#subMenuSpan").stop().fadeOut(200);
});
