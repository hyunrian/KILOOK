<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a href="/">
				<img src="/resources/images/logo/logo1.png" style="width: 120px;">
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
					<a href="/" class="nav-link">Home</a>
						<ul class="noDot" id="subMenuHome" style="display: none;">
							<li class="nav-item"><a href="/" style="color: white;">Home</a></li>
						</ul>
					</li>

					<!-- jh 수정 : tour.html → restaurant.html, Tour → Restaurant -->
					<li id="menuCategory" class="nav-item"><a
						href="/databoard/restaurant" class="nav-link">Category</a>
						<ul class="noDot" id="subMenuCategory" style="display: none;">
							<li class="nav-item-"><a href="/databoard/restaurant"
								style="color: white;">맛집</a></li>
							<li class="nav-item"><a href="/databoard/accommodation"
								style="color: white;">숙소</a></li>
							<li class="nav-item"><a href="/databoard/attraction"
								style="color: white;">가볼만한곳</a></li>
							<li class="nav-item"><a href="/databoard/show"
								style="color: white;">전시</a></li>
							<li class="nav-item"><a href="/databoard/cafe"
								style="color: white;">카페</a></li>
							<li class="nav-item"><a href="/databoard/parking"
								style="color: white;">주차장</a></li>
							<li class="nav-item"><a href="/databoard/tourguide"
								style="color: white;">관광안내소</a></li>
						</ul></li>

					<li id="menuReview" class="nav-item"><a href="/userboard/list"
						class="nav-link">Review</a>
						<ul id="subMenuReview" class="noDot" style="display: none;">
							<li class="nav-link"><a href="../resources/tour.html"
								style="color: white;">여행지 후기</a></li>
						</ul></li>
					<li class="nav-item cta"><a href="/userInfo/mypage"
						class="nav-link" style="background-color: #ffffff"> <!-- jh 추가 -->
							<img class="userImg"
							src="data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' 
			          viewBox='0 0 64 64' aria-labelledby='title' aria-describedby='desc' role='img' 
			          xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3EUser%3C/title%3E%3Cdesc%3EA 
			          line styled icon from Orion Icon Library.%3C/desc%3E%3Cpath data-name='layer1' 
			          d='M46 26c0 6.1-3.4 11.5-7 14.8V44c0 2 1 5.1 11 7a15.5 15.5 0 0 1 12 11H2a13.4 13.4
			           0 0 1 11-11c10-1.8 12-5 12-7v-3.2c-3.6-3.3-7-8.6-7-14.8v-9.6C18 6 25.4 2 32 2s14 4
			            14 14.4z' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' 
			            stroke-linejoin='round' stroke-linecap='round'%3E%3C/path%3E%3C/svg%3E"
							alt="user" width=20, height=20 />
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
	<!-- END menu -->