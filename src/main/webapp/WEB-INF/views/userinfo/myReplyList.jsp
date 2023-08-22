<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/menu.jsp" %>
<script>
$(function(){
	$(".pageLink").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
//		location.href = "/board/list?page=" + page + "&perPage=${pagingDto.perPage}";
		$("input[name=page]").val(page);
		var form = $("#frmPaging");
		form.attr("action", "/userInfo/myreply");
		form.submit();
	});
});
</script>

<form id="frmPaging" method="get">
	<input type="hidden" name="page" value="${infoPagingDto.page}">
</form>

<body>
    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        
        <%@ include file="/WEB-INF/views/include/mypageSidemenu.jsp" %>
        
          <div class="col-md-8 ftco-animate bg-light">
            <div class="about-author d-flex" style="padding-left: 48px">
				<h2 class="pt-5 mb-5">내 댓글 목록</h2>
            </div>

			<div class="ftco-animate fadeInUp ftco-animated bg-light">
			    <div class="categories">
			      
			      <c:choose>
	              	<c:when test="${userReplyCount == 0}">
	              		<h3 class="mb-5" style="padding-left: 48px">작성한 댓글 없음</h3>
	              	</c:when>
	              	<c:otherwise>
	              		<ul class="comment-list">
		              	<c:forEach items="${replyList}" var="replyDto" begin="${infoPagingDto.startRow - 1}" end="${infoPagingDto.endRow - 1}">
			              <li class="comment" style="margin-left:  -25px">
			                 <div class="comment-body">
			                  	<h3><a href="http://localhost/userboard/detail?bno=${replyDto.bno}">
			                  	 	${replyDto.replytext}</a></h3>
		                   		<div class="meta">${replyDto.regdate}</div>
			                   	<p>원본 글 : ${replyDto.title}</p>
			                 </div>
			              </li>
			            </c:forEach>
			            </ul>
	              	</c:otherwise>
	              </c:choose>
			    </div>

				<div class="row mt-5" style="padding-top: 24px; padding-bottom: 24px">
		          <div class="col text-center">
		            <div class="block-27">
		              <ul>
		              	<c:if test="${infoPagingDto.startPage != 1}">
							<li>
								<a class="pageLink" href="${infoPagingDto.startPage - 1}">&lt;</a>
							</li>
						</c:if>
						<c:forEach var="v" begin="${infoPagingDto.startPage}" end="${infoPagingDto.endPage}">					
							<li
								<c:choose>
									<c:when test="${infoPagingDto.page eq v}">
										class="page-item active"
									</c:when>
									<c:otherwise>
										class="page-item"
									</c:otherwise>
								</c:choose>
							 >
								<a class="pageLink" href="${v}">${v}</a>
							</li>
						</c:forEach>
						<c:if test="${infoPagingDto.endPage < infoPagingDto.totalPage}">
							<li>
								<a class="pageLink" href="${infoPagingDto.endPage + 1}">&gt;</a>
							</li>
						</c:if>
		                
		              </ul>
		            </div>
		          </div>
		        </div>
			
			  </div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>