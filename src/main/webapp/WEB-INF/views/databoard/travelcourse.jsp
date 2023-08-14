<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>

<script>
	$(document).on("click", "#btnPlus", function() {
		var mapDiv = $(".map").first().clone();
		mapDiv.clone().appendTo('#copyPlace');
	})
	$(document).on("click", "#btnMinus", function() {
// 		var mapDiv = $(".map").first().clone();
		mapDiv.clone().find('#copyPlace').remove();
	})

</script>

<div class="hero-wrap js-fullheight"
	style="background-image: url('../resources/images/bg_4.jpg');">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
			data-scrollax-parent="true">
			<div class="col-md-9 ftco-animate text-center"
				data-scrollax=" properties: { translateY: '70%' }">
				<p class="breadcrumbs"
					data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
					<span class="mr-2"><a href="index.html">Home</a></span> <span
						class="mr-2"><a href="blog.html">Blog</a></span> <span>Blog
						Single</span>
				</p>
				<h1 class="mb-3 bread"
					data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Tips
					&amp; Articles</h1>
			</div>
		</div>
	</div>
</div>


<section class="ftco-section ftco-degree-bg">
	<div class="container">
		<div class="row">
			<div class="col-md-8 ftco-animate">
				<h2 class="mb-3">나만의 여행 코스</h2>
				<hr>
				<p></p>
				<div class="map" style="padding-bottom: 10px;">
					<img alt="" src="../resources/images/travelcourse/map.png"
						style="width: 30px; height: 30px; border: none;" /> <input
						type="text" />
					<button type="button" id="btnPlus"
						style="background-color: transparent; border: none;">
						<img alt="" src="../resources/images/travelcourse/plus.png"
							style="width: 20px; height: 20px; border: none;" />
					</button>
					<button type="button" id="btnMinus"
						style="background-color: transparent; border: none;">
						<img alt="" src="../resources/images/travelcourse/sub.png"
						style="width: 20px; height: 20px; border: none;" />
					</button>
					
					
				</div>
				<div id="copyPlace"></div>
				<!--   <p>
              <img src="images/image_7.jpg" alt="" class="img-fluid">
            </p>
            
            <p>
              <img src="images/image_8.jpg" alt="" class="img-fluid">
            </p> -->
				<div class="tag-widget post-tag-container mb-5 mt-5">
					<div class="tagcloud">
						<a href="#" class="tag-cloud-link">Life</a> <a href="#"
							class="tag-cloud-link">Sport</a> <a href="#"
							class="tag-cloud-link">Tech</a> <a href="#"
							class="tag-cloud-link">Travel</a>
					</div>
				</div>

				<!--             <div class="about-author d-flex p-5 bg-light"> -->
				<!--               <div class="bio align-self-md-center mr-5"> -->
				<!--                 <img src="images/person_1.jpg" alt="Image placeholder" class="img-fluid mb-4"> -->
				<!--               </div> -->
				<!--               <div class="desc align-self-md-center"> -->
				<!--                 <h3>Lance Smith</h3> -->
				<!--                 <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p> -->
				<!--               </div> -->
				<!--             </div> -->



			</div>
			<!-- .col-md-8 -->
			<div class="col-md-4 sidebar ftco-animate">
				<div class="sidebar-box">
					<!--               <form action="#" class="search-form"> -->
					<!--                 <div class="form-group"> -->
					<!--                   <span class="icon fa fa-search"></span> -->
					<!--                   <input type="text" class="form-control" placeholder="Type a keyword and hit enter"> -->
					<!--                 </div> -->
					<!--               </form> -->
				</div>
				<div class="sidebar-box ftco-animate">
					<div class="categories">
						<h3>Categories</h3>
						<li><button type="button" class="btn btn-outline-success">나만의
								코스 짜기</button></li>
						<li><a href="#">나만의 코스 목록 <span>(0)</span></a></li>
					</div>
				</div>

				<div class="sidebar-box ftco-animate">
					<h3>Recent Blog</h3>
					<div class="block-21 mb-4 d-flex">
						<a class="blog-img mr-4"
							style="background-image: url(../resources/images/image_1.jpg);"></a>
						<div class="text">
							<h3 class="heading">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
							<div class="meta">
								<div>
									<a href="#"><span class="icon-calendar"></span> July 12,
										2018</a>
								</div>
								<div>
									<a href="#"><span class="icon-person"></span> Admin</a>
								</div>
								<div>
									<a href="#"><span class="icon-chat"></span> 19</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="sidebar-box ftco-animate">
					<h3>Tag Cloud</h3>
					<div class="tagcloud">
						<a href="#" class="tag-cloud-link">dish</a> <a href="#"
							class="tag-cloud-link">menu</a> <a href="#"
							class="tag-cloud-link">food</a> <a href="#"
							class="tag-cloud-link">sweet</a> <a href="#"
							class="tag-cloud-link">tasty</a> <a href="#"
							class="tag-cloud-link">delicious</a> <a href="#"
							class="tag-cloud-link">desserts</a> <a href="#"
							class="tag-cloud-link">drinks</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</section>
<!-- .section -->
<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke="#eeeeee" />
		<circle class="path" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
