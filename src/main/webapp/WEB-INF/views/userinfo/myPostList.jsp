<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/menu.jsp" %>
<body>
    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        
        <%@ include file="/WEB-INF/views/include/mypageSidemenu.jsp" %>
        
          <div class="col-md-8 ftco-animate bg-light">
            <div class="about-author d-flex" style="padding-left: 48px">
				<h2 class="pt-5 mb-5">내 게시물 목록</h2>
            </div>
            
            <div class="sidebar-box ftco-animate fadeInUp ftco-animated">
			    <div class="categories">
			      
			      <c:choose>
	              	<c:when test="${userBoardCount == 0}">
	              		<h3 class="mb-5" style="padding-left: 48px">작성한 게시물 없음</h3>
	              	</c:when>
	              	<c:otherwise>
						<li><h3 style="padding-left: 48px">작성한 게시글</h3></li>
	              		<ul class="comment-list">
		              	<c:forEach items="${boardList}" var="boardDto">
			              <li class="comment">
			                 <div class="comment-body">
			                   <h3><a href="http://localhost/userboard/detail?bno=${boardDto.bno}">
			                   	${boardDto.title}</a></h3>
			                   <div class="meta">${boardDto.regdate}</div>
			                   <p>좋아요 : ${boardDto.likecnt}</p>
			                   <p>조회수 : ${boardDto.viewcnt}</p>
			                 </div>
			              </li>
			            </c:forEach>
			            </ul>
	              	</c:otherwise>
	              </c:choose>
			    </div>

				<div class="row mt-5" style="padding-top: 48px">
		          <div class="col text-center">
		            <div class="block-27">
		              <ul>
		                <li><a href="#">&lt;</a></li>
		                <li class="active"><span>1</span></li>
		                <li><a href="#">2</a></li>
		                <li><a href="#">3</a></li>
		                <li><a href="#">4</a></li>
		                <li><a href="#">5</a></li>
		                <li><a href="#">&gt;</a></li>
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