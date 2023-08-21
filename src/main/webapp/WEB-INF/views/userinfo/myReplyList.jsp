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
        
          <div class="col-md-8 ftco-animate">
            <div class="about-author d-flex bg-light" style="padding-left: 15px">
              <div class="bio align-self-md-center mr-5">
              	
              	<!-- 작성한 게시물 미리보기. 작성한 글이 없을때도 안내함. -->
	            <div class="pt-5 mt-5">
	              <h2 class="mb-5">내 댓글 목록</h2>
	              
	            </div>
              	
              </div>
            </div>

			<div class="sidebar-box ftco-animate fadeInUp ftco-animated">
			    <div class="categories">
			      <li><div>작성한 댓글</div></li>
			      
			      <c:choose>
	              	<c:when test="${userReplyCount == 0}">
	              		<p class="mb-5">작성한 댓글 없음</p>
	              	</c:when>
	              	<c:otherwise>
	              		<ul class="comment-list">
		              	<c:forEach items="${replyList}" var="replyDto">
			              <li class="comment">
			                 <div class="comment-body">
			                  	 <h3><a href="#">${replyDto.replytext}</a></h3>
			                  	 <h3>${replyDto.replytext}</h3>
		                   		<div class="meta">${replyDto.regdate}</div>
			                   	<p>게시물 제목 : ${replyDto.title}</p>
			                 </div>
			              </li>
			            </c:forEach>
			            </ul>
	              	</c:otherwise>
	              </c:choose>
			    </div>

				<div class="row mt-5" style="margin-top: 15px">
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
    
    <!-- 이하 페이지에 표시 되지 않는 내용 -->
	
	<!-- 유저 정보 보관용 form -->
	<!-- 정보 수정 시 전달될 데이터 -->
	<form id="userVoForm" method="post" action="/userInfo/infoUpdate">
		<input type="hidden" name="userid" value="${userVo.userid}">
		<input type="hidden" name="upw" value="${userVo.upw}">
		<input type="hidden" name="unickname" value="${userVo.unickname}">
		<input type="hidden" name="upoint" value="${userVo.upoint}">
		<input type="hidden" name="uimg" value="${userVo.uimg}">
		<input type="hidden" name="uemail" value="${userVo.uemail}">
		<input type="hidden" name="signupfrom" value="${userVo.signupfrom}">
		<input type="hidden" name="joindate" value="${userVo.joindate}">
		<input type="hidden" name="verified" value="${userVo.verified}">
	</form>
	<!-- //유저 정보 보관용 form -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>