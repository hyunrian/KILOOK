<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>

body {
	font-family: "Pretendard Variable";
	background-color: #f8f9fa;
}

.intro {
	font-size: 19pt!important;
	font-weight: 400!important;
}
.carousel-inner { 
	position: relative; 
}
.carousel-item img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.carousel-caption {
	position: absolute;
	top: 32%;
	left: 46.7%;
	transform: translate(-50%, -50%);
	color: white;
	text-align: left;
}
</style>
<script>
$(function() {
	
	$("#btnSearch").click(function() {
		search();
	});
	
	$("#keyword").keydown(function(e) {
		if (e.keyCode == 13) search();
	});
	
	// 검색 기능
	function search() {
		const option = $("#option").val();
		const keyword = $("#keyword").val().trim();
		if (keyword != "") {
			location.href=
				"/userboard/list?option=" + option + "&keyword=" + keyword;
		}
	}
	
});
</script>
<%@ include file="/WEB-INF/views/include/menu.jsp" %>

<!-- Carousel(이미지 자동 슬라이딩) 적용 부분 -->
<div id="myCarousel" class="carousel slide" data-ride="carousel" style="z-index: 2;">
	<div class="carousel-container">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/resources/images/background/bg_1.jpg" alt="bg" >
			</div>
			<div class="carousel-item">
				<img src="/resources/images/background/jh_bg_2.jpg" alt="bg" >
			</div>
			<div class="carousel-item">
				<img src="/resources/images/background/jh_bg_3.jpg" alt="bg" >
			</div>
			<div class="carousel-item">
				<img src="/resources/images/background/jh_bg_4.jpg" alt="bg" >
			</div>
			<div class="carousel-item">
				<img src="/resources/images/background/jh_bg_5.jpg" alt="bg" >
			</div>
			<div class="carousel-item">
				<img src="/resources/images/background/jh_bg_6.jpg" alt="bg" >
			</div>
		</div>
	</div>

	<div class="carousel-caption">
		<div class="container">
			<div class="row no-gutters slider-text 
					js-fullheight align-items-center justify-content-start">
				<div class="col-md-12">
					<h1 class="mb-4" style="font-size: 70pt; margin-bottom: 80px!important;">
						<strong>부산,</strong><br>어디로 가볼까요?
					</h1>
					<div class="block-17 my-4">
						<form action="/userboard/list" method="get" class="d-block d-flex">
							<div class="fields d-block d-flex">
								<div class="select-wrap one-third col-md-3">
									<div class="icon">
										<span class="ion-ios-arrow-down"></span>
									</div>
									<select name="option" id="divSearch" class="form-control">
										<option value="t">제목</option>
										<option value="c">내용</option>
										<option value="tc">제목과 내용</option>
										<option value="w">글작성자</option>
									</select>
								</div>
								<div class="textfield-search one-third col-md-9">
									<input type="text" class="form-control"
										placeholder="키워드 검색" id="keyword" name="keyword">
								</div>
							</div>
							<input type="button" class="search-submit btn btn-primary" id="btnSearch">
						</form>
					</div>
					<!-- 
					<p class="intro">여행의 필수 코스</p>
					<p class="browse d-md-flex">
						<span class="d-flex justify-content-md-center align-items-md-center">
							<a href="/databoard/restaurant">
								<i class="flaticon-fork">
								</i>음식점
							</a>
						</span> 
						<span class="d-flex justify-content-md-center align-items-md-center">
							<a href="/databoard/accommodation">
								<i class="flaticon-hotel">
								</i>호텔
							</a>
						</span> 
						<span class="d-flex justify-content-md-center align-items-md-center">
							<a href="/databoard/attraction">
								<i class="flaticon-meeting-point">
								</i>카페
							</a>
						</span> 
					</p>
					<p class="intro">감각있는 문화 여행</p>
					<p class="browse d-md-flex">
						<span class="d-flex justify-content-md-center align-items-md-center">
							<a href="/databoard/attraction">
								<i class="flaticon-meeting-point">
								</i>전시
							</a>
						</span>
						<span class="d-flex justify-content-md-center align-items-md-center">
							<a href="/databoard/attraction">
								<i class="flaticon-meeting-point">
								</i>명소
							</a>
						</span> 
					</p>
					<p class="intro">여행 관련 편의시설이 궁금하다면?</p>
					<p class="browse d-md-flex">
						<span class="d-flex justify-content-md-center align-items-md-center">
							<a href="/databoard/attraction">
								<i class="flaticon-meeting-point">
								</i>주차장
							</a>
						</span> 
						<span class="d-flex justify-content-md-center align-items-md-center">
							<a href="/databoard/attraction">
								<i class="flaticon-meeting-point">
								</i>관광안내소
							</a>
						</span> 
					</p>
					<p class="intro">생생한 여행 후기도 있어요</p>
					<p class="browse d-md-flex">
						<span class="d-flex justify-content-md-center align-items-md-center">
							<a href="/databoard/attraction">
								<i class="flaticon-meeting-point">
								</i>여행 후기
							</a>
						</span> 
					</p>
					-->
				</div>
			</div>
		</div>
	</div>

	<!-- Controls 백그라운드 이미지 슬라이딩 화살표 -->
	<a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	</a>
	<a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	</a>
</div>
<!-- // Carousel -->

<!-- 유저 게시글 -->
<section class="ftco-section ftco-destination">
	<div class="container">
		<div class="row justify-content-start mb-5 pb-3">
     			<div class="col-md-7 heading-section ftco-animate">
		      	<span class="subheading">유저 PICK!</span>
		        <h2 class="mb-4"><strong>유저들이 추천하는 생생한 여행 후기</strong> Best 6</h2>
			</div>
    	</div>
   		<div class="row">
   			<div class="col-md-12">
   				<div class="destination-slider owl-carousel ftco-animate">
   					<c:forEach var="userBoardVo" items="${list}">
						<div class="item">
			 				<div class="destination">
			 					<a href="/userboard/detail?bno=${userBoardVo.bno}" class="img d-flex justify-content-center align-items-center" 
			 						style="background-image: url('/attach/displayThumbnail/${userBoardVo.bno}');">
			 						<div class="icon d-flex justify-content-center align-items-center">
			 							<span class="icon-search2"></span>
			 						</div>
			 					</a>
			 					<div class="myDivTitle">
			 						<h5><a href="/userboard/detail?bno=${userBoardVo.bno}">${userBoardVo.title}</a></h5>
			 					</div>
			 					<div class="myDivWriter">
			 						<span class="listing">${userBoardVo.writer}</span>
			 					</div>
			 				</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 음식점 -->
  <section class="ftco-section ftco-destination">
<div class="container">
	<div class="row justify-content-start mb-5 pb-3">
    			<div class="col-md-7 heading-section ftco-animate">
	      	<span class="subheading">조회수 TOP6</span>
	        <h2 class="mb-4"><strong>금강산도 식후경! 맛있게 즐기자!</strong></h2>
		</div>
   	</div>
  		<div class="row">
  			<div class="col-md-12">
  				<div class="destination-slider owl-carousel ftco-animate">
  					<c:forEach var="foodVo" items="${foodList}">
				<div class="item">
 				<div class="destination">
 					<a href="/databoard/getFoodInfo?bno=${foodVo.bno}" class="img d-flex justify-content-center align-items-center" 
 						style="background-image: url('${foodVo.image}');">
 						<div class="icon d-flex justify-content-center align-items-center">
 							<span class="icon-search2"></span>
 						</div>
 					</a>
 					<div class="myDivTitle">
 						<h5><a href="#">${foodVo.rname}</a></h5>
 					</div>
 					<div class="myDivWriter">
 						<span class="listing">${foodVo.location}</span>
 					</div>
 				</div>
				</div>
			</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 명소 -->
  <section class="ftco-section ftco-destination">
<div class="container">
	<div class="row justify-content-start mb-5 pb-3">
    			<div class="col-md-7 heading-section ftco-animate">
	      	<span class="subheading">사진 찍기 좋아요</span>
	        <h2 class="mb-4"><strong>눈에 담고 사진으로 담을 부산의 숨은 명소</strong></h2>
		</div>
   	</div>
  		<div class="row">
  			<div class="col-md-12">
  				<div class="destination-slider owl-carousel ftco-animate">
  					<c:forEach var="placeVo" items="${placeList}">
				<div class="item">
 				<div class="destination">
 					<a href="/databoard/getPlaceInfo?bno=${placeVo.bno}" class="img d-flex justify-content-center align-items-center" 
 						style="background-image: url('${placeVo.thumbimage}');">
 						<div class="icon d-flex justify-content-center align-items-center">
 							<span class="icon-search2"></span>
 						</div>
 					</a>
 					<div class="myDivTitle">
 						<h5><a href="/databoard/getPlaceInfo?bno=${placeVo.bno}">${placeVo.aname}</a></h5>
 					</div>
 					<div class="myDivWriter">
 						<span class="listing">${placeVo.address}</span>
 					</div>
 				</div>
				</div>
			</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 호텔 -->
<section class="ftco-section ftco-destination">
<div class="container">
	<div class="row justify-content-start mb-5 pb-3">
    			<div class="col-md-7 heading-section ftco-animate">
	      	<span class="subheading">관심 상승</span>
	        <h2 class="mb-4"><strong>지금 가장 인기 있는 호텔</strong></h2>
		</div>
   	</div>
  		<div class="row">
  			<div class="col-md-12">
  				<div class="destination-slider owl-carousel ftco-animate">
  					<c:forEach var="accomVo" items="${accList}">
				<div class="item">
 				<div class="destination">
 					<a href="/databoard/getAccomInfo?bno=${accomVo.bno}" class="img d-flex justify-content-center align-items-center" 
 						style="background-image: url('${accomVo.image}.jpg');">
 						<div class="icon d-flex justify-content-center align-items-center">
 							<span class="icon-search2"></span>
 						</div>
 					</a>
 					<div class="myDivTitle">
 						<h5><a href="#">${accomVo.aname}</a></h5>
 					</div>
 					<div class="myDivWriter">
 						<span class="listing">${accomVo.address}</span>
 					</div>
 				</div>
				</div>
			</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 회원가입 혜택 안내 -->
<section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(../resources/images/bg_1.jpg);">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3" 
			style="margin-bottom: 0px!important; padding-bottom: 0px!important;">
			<div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
				<h2 class="mb-4" style="font-weight: 700;">KILOOK 회원이 되어<br>더 많은 혜택을 얻으세요</h2>
				<span class="subheading">KILOOK은 부산의 다양한 스토어와 함께 합니다.</span>
			</div>
		</div>
	</div>
</section>
    
<!-- 상단으로 이동 버튼 -->
<%@ include file="/WEB-INF/views/include/pageup.jsp" %>
 
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
