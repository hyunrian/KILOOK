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
	// 필터
	$("#selectBox").change(function() {
// 		alert("change loc")
        const selectBoxValue = $(this).val();
        console.log("selectBoxValue:", selectBoxValue); // test ok
        
        let bno = "${param.bno}"
        let page = "${pagingDto.page}"
        let perPage = "${pagingDto.perPage}"
        
		location.href = `/databoard/restaurant?location=\${selectBoxValue}&bno=\${page}&perPage=\${perPage}`;
    });
	
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
<%@ include file="/WEB-INF/views/include/menu.jsp" %>
<!-- END menu -->

<form id="frmPaging" action="/databoard/restaurant" method="get">
	<input type="hidden" name="bno" value="${param.bno}">
	<input type="hidden" name="page" value="${pagingDto.page}">
	<input type="hidden" name="perPage" value="${pagingDto.perPage}">
	<input type="hidden" name="location" value="${location}">
</form>

<section class="ftco-section bg-light" >
	<!-- 필터 -->
	<div class="container">
		<div>
			<select id="selectBox">
				<option value="전체보기" ${location == '전체보기' ? 'selected="selected"' : '' }>전체보기</option>
				<option value="강서구" ${location == '강서구' ? 'selected="selected"' : '' }>강서구</option>
				<option value="금정구" ${location == '금정구' ? 'selected="selected"' : '' }>금정구</option>
				<option value="기장군" ${location == '기장군' ? 'selected="selected"' : '' }>기장군</option>
				<option value="남구" ${location == '남구' ? 'selected="selected"' : '' }>남구</option>
				<option value="동구" ${location == '동구' ? 'selected="selected"' : '' }>동구</option>
				<option value="동래구" ${location == '동래구' ? 'selected="selected"' : '' }>동래구</option>
				<option value="부산진구" ${location == '부산진구' ? 'selected="selected"' : '' }>부산진구</option>
				<option value="북구" ${location == '북구' ? 'selected="selected"' : '' }>북구</option>
				<option value="사상구" ${location == '사상구' ? 'selected="selected"' : '' }>사상구</option>
				<option value="사하구" ${location == '사하구' ? 'selected="selected"' : '' }>사하구</option>
				<option value="서구" ${location == '서구' ? 'selected="selected"' : '' }>서구</option>
				<option value="수영구" ${location == '수영구' ? 'selected="selected"' : '' }>수영구</option>
				<option value="연제구" ${location == '연제구' ? 'selected="selected"' : '' }>연제구</option>
				<option value="영도구" ${location == '영도구' ? 'selected="selected"' : '' }>영도구</option>
				<option value="중구" ${location == '중구' ? 'selected="selected"' : '' }>중구</option>
				<option value="해운대구" ${location == '해운대구' ? 'selected="selected"' : '' }>해운대구</option>
			</select>
		</div>
	</div>
	<!-- END 필터 -->
	
	<div class="container">
		<!-- 게시글 리스트 -->
		<div class="row d-flex" id="foodListContainer">
			<c:forEach items="${foodList}" var="foodVo">
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="/databoard/getFoodInfo?bno=${foodVo.bno}" class="block-20"
							style="background-image: url('${foodVo.thumbimage}');"></a>
						<div class="text p-4 d-block">
							<h3 class="heading mt-3">
								<a href="/databoard/getFoodInfo?bno=${foodVo.bno}">${foodVo.rname}</a><br>
								<span class="icon-chat">${foodVo.replycnt}</span>
							</h3>
							<span class="tag">${foodVo.address}</span>
							<div class="meta mb-3">
								<div>
									<a href="#">Tel. ${foodVo.rnumber}</a>
								</div>
								<div>
									<a href="#">Open. ${foodVo.openhours}</a>
								</div>
								<div>
									<a href="#">${foodVo.menu}</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- END 게시글 리스트 -->
		
		<!-- 페이징 -->
		<div class="row mt-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>
						<li class="page-item">
						<c:if test="${pagingDto.startPage > 1}">
							<a class="page-link" href="${pagingDto.startPage - 1}" style="border-radius: 50%;">&lt;</a>
						</c:if> <!-- 1페이지이면 화살표가 생기지 않도록 -->
						<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
							<li 
								<c:choose>
									<c:when test="${pagingDto.page eq v}">
										class="page-item active" 
									</c:when>
									<c:otherwise>
										class="page-item" 
									</c:otherwise>
								</c:choose>
							>
								<a class="page-link" href="${v}">${v}</a>
							</li>
						</c:forEach>
						<c:if test="${pagingDto.endPage < pagingDto.totalPage}">
							<li class="page-item">
								<a class="page-link" href="${pagingDto.endPage + 1}" style="border-radius: 50%;">&gt;</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<!-- END 페이징 -->
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
