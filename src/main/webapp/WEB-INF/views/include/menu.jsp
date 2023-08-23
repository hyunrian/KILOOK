<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

/* 드롭다운 텍스트 옆 화살표 제거 */
.dropdown-toggle::after {
	display: none;
}

/* 드롭다운 메뉴 설정 */
.subMenu {
	font-size: 14px;
	padding-bottom: 0.9rem;
	font-weight: 400;
 	background-color: black!important;
 	opacity: 70%;
 	min-width: 0rem;
 	margin-top: 8px;
}

/* 드롭다운 메뉴 폰트 컬러 설정 */
.options {
	color: white;
}
</style>
<script>
$(function() {
	let loginInfo = "${sessionScope.loginInfo}";
	if (!loginInfo) { 
		$("#subMenuUser").hide(); // 로그인한 경우에만 회원정보/로그아웃 메뉴 출력
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
					<li id="menuCategory" class="nav-item dropdown">
						<a href="/databoard/restaurant" class="nav-link mainMenu dropdown-toggle">Place</a>
						<div class="dropdown-menu subMenu">
							<a class="dropdown-item options" href="/databoard/restaurant">맛집</a>
							<a class="dropdown-item options" href="/databoard/accommodation">숙소</a>
							<a class="dropdown-item options" href="/databoard/attraction">명소</a>
							<a class="dropdown-item options" href="/databoard/show">전시</a>
							<a class="dropdown-item options" href="/databoard/cafe">카페</a>
							<a class="dropdown-item options" href="/databoard/parking">주차장</a>
							<a class="dropdown-item options" href="/databoard/tourguide">관광안내소</a>
						</div>
					</li>
					<li id="menuReview" class="nav-item">
						<a href="/userboard/list" class="nav-link mainMenu">Review</a>
					</li>
					
					<li id="menuPoint" class="nav-item">
						<a href="/point/main" class="nav-link mainMenu">Shop</a>
					</li>
					<!-- 유저 메뉴 -->
					<li id="menuUser" class="nav-item cta dropdown">
						<a href="/userInfo/mypage" class="nav-link mainMenu dropdown-toggle" 
							style="margin-left: 20px; margin-right: 0px;">
							<i class="fa-solid fa-user fa-lg user-link" style="color: #ffffff;"></i>
						</a>
						<div class="dropdown-menu subMenu" id="subMenuUser">
							<a class="dropdown-item options" href="/loginUser/logout">로그아웃</a>
							<a class="dropdown-item options" href="/userInfo/mypage">마이페이지</a>
						</div>
					</li>
					
				</ul>
			</div>
			
			
		</div>
	</nav>
	
	<!-- END nav -->
	<!-- END menu -->