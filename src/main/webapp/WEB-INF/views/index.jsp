<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
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
		top: 28%;
		left: 41.5%;
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
					<img src="../resources/images/background/bg_1.jpg" alt="bg" >
				</div>
				<div class="carousel-item">
					<img src="../resources/images/background/jh_bg_2.jpg" alt="bg" >
				</div>
				<div class="carousel-item">
					<img src="../resources/images/background/jh_bg_3.jpg" alt="bg" >
				</div>
				<div class="carousel-item">
					<img src="../resources/images/background/jh_bg_4.jpg" alt="bg" >
				</div>
				<div class="carousel-item">
					<img src="../resources/images/background/jh_bg_5.jpg" alt="bg" >
				</div>
				<div class="carousel-item">
					<img src="../resources/images/background/jh_bg_6.jpg" alt="bg" >
				</div>
			</div>
		</div>

<!--  		Explore your amazing city 이하 부분  -->
		<div class="carousel-caption">
			<div class="container">
				<div
					class="row no-gutters slider-text js-fullheight align-items-center justify-content-start">
					<div class="col-md-12">
						<h1 class="mb-4">
							<strong>Explore <br></strong> your amazing city
						</h1>
						<p>Find great places to stay, eat, shop, or visit from local
							experts</p>
						<div class="block-17 my-4">
							<form action="" method="post" class="d-block d-flex">
								<div class="fields d-block d-flex">
									<div class="textfield-search one-third">
										<input type="text" class="form-control"
											placeholder="Ex: food, service, hotel">
									</div>
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
								</div>
								<input type="submit" class="search-submit btn btn-primary"
									value="Search">
							</form>
						</div>
						<p>Or browse the highlights</p>
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
		
<!--  		Controls 백그라운드 이미지 슬라이딩 화살표  -->
		<a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		</a>
	</div>
	 <!-- Carousel 끝 -->
    
    <!-- 상단3 session2 -->
     <section class="ftco-section ftco-destination">
    	<div class="container">
    		<div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
          	<span class="subheading">추천</span>
            <h2 class="mb-4"><strong>인기 관광지</strong> Best 6</h2>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-12">
    				<div class="destination-slider owl-carousel ftco-animate">
    					<div class="item">
		    				<div class="destination">
		    					<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(../resources/images/destination-1.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="#">Paris, Italy</a></h3>
		    						<span class="listing">15 Listing</span>
		    					</div>
		    				</div>
	    				</div>
	    				<div class="item">
		    				<div class="destination">
		    					<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(../resources/images/destination-2.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="#">San Francisco, USA</a></h3>
		    						<span class="listing">20 Listing</span>
		    					</div>
		    				</div>
	    				</div>
	    				<div class="item">
		    				<div class="destination">
		    					<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(../resources/images/destination-3.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="#">Lodon, UK</a></h3>
		    						<span class="listing">10 Listing</span>
		    					</div>
		    				</div>
	    				</div>
	    				<div class="item">
		    				<div class="destination">
		    					<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(../resources/images/destination-4.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="#">Lion, Singapore</a></h3>
		    						<span class="listing">3 Listing</span>
		    					</div>
		    				</div>
	    				</div>
	    				<div class="item">
		    				<div class="destination">
		    					<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(../resources/images/destination-5.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="#">Australia</a></h3>
		    						<span class="listing">3 Listing</span>
		    					</div>
		    				</div>
	    				</div>
	    				<div class="item">
		    				<div class="destination">
		    					<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(../resources/images/destination-6.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="#">Paris, Italy</a></h3>
		    						<span class="listing">3 Listing</span>
		    					</div>
		    				</div>
	    				</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>
    <!-- 상단3 END section2 -->
    
    <!-- 상단4 section3 -->
	<section class="ftco-section bg-light">
    	<div class="container">
				<div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
          	<span class="subheading">추천</span>
            <h2 class="mb-4"><strong>인기 숙소</strong> Best 5</h2>
          </div>
        </div>    		
    	</div>
    	<div class="container-fluid">
    		<div class="row">
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../resources/images/destination-1.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<div class="d-flex">
    							<div class="one">
		    						<h3><a href="#">Paris, Italy</a></h3>
		    						<p class="rate">
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star-o"></i>
		    							<span>8 Rating</span>
		    						</p>
	    						</div>
	    						<div class="two">
	    							<span class="price">$200</span>
    							</div>
    						</div>
    						<p>Far far away, behind the word mountains, far from the countries</p>
    						<p class="days"><span>2 days 3 nights</span></p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> San Franciso, CA</span> 
    							<span class="ml-auto"><a href="#">Discover</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../resources/images/destination-2.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<div class="d-flex">
    							<div class="one">
		    						<h3><a href="#">Paris, Italy</a></h3>
		    						<p class="rate">
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star-o"></i>
		    							<span>8 Rating</span>
		    						</p>
	    						</div>
	    						<div class="two">
	    							<span class="price">$200</span>
    							</div>
    						</div>
    						<p>Far far away, behind the word mountains, far from the countries</p>
    						<p class="days"><span>2 days 3 nights</span></p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> San Franciso, CA</span> 
    							<span class="ml-auto"><a href="#">Discover</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../resources/images/destination-3.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<div class="d-flex">
    							<div class="one">
		    						<h3><a href="#">Paris, Italy</a></h3>
		    						<p class="rate">
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star-o"></i>
		    							<span>8 Rating</span>
		    						</p>
	    						</div>
	    						<div class="two">
	    							<span class="price">$200</span>
    							</div>
    						</div>
    						<p>Far far away, behind the word mountains, far from the countries</p>
    						<p class="days"><span>2 days 3 nights</span></p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> San Franciso, CA</span> 
    							<span class="ml-auto"><a href="#">Discover</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../resources/images/destination-4.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<div class="d-flex">
    							<div class="one">
		    						<h3><a href="#">Paris, Italy</a></h3>
		    						<p class="rate">
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star-o"></i>
		    							<span>8 Rating</span>
		    						</p>
	    						</div>
	    						<div class="two">
	    							<span class="price">$200</span>
    							</div>
    						</div>
    						<p>Far far away, behind the word mountains, far from the countries</p>
    						<p class="days"><span>2 days 3 nights</span></p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> San Franciso, CA</span> 
    							<span class="ml-auto"><a href="#">Discover</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../resources/images/destination-5.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<div class="d-flex">
    							<div class="one">
		    						<h3><a href="#">Paris, Italy</a></h3>
		    						<p class="rate">
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star-o"></i>
		    							<span>8 Rating</span>
		    						</p>
	    						</div>
	    						<div class="two">
	    							<span class="price">$200</span>
    							</div>
    						</div>
    						<p>Far far away, behind the word mountains, far from the countries</p>
    						<p class="days"><span>2 days 3 nights</span></p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> San Franciso, CA</span> 
    							<span class="ml-auto"><a href="#">Discover</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>    
    <!-- 상단4 END section3 -->
    
    <!-- 상단5 section4(제거)-->
<!--     <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(../resources/images/bg_1.jpg);"> -->
<!--     	<div class="container"> -->
<!--     		<div class="row justify-content-center mb-5 pb-3"> -->
<!--           <div class="col-md-7 text-center heading-section heading-section-white ftco-animate"> -->
<!--             <h2 class="mb-4">Some fun facts</h2> -->
<!--             <span class="subheading">More than 100,000 websites hosted</span> -->
<!--           </div> -->
<!--         </div> -->
<!--     		<div class="row justify-content-center"> -->
<!--     			<div class="col-md-10"> -->
<!-- 		    		<div class="row"> -->
<!-- 		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate"> -->
<!-- 		            <div class="block-18 text-center"> -->
<!-- 		              <div class="text"> -->
<!-- 		                <strong class="number" data-number="100000">0</strong> -->
<!-- 		                <span>Happy Customers</span> -->
<!-- 		              </div> -->
<!-- 		            </div> -->
<!-- 		          </div> -->
<!-- 		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate"> -->
<!-- 		            <div class="block-18 text-center"> -->
<!-- 		              <div class="text"> -->
<!-- 		                <strong class="number" data-number="40000">0</strong> -->
<!-- 		                <span>Destination Places</span> -->
<!-- 		              </div> -->
<!-- 		            </div> -->
<!-- 		          </div> -->
<!-- 		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate"> -->
<!-- 		            <div class="block-18 text-center"> -->
<!-- 		              <div class="text"> -->
<!-- 		                <strong class="number" data-number="87000">0</strong> -->
<!-- 		                <span>Hotels</span> -->
<!-- 		              </div> -->
<!-- 		            </div> -->
<!-- 		          </div> -->
<!-- 		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate"> -->
<!-- 		            <div class="block-18 text-center"> -->
<!-- 		              <div class="text"> -->
<!-- 		                <strong class="number" data-number="56400">0</strong> -->
<!-- 		                <span>Restaurant</span> -->
<!-- 		              </div> -->
<!-- 		            </div> -->
<!-- 		          </div> -->
<!-- 		        </div> -->
<!-- 	        </div> -->
<!--         </div> -->
<!--     	</div> -->
<!--     </section> -->
    <!-- 상단5 END section4 -->
    
    <!-- 상단6 section5 -->
    <section class="ftco-section">
    	<div class="container">
				<div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
          	<!-- jh 수정 : Special Offers → 추천 -->
          	<span class="subheading">추천</span>
          	<!-- jh 수정 : Popular → 인기 맛집, Restaurants → Best 4 -->
            <h2 class="mb-4"><strong>인기 맛집</strong> Best 4</h2>
          </div>
        </div>    		
    		<div class="row">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../resources/images/restaurant-1.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<h3><a href="#">Luxury Restaurant</a></h3>
    						<p class="rate">
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star-o"></i>
    							<span>8 Rating</span>
    						</p>
    						<p>Far far away, behind the word mountains, far from the countries</p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> San Franciso, CA</span> 
    							<span class="ml-auto"><a href="#">Discover</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../resources/images/restaurant-2.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<h3><a href="#">Luxury Restaurant</a></h3>
    						<p class="rate">
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star-o"></i>
    							<span>8 Rating</span>
    						</p>
    						<p>Far far away, behind the word mountains, far from the countries</p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> San Franciso, CA</span> 
    							<span class="ml-auto"><a href="#">Book Now</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../resources/images/restaurant-3.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<h3><a href="#">Luxury Restaurant</a></h3>
    						<p class="rate">
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star-o"></i>
    							<span>8 Rating</span>
    						</p>
    						<p>Far far away, behind the word mountains, far from the countries</p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> San Franciso, CA</span> 
    							<span class="ml-auto"><a href="#">Book Now</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../resources/images/restaurant-4.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<h3><a href="#">Luxury Restaurant</a></h3>
    						<p class="rate">
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star"></i>
    							<i class="icon-star-o"></i>
    							<span>8 Rating</span>
    						</p>
    						<p>Far far away, behind the word mountains, far from the countries</p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> San Franciso, CA</span> 
    							<span class="ml-auto"><a href="#">Book Now</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>
    <!-- END 상단6 section5 -->
    
    <!-- 상단7 section6 -->
    <section class="ftco-section testimony-section bg-light">
      <div class="container">
        <div class="row justify-content-start">
          <div class="col-md-6 heading-section ftco-animate">
          	<span class="subheading">추천</span>
            <h2 class="mb-4 pb-3"><strong>여행 후기</strong></h2>
          	<div class="row ftco-animate">
		          <div class="col-md-12">
		            <div class="carousel-testimony owl-carousel">
		              <div class="item">
		                <div class="testimony-wrap d-flex">
		                  <div class="user-img mb-5" style="background-image: url(../resources/images/person_1.jpg)">
		                    <span class="quote d-flex align-items-center justify-content-center">
		                      <i class="icon-quote-left"></i>
		                    </span>
		                  </div>
		                  <div class="text ml-md-4">
		                    <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                    <p class="name">Dennis Green</p>
		                    <span class="position">Guest from italy</span>
		                  </div>
		                </div>
		              </div>
		              <div class="item">
		                <div class="testimony-wrap d-flex">
		                  <div class="user-img mb-5" style="background-image: url(../resources/images/person_2.jpg)">
		                    <span class="quote d-flex align-items-center justify-content-center">
		                      <i class="icon-quote-left"></i>
		                    </span>
		                  </div>
		                  <div class="text ml-md-4">
		                    <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                    <p class="name">Dennis Green</p>
		                    <span class="position">Guest from London</span>
		                  </div>
		                </div>
		              </div>
		              <div class="item">
		                <div class="testimony-wrap d-flex">
		                  <div class="user-img mb-5" style="background-image: url(../resources/images/person_3.jpg)">
		                    <span class="quote d-flex align-items-center justify-content-center">
		                      <i class="icon-quote-left"></i>
		                    </span>
		                  </div>
		                  <div class="text ml-md-4">
		                    <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                    <p class="name">Dennis Green</p>
		                    <span class="position">Guest from Philippines</span>
		                  </div>
		                </div>
		              </div>
		            </div>
		          </div>
		          <p><a href="#" class="btn btn-primary btn-outline-primary mt-4 px-4 py-3">Read more</a></p>
		        </div>
          </div>
        </div>
      </div>
    </section>
    <!-- END 상단7 section6 -->
    
    
    <!-- 상단9 section8 -->
<!--     <section class="ftco-section bg-light"> -->
<!--       <div class="container"> -->
<!--         <div class="row justify-content-start mb-5 pb-3"> -->
<!--           <div class="col-md-7 heading-section ftco-animate"> -->
<!--             <span class="subheading">Recent Blog</span> -->
<!--             <h2><strong>Tips</strong> &amp; Articles</h2> -->
<!--           </div> -->
<!--         </div> -->
<!--         <div class="row d-flex"> -->
<!--           <div class="col-md-3 d-flex ftco-animate"> -->
<!--             <div class="blog-entry align-self-stretch"> -->
<!--               <a href="blog-single.html" class="block-20" style="background-image: url('../resources/images/image_1.jpg');"> -->
<!--               </a> -->
<!--               <div class="text p-4 d-block"> -->
<!--               	<span class="tag">Tips, Travel</span> -->
<!--                 <h3 class="heading mt-3"><a href="#">8 Best homestay in Philippines that you don't miss out</a></h3> -->
<!--                 <div class="meta mb-3"> -->
<!--                   <div><a href="#">August 12, 2018</a></div> -->
<!--                   <div><a href="#">Admin</a></div> -->
<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="col-md-3 d-flex ftco-animate"> -->
<!--             <div class="blog-entry align-self-stretch"> -->
<!--               <a href="blog-single.html" class="block-20" style="background-image: url('../resources/images/image_2.jpg');"> -->
<!--               </a> -->
<!--               <div class="text p-4"> -->
<!--               	<span class="tag">Culture</span> -->
<!--                 <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3> -->
<!--                 <div class="meta mb-3"> -->
<!--                   <div><a href="#">August 12, 2018</a></div> -->
<!--                   <div><a href="#">Admin</a></div> -->
<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="col-md-3 d-flex ftco-animate"> -->
<!--             <div class="blog-entry align-self-stretch"> -->
<!--               <a href="blog-single.html" class="block-20" style="background-image: url('../resources/images/image_3.jpg');"> -->
<!--               </a> -->
<!--               <div class="text p-4"> -->
<!--               	<span class="tag">Tips, Travel</span> -->
<!--                 <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3> -->
<!--                 <div class="meta mb-3"> -->
<!--                   <div><a href="#">August 12, 2018</a></div> -->
<!--                   <div><a href="#">Admin</a></div> -->
<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="col-md-3 d-flex ftco-animate"> -->
<!--             <div class="blog-entry align-self-stretch"> -->
<!--               <a href="blog-single.html" class="block-20" style="background-image: url('../resources/images/image_4.jpg');"> -->
<!--               </a> -->
<!--               <div class="text p-4"> -->
<!--               	<span class="tag">Tips, Travel</span> -->
<!--                 <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3> -->
<!--                 <div class="meta mb-3"> -->
<!--                   <div><a href="#">August 12, 2018</a></div> -->
<!--                   <div><a href="#">Admin</a></div> -->
<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </section> -->
    <!-- END 상단9 section8 -->
    
    
   <!-- 하단 footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp" %>
   <!-- 하단 END footer -->
    
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
  </body>
</html>
