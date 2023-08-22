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
.block-20{
	width: 255px;
}
.page-link {
    background-color: transparent;
    padding: 0rem 0.75rem;
}
.page-item.active .page-link {
    background-color: #fdd3d3;
    border: 1px solid transparent;
}
.page-item:last-child .page-link {
    border-top-right-radius: 0rem;
    border-bottom-right-radius: 0rem;
    border-radius: 50%;
}
#selectBox{
	 width: 19%; /* 가로 사이즈 */
    padding: 10px; /* 내부여백 */
    padding-left: 12px;
    border: 1px solid #ddd;
    background: url(../resources/images/selectBox/selectBox.png) no-repeat right 50%; /* 화살표 위치 */
    background-size: 30px; /* 화살표 크기 */
    border-radius: 4px;
    box-sizing: border-box;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    font-size: 12px;
    color: #000;
    outline:none;
    margin-bottom: 15px;
    margin-left: 900px;
}
#selectbox > option{
	opacity: 0.5;
}

</style>
<script>
	$(function(){
        
		// 페이징
		$(".page-link").click(function(e){
			e.preventDefault(); 
			var page = $(this).attr("href"); 
			$("input[name=page]").val(page);
			var form = $("#frmPaging");
			form.submit(); 													
		});
	});
</script>
<!-- menu -->
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
<!-- END menu -->

<form id="frmPaging" action="/databoard/show" method="get">
	<input type="hidden" name="bno" value="${param.bno}">
	<input type="hidden" name="page" value="${pagingDto.page}">
	<input type="hidden" name="perPage" value="${pagingDto.perPage}">
</form>

<!-- 메뉴와 데이터 간 margin값을 주기 위한 div -->
<div style="margin-bottom: 50px;"></div>
	
<section>
	<div class="container">
		<c:forEach items="${showList}" var="showVo">
			<div class="row d-flex" style="border-bottom:  1px solid #BDBDBD;">
				<div class="text p-4 d-block">
					<h4>
						<b>${showVo.showname}</b><br>
					</h4>
					<div class="meta mb-3">
						<div class="innerDiv">
							<span class="textBold">전시장소&nbsp;&nbsp;</span>${showVo.placename}
						</div>
						<div class="innerDiv">
							<span class="textBold">전시기간&nbsp;&nbsp;</span>${showVo.begindate} ~ ${showVo.enddate}
						</div>
						<div class="innerDiv">
							<span class="textBold">오픈시간&nbsp;&nbsp;</span>${showVo.openhours}
						</div>
						<div class="innerDiv">
							<span class="textBold">가격&nbsp;&nbsp;</span>${showVo.price}
						</div>
						<div class="innerDivLast">
							<span class="textBold">홈페이지&nbsp;&nbsp; </span><a href="${showVo.url}" style="color: #5587ED">${showVo.url}</a>
						</div>
					</div>
				</div>
				<br>
				<hr>
			</div>
		</c:forEach>
		
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