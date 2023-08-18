<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a href="/">
				<!-- 기본 로고 -->
				<img src="/resources/images/logo/logo1.png" style="width: 120px;" class="mainLogo">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span>
				Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto" class="mainmenu">
					<li id="menuHome" class="nav-item" style="margin-right: 20px;">
						<a href="/" class="nav-link">Home</a>
					</li>
					<li id="menuCategory" class="nav-item" style="margin-right: 20px;">
						<a href="/databoard/restaurant" class="nav-link">Place</a>
						<!-- 서브메뉴 추가 -->
						<div style="postion: relative;">
							<span style="position: fixed; z-index: 3; font-size: 30pt; left: 68.4%; top: 18.1%;
									transform: translate(-70%, -50%); display: none;"  id="subMenuSpan">
								<ul class="noDot" id="subMenuCategory">
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
						<a href="/userboard/list" class="nav-link" style="margin-right: 30px;">Review</a>
					</li>
					
					<!-- 사용자(유저) 페이지 링크 -->
					<li class="nav-item cta">
						<a href="/userInfo/mypage" class="nav-link" style="background-color: #ffffff">
							<i class="fa-solid fa-user fa-xl user-link" style="color: #474747;"></i>
						</a>
					</li>
				</ul>
			</div>
			
			
		</div>
	</nav>
	
	<!-- END nav -->
	<!-- END menu -->