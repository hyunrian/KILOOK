<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
/* body 전체 폰트 설정 */
body {
	background-color: #FAFCFF;
	font-family: "Pretendard Variable"; 
}
</style>

	<!-- menu -->
	<%@ include file="/WEB-INF/views/include/menu.jsp" %>
	<!-- END menu -->

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row d-flex">
				<c:forEach items="${cafeList}" var="cafeVo">
					<div class="col-md-3 d-flex ftco-animate">
						<div class="blog-entry align-self-stretch">
							<a href="#" class="block-20"
								style="background-image: url('..${cafeVo.image}.jpg');"> </a>
							<div class="text p-4 d-block">
								<h3 class="heading mt-3">
									<a href="#">${cafeVo.cname}</a><br>
								</h3>
								<span class="tag">${cafeVo.address}</span>
								<div class="meta mb-3">
									<div>
										<a href="#">Tel. ${cafeVo.cnumber}</a>
									</div>
								</div>
							</div>
						</div>
						<hr>
					</div>
				</c:forEach>
			</div>

<!-- 			<div class="row mt-5"> -->
<!-- 				<div class="col text-center"> -->
<!-- 					<div class="block-27"> -->
<!-- 						<ul> -->
<!-- 							<li><a href="#">&lt;</a></li> -->
<!-- 							<li class="active"><span>1</span></li> -->
<!-- 							<li><a href="#">2</a></li> -->
<!-- 							<li><a href="#">3</a></li> -->
<!-- 							<li><a href="#">4</a></li> -->
<!-- 							<li><a href="#">5</a></li> -->
<!-- 							<li><a href="#">&gt;</a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
	</section>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
	
	<%@ include file="/WEB-INF/views/include/pageup.jsp"%>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
