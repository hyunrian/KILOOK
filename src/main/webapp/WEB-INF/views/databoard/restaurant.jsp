<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
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
        const selectBoxValue = $(this).val();
        console.log("selectBoxValue:", selectBoxValue); // test ok
		location.href = "/databoard/filterRestaurant?location=" + selectBoxValue;
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

<form id="frmPaging" action="/databoard/restaurant" method="get">
	<input type="hidden" name="bno" value="${param.bno}">
	<input type="hidden" name="page" value="${pagingDto.page}">
	<input type="hidden" name="perPage" value="${pagingDto.perPage}">
</form>

	<!-- menu -->
	<%@ include file="/WEB-INF/views/include/menu.jsp" %>
	<!-- END menu -->

	<div style="background-color: #000000; width: 100%; height: 90px;">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
				data-scrollax-parent="true">
				<div class="col-md-9 ftco-animate text-center"
					data-scrollax=" properties: { translateY: '70%' }">
					<p class="breadcrumbs"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Blog</span>
					</p>
					<h1 class="mb-3 bread"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Tips
						&amp; Articles</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section bg-light" >
		<!-- 필터 -->
		<div class="container">
			<div >
				<form id="frm" action="">
					<input type="text" name="search">
					<button type="submit">검색</button>
				</form>
				<select id="selectBox">
					<option>-- 선택 --</option>
					<option value="전체보기" ${foodList == '전체보기' ? 'selected="selected"' : '' }>전체보기</option>
					<option value="강서구" ${foodList == '강서구' ? 'selected="selected"' : '' }>강서구</option>
					<option value="영도구" ${foodList == '영도구' ? 'selected="selected"' : '' }>영도구</option>
					<option value="부산진구" ${foodList == '부산진구' ? 'selected="selected"' : '' }>부산진구</option>
					<option value="연제구" ${foodList == '연제구' ? 'selected="selected"' : '' }>연제구</option>
					<option value="중구" ${foodList == '중구' ? 'selected="selected"' : '' }>중구</option>
					<option value="금정구" ${foodList == '금정구' ? 'selected="selected"' : '' }>금정구</option>
					<option value="북구" ${foodList == '북구' ? 'selected="selected"' : '' }>북구</option>
					<option value="해운대구" ${foodList == '해운대구' ? 'selected="selected"' : '' }>해운대구</option>
					<option value="사상구" ${foodList == '사상구' ? 'selected="selected"' : '' }>사상구</option>
					<option value="기장군" ${foodList == '기장군' ? 'selected="selected"' : '' }>기장군</option>
					<option value="사하구" ${foodList == '사하구' ? 'selected="selected"' : '' }>사하구</option>
					<option value="서구" ${foodList == '서구' ? 'selected="selected"' : '' }>서구</option>
					<option value="남구" ${foodList == '남구' ? 'selected="selected"' : '' }>남구</option>
					<option value="수영구" ${foodList == '수영구' ? 'selected="selected"' : '' }>수영구</option>
					<option value="동구" ${foodList == '동구' ? 'selected="selected"' : '' }>동구</option>
					<option value="동래구" ${foodList == '동래구' ? 'selected="selected"' : '' }>동래구</option>
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
								style="background-image: url('${foodVo.thumbimage}');"> </a>
							<div class="text p-4 d-block">
								<h3 class="heading mt-3">
									<a href="/databoard/getFoodInfo?bno=${foodVo.bno}">${foodVo.rname}</a><br>
									<a href="#" class="meta-chat"><span class="icon-chat"></span>${foodVo.replycnt}</a>
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
								<a class="page-link" href="${pagingDto.startPage - 1}">&lt;</a>
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
							<c:if test="${pagingDto.endPage lt pagingDto.totalPage}">
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

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
