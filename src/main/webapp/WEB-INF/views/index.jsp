<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>

body {
	font-family: "Pretendard-Black", sans-serif;
	background-color: #f8f9fa;
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
						<h1 class="mb-4">
							<strong>부산,</strong><br>어디로 가볼까요?
						</h1>
						<div class="block-17 my-4">
							<form action="" method="post" class="d-block d-flex">
								<div class="fields d-block d-flex">
									<div class="select-wrap one-third">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="" id="" class="form-control"
											placeholder="Keyword search">
											<option value="">Where</option>
											<option value="">San Francisco USA</option>
											<option value="">Berlin Germany</option>
											<option value="">Lodon United Kingdom</option>
											<option value="">Paris Italy</option>
										</select>
									</div>
									<div class="textfield-search one-third">
										<input type="text" class="form-control"
											placeholder="Ex: food, service, hotel">
									</div>
								</div>
								<input type="button" class="search-submit btn btn-primary">
							</form>
						</div>
						<p style="font-size: 12pt;">원하는 카테고리를 선택해서 볼 수도 있어요.</p>
						<p class="browse d-md-flex">
							<span class="d-flex justify-content-md-center align-items-md-center">
								<a href="/databoard/restaurant">
									<i class="flaticon-fork">
									</i>Restaurant
								</a>
							</span> 
							<span class="d-flex justify-content-md-center align-items-md-center">
								<a href="/databoard/accommodation">
									<i class="flaticon-hotel">
									</i>Hotel
								</a>
							</span> 
							<span class="d-flex justify-content-md-center align-items-md-center">
								<a href="/databoard/attraction">
									<i class="flaticon-meeting-point">
									</i>Places
								</a>
							</span> 
						</p>
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
			    					<a href="#" class="img d-flex justify-content-center align-items-center" 
			    						style="background-image: url('/attach/displayThumbnail/${userBoardVo.bno}');">
			    						<div class="icon d-flex justify-content-center align-items-center">
			    							<span class="icon-search2"></span>
			    						</div>
			    					</a>
			    					<div class="myDivTitle">
			    						<h5><a href="#">${userBoardVo.title}</a></h5>
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
    					<c:forEach var="userBoardVo" items="${list}">
	    					<div class="item">
			    				<div class="destination">
			    					<a href="#" class="img d-flex justify-content-center align-items-center" 
			    						style="background-image: url('/attach/displayThumbnail/${userBoardVo.bno}');">
			    						<div class="icon d-flex justify-content-center align-items-center">
			    							<span class="icon-search2"></span>
			    						</div>
			    					</a>
			    					<div class="myDivTitle">
			    						<h5><a href="#">${userBoardVo.title}</a></h5>
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
    					<c:forEach var="userBoardVo" items="${list}">
	    					<div class="item">
			    				<div class="destination">
			    					<a href="#" class="img d-flex justify-content-center align-items-center" 
			    						style="background-image: url('/attach/displayThumbnail/${userBoardVo.bno}');">
			    						<div class="icon d-flex justify-content-center align-items-center">
			    							<span class="icon-search2"></span>
			    						</div>
			    					</a>
			    					<div class="myDivTitle">
			    						<h5><a href="#">${userBoardVo.title}</a></h5>
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
    					<c:forEach var="userBoardVo" items="${list}">
	    					<div class="item">
			    				<div class="destination">
			    					<a href="#" class="img d-flex justify-content-center align-items-center" 
			    						style="background-image: url('/attach/displayThumbnail/${userBoardVo.bno}');">
			    						<div class="icon d-flex justify-content-center align-items-center">
			    							<span class="icon-search2"></span>
			    						</div>
			    					</a>
			    					<div class="myDivTitle">
			    						<h5><a href="#">${userBoardVo.title}</a></h5>
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
    
    <!-- 회원가입 혜택 안내 -->
    <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(../resources/images/bg_1.jpg);">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
            <h2 class="mb-4">Some fun facts</h2>
            <span class="subheading">More than 100,000 websites hosted</span>
          </div>
        </div>
    		<div class="row justify-content-center">
    			<div class="col-md-10">
		    		<div class="row">
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="100000">0</strong>
		                <span>Happy Customers</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="40000">0</strong>
		                <span>Destination Places</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="87000">0</strong>
		                <span>Hotels</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="56400">0</strong>
		                <span>Restaurant</span>
		              </div>
		            </div>
		          </div>
		        </div>
	        </div>
        </div>
    	</div>
    </section>
    
	<!-- 상단으로 이동 버튼 -->
	<%@ include file="/WEB-INF/views/include/pageup.jsp" %>
	  
	<!-- loader -->
<!-- 	<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div> -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
