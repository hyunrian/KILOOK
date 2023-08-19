<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(function() {
	
	$("#menuCategory").hover(function() {
		$("#subMenuCategory").stop().fadeIn(200);
	}, function() {
		$("#subMenuCategory").stop().fadeOut(200);
	});
	
	let loginInfo = "${sessionScope.loginInfo}";
	console.log("info:", loginInfo)
	if (loginInfo != null) { // 세션값이 있는 경우에만 동작해야 하는데 세션값 유무와 상관없이 출력됨 -> 수정 필요
		$("#menuUser").hover(function() {
			console.log("in");
			$("#subMenuUser").stop().fadeIn(200);
		}, function() {
			console.log("out");	
			$("#subMenuUser").stop().fadeOut(200);
		});
	}
	
});
</script>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a href="/">
				<!-- 기본 로고 -->
				<img src="/resources/images/logo/logo_wh.png" style="width: 140px;" class="mainLogo">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span>
				Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto" class="mainmenu">
					<li id="menuHome" class="nav-item">
						<a href="/" class="nav-link mainMenu">Home</a>
					</li>
					<li id="menuCategory" class="nav-item">
						<a href="/databoard/restaurant" class="nav-link mainMenu">Place</a>
						<!-- 서브메뉴 추가 -->
						<div style="postion: relative;">
							<span style="position: fixed; z-index: 3; font-size: 30pt; left: 56.2%; top: 14.6%;
									transform: translate(-70%, -50%); display: none;" id="subMenuCategory">
								<ul class="noDot">
									<li class="nav-item-"><a href="/databoard/restaurant"
										style="color: white;">맛집</a></li>
									<li class="nav-item"><a href="/databoard/accommodation"
										style="color: white;">숙소</a></li>
									<li class="nav-item"><a href="/databoard/attraction"
										style="color: white;">명소</a></li>
									<li class="nav-item"><a href="/databoard/show"
										style="color: white;">전시</a></li>
									<li class="nav-item"><a href="/databoard/cafe"
										style="color: white;">카페</a></li>
									<li class="nav-item"><a href="/databoard/parking"
										style="color: white;">주차장</a></li>
									<li class="nav-item"><a href="/databoard/tourguide"
										style="color: white;">관광안내소</a></li>
								</ul>		
							</span>
						</div>
					</li>
					<li id="menuReview" class="nav-item">
						<a href="/userboard/list" class="nav-link mainMenu">Review</a>
					</li>
					
					<li id="menuPoint" class="nav-item">
						<a href="/point/main" class="nav-link mainMenu">Shop</a>
					</li>
					
					<!-- 사용자(유저) 페이지 링크 -->
					<li id="menuUser" class="nav-item cta">
						<a href="/userInfo/mypage" class="nav-link mainMenu">
							<i class="fa-solid fa-user fa-lg user-link" style="color: #ffffff;"></i>
						</a>
						<span style="position: fixed; z-index: 3; font-size: 30pt; left: 70.2%; top: 9.9%;
 									transform: translate(-70%, -50%); display: none;" id="subMenuUser">
							<ul class="noDot">
								<li class="nav-item">
									<a href="/loginUser/logout" style="color: white;">로그아웃</a>
								</li>
								<li class="nav-item">
									<a href="/userInfo/mypage" style="color: white;">마이페이지</a>
								</li>
							</ul>		
						</span>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- END nav -->
	<!-- END menu -->