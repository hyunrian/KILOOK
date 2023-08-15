<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
@font-face {
	font-family: "Pretendard-Black";
	src: url("/resources/fonts/myfont/Pretendard-Black.ttf") format("ttf");
}

body {
	font-family: "Pretendard-Black", sans-serif;
}

<!-- 상단으로 이동 버튼 -->
#pageUp { 
	position: fixed;
	right: 20px;
	bottom: 20px;
	width: 50px;
	height: 50px;
}
</style>
<script>
$(function() {
	$.get("/attach/displayThumbnail/${userBoardVo.bno}", function(rData) {
		// 이미지를 업로드하지 않은 게시글 썸네일 처리부터 해야 함
		console.log(rData);		
	});
});
</script>

<%@ include file="/WEB-INF/views/include/menu.jsp"%>

	<div class="hero-wrap js-fullheight" id="top"
		style="background-image: url('/resources/images/bg_4.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
				data-scrollax-parent="true">
				<div class="col-md-9 ftco-animate text-center"
					data-scrollax=" properties: { translateY: '70%' }">
					<h1 class="mb-3 bread"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
						우리가 만들어가는<br>부산 여행 추천 코스
					</h1>
					<p class="breadcrumbs"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
						<span>혼자만 알고 있기 아쉬운 다양한 코스를 다른 사람들과 공유해보세요!</span>
					</p>
					<br>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Type a keyword and hit enter"><span class="icon fa fa-search" aria-hidden="true"></span>
						<input type="submit" class="search-submit btn btn-primary" value="Search">
					</div>
					
					<a class="btn btn-lg" href="/userboard/write" 
						style="background-color:#78d5ef; color:white;">
						나의 여행 코스 등록하기
					</a>
				</div>
			</div>
		</div>
	</div>
	
		<section class="ftco-section bg-light">
			<div class="container">
				<div class="row d-flex">
					<c:forEach var="userBoardVo" items="${userArticleList}">
						<div class="col-md-3 d-flex ftco-animate">
							<div class="blog-entry align-self-stretch">
<%-- 								<a href="/userboard/detail?bno=${userBoardVo.bno}" class="block-20" --%>
<!-- 									style="background-image: url('/resources/images/image_1.jpg');"> -->
								<a href="/userboard/detail?bno=${userBoardVo.bno}" 
									class="block-20 thumbnail" data-bno="${userBoardVo.bno}"
									style="background-image: url('/attach/displayThumbnail/${userBoardVo.bno}');">
								</a>
								<div class="text p-4 d-block">
									<h3 class="heading mt-3">
										<a href="#">${userBoardVo.title}</a>
									</h3>
									<div class="meta mb-3">
										<div>
											<a href="#">${userBoardVo.writer}</a>
										</div>
										<br>
										<div class="boardContents" style="margin-right: 40px; margin-left:15px;">
											<a href="#" class="meta-chat"><i class="fa-regular fa-eye"></i>
												${userBoardVo.viewcnt}</a>
										</div>
										<div class="boardContents" style="margin-right: 40px;">
											<a href="#" class="meta-chat"><i class="fa-solid fa-heart"></i>
												${userBoardVo.likecnt}</a>
										</div>
										<div class="boardContents">
											<a href="#" class="meta-chat"><span class="icon-chat"></span>
												${userBoardVo.replycnt}</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
	
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row d-flex">
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="/resources/blog-single.html" class="block-20"
							style="background-image: url('/resources/images/image_1.jpg');">
						</a>
						<div class="text p-4 d-block">
							<span class="tag">Tips, Travel</span>
							<h3 class="heading mt-3">
								<a href="#">8 Best homestay in Philippines that you don't
									miss out</a>
							</h3>
							<div class="meta mb-3">
								<div>
									<a href="#">August 12, 2018</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="/resources/blog-single.html" class="block-20"
							style="background-image: url('/resources/images/image_2.jpg');">
						</a>
						<div class="text p-4">
							<span class="tag">Culture</span>
							<h3 class="heading mt-3">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
							<div class="meta mb-3">
								<div>
									<a href="#">August 12, 2018</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="/resources/blog-single.html" class="block-20"
							style="background-image: url('/resources/images/image_3.jpg');">
						</a>
						<div class="text p-4">
							<span class="tag">Tips, Travel</span>
							<h3 class="heading mt-3">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
							<div class="meta mb-3">
								<div>
									<a href="#">August 12, 2018</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="/resources/blog-single.html" class="block-20"
							style="background-image: url('/resources/images/image_4.jpg');">
						</a>
						<div class="text p-4">
							<span class="tag">Tips, Travel</span>
							<h3 class="heading mt-3">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
							<div class="meta mb-3">
								<div>
									<a href="#">August 12, 2018</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="/resources/blog-single.html" class="block-20"
							style="background-image: url('/resources/images/image_5.jpg');">
						</a>
						<div class="text p-4 d-block">
							<span class="tag">Tips, Travel</span>
							<h3 class="heading mt-3">
								<a href="#">8 Best homestay in Philippines that you don't
									miss out</a>
							</h3>
							<div class="meta mb-3">
								<div>
									<a href="#">August 12, 2018</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="/resources/blog-single.html" class="block-20"
							style="background-image: url('/resources/images/image_6.jpg');">
						</a>
						<div class="text p-4">
							<span class="tag">Culture</span>
							<h3 class="heading mt-3">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
							<div class="meta mb-3">
								<div>
									<a href="#">August 12, 2018</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="/resources/blog-single.html" class="block-20"
							style="background-image: url('/resources/images/image_7.jpg');">
						</a>
						<div class="text p-4">
							<span class="tag">Tips, Travel</span>
							<h3 class="heading mt-3">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
							<div class="meta mb-3">
								<div>
									<a href="#">August 12, 2018</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="/resources/blog-single.html" class="block-20"
							style="background-image: url('/resources/images/image_8.jpg');">
						</a>
						<div class="text p-4">
							<span class="tag">Tips, Travel</span>
							<h3 class="heading mt-3">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
							<div class="meta mb-3">
								<div>
									<a href="#">August 12, 2018</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>
										3</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">
						<ul>
							<li><a href="#">&lt;</a></li>
							<li class="active"><span>1</span></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&gt;</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 상단으로 이동 버튼 -->
	<a href="#top"> <img alt="맨 위로 이동"
		src="/resources/images/myicons/up-arrow.png" id="pageUp">
	</a>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.easing.1.3.js"></script>
	<script src="/resources/js/jquery.waypoints.min.js"></script>
	<script src="/resources/js/jquery.stellar.min.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/aos.js"></script>
	<script src="/resources/js/jquery.animateNumber.min.js"></script>
	<script src="/resources/js/bootstrap-datepicker.js"></script>
	<script src="/resources/js/jquery.timepicker.min.js"></script>
	<script src="/resources/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/resources/js/google-map.js"></script>
	<script src="/resources/js/main.js"></script>

</body>
</html>