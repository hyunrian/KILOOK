<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Busan Tour</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">
    
    <!-- jh 추가 : 메인 이미지 슬라이드 관련.. link ~ script까지 -->
<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script> -->
<!-- 	<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> -->
    
    <link rel="stylesheet" href="../resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/animate.css">
    
    <link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../resources/css/magnific-popup.css">

    <link rel="stylesheet" href="../resources/css/aos.css">

    <link rel="stylesheet" href="../resources/css/ionicons.min.css">

    <link rel="stylesheet" href="../resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../resources/css/flaticon.css">
    <link rel="stylesheet" href="../resources/css/icomoon.css">
    <link rel="stylesheet" href="../resources/css/style.css">
  </head>
  
<body>
	<!-- menu -->
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container" style="z-index: 1;">
	      <a class="navbar-brand" href="../resources/index.html">dirEngine.</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
	
	      
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="../resources/index.html" class="nav-link">Home</a></li>
<!-- 				jh 추가했다가 다시 주석 처리 -->
<!-- 	          <li class="nav-item"><a href="../resources/login.html" class="nav-link">Login</a></li> -->
	          <li class="nav-item"><a href="../resources/about.html" class="nav-link">About</a></li>
	          <!-- jh 수정 : tour.html → restaurant.html, Tour → Restaurant -->
	          <li class="nav-item"><a href="/databoard/restaurant" class="nav-link">Restaurant</a></li>
	          <li class="nav-item"><a href="../resources/hotel.html" class="nav-link">Hotels</a></li>
			  <!-- jh 수정 : blog.html → tour.html, Blog → Tour -->
<!-- 	          <ul class="topmenu"> -->
		          <li class="nav-item">
		          	<a href="../resources/tour.html" class="nav-link">Tour</a>
<!-- 		          	<ul class="submenu"> -->
<!-- 		          		<li> -->
<!-- 		          			<a href="#">submenu01</a> -->
<!-- 		          			<a href="#">submenu02</a> -->
<!-- 		          			<a href="#">submenu03</a> -->
<!-- 		          		</li> -->
<!-- 		          	</ul> -->
		          </li>
<!-- 		      </ul> -->
	          <li class="nav-item"><a href="../resources/contact.html" class="nav-link">Contact</a></li>
	          <!-- jh 수정 : href="../resources/contact.html" → href="../resources/login.html", img 태그 추가, span 태그 삭제 -->
	          <li class="nav-item cta">
		          <a href="../resources/login.html" class="nav-link">
		          	<!-- jh 추가 -->
		          	<img class="userImg" src="data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' 
			          viewBox='0 0 64 64' aria-labelledby='title' aria-describedby='desc' role='img' 
			          xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3EUser%3C/title%3E%3Cdesc%3EA 
			          line styled icon from Orion Icon Library.%3C/desc%3E%3Cpath data-name='layer1' 
			          d='M46 26c0 6.1-3.4 11.5-7 14.8V44c0 2 1 5.1 11 7a15.5 15.5 0 0 1 12 11H2a13.4 13.4
			           0 0 1 11-11c10-1.8 12-5 12-7v-3.2c-3.6-3.3-7-8.6-7-14.8v-9.6C18 6 25.4 2 32 2s14 4
			            14 14.4z' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' 
			            stroke-linejoin='round' stroke-linecap='round'%3E%3C/path%3E%3C/svg%3E" alt="user" 
			            width = 20, height = 20/>
		          </a>
	          </li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	  <!-- END nav -->
	  <!-- END menu -->
</body>