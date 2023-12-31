<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

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

.row d-flex{
  padding: 10px;
  border-bottom: 1px solid #fff;
}

.textBold {
  font-weight: bold;  
}
</style>

<!-- menu -->
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
<!-- END menu -->

<!-- 메뉴와 데이터 간 margin값을 주기 위한 div -->
<div style="margin-bottom: 50px;"></div>

<section>
	<div class="container">
		<c:forEach items="${tourguideList}" var="tourguideVo">
			<div class="row d-flex" style="border-bottom:  1px solid #BDBDBD;">
				<div class="text p-4 d-block">
					<h4>
						<b>${tourguideVo.iname}</b><br>
					</h4>
					<div class="meta mb-3">
						<div class="innerDiv">
							<span class="textBold">관광소&nbsp;&nbsp;</span>${tourguideVo.iname}
						</div>
						<div class="innerDiv">
							<span class="textBold">주소&nbsp;&nbsp;</span>${tourguideVo.address}
						</div>
						<div class="innerDiv">
							<span class="textBold">오픈시간&nbsp;&nbsp;</span>${tourguideVo.openhours} 
						</div>
						<div class="innerDiv">
							<span class="textBold">연락처&nbsp;&nbsp;</span>${tourguideVo.inumber}
						</div>
						<div class="innerDivLast">
							<span class="textBold">언어&nbsp;&nbsp; </span>${tourguideVo.language}
						</div>
						<div class="innerDivLast">
							<span class="textBold">소개&nbsp;&nbsp; </span>${tourguideVo.language}
						</div>
					</div>
				</div>
				<br>
				<hr>
			</div>
		</c:forEach>

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
<%@ include file="/WEB-INF/views/include/footer.jsp"%>