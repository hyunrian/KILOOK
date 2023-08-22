<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/menu.jsp" %>
<script>
$(function(){
	// 페이지 실행되면 유저 프로필사진 display
	var userid = $("#userid").val();
	$("#userProfile").attr("src", "/profile/display?userid=" + userid);
})
</script>
<body>
    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        
        <%@ include file="/WEB-INF/views/include/mypageSidemenu.jsp" %>
        
          <div class="col-md-8 ftco-animate bg-light">
            <div class="about-author d-flex p-5" style="border-bottom: 1px dashed gray;">
              <div class="bio align-self-md-center mr-5">
              	<!-- ${userVo.uimg}(유저 이미지)가 없으면 기본이미지, 있으면 경로로 지정 -->
              	<c:choose>
              		<c:when test="${userVo.uimg == null}">
		                <img src="/resources/images/userProfile/default_profile.png" alt="Image placeholder" class="img-fluid mb-4">
              		</c:when>
              		<c:otherwise>
		                <img id="userProfile" src="${userVo.uimg}" alt="Image placeholder" class="img-fluid mb-4">
              		</c:otherwise>
              	</c:choose>
              </div>
              <div class="desc align-self-md-center">
                <h3>${userVo.unickname}님의 마이페이지</h3>
                <p>보유 포인트 : ${userVo.upoint}</p>
                <c:choose>
                	<c:when test="${userVo.verified == 'F'}">
				        <p>본인확인 이메일 : <a href="/userInfo/getVerifyEmail">인증 필요</a></p>
                	</c:when>
                	<c:otherwise>
                		<p>본인확인 이메일 : <span>${userVo.uemail}</span></p>
                	</c:otherwise>
                </c:choose>
                <div class="meta">가입일 : ${userVo.joindate}</div>
                <p style="color: white;">ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</p>
              </div>
            </div>

			<!-- 작성한 게시물 미리보기. 작성한 글이 없을때도 안내함. -->
            <div class="pt-5" style="padding-left: 48px">
              <h3 class="mb-5"><a href="/userInfo/mypost">내 게시물 미리보기</a></h3>
              <c:choose>
              	<c:when test="${userBoardCount == 0}">
              		<h4 style="padding-bottom: 48px; padding-left: 48px;">작성한 게시물 없음</h4>
              	</c:when>
              	<c:otherwise>
              		<ul class="comment-list">
	              	<c:forEach items="${boardList}" var="boardDto" begin="0" end="0"> <!-- 글 리스트 한개만 -->
		              <li class="comment">
		                 <div class="comment-body" style="float: none;">
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
            
            <!-- 작성한 댓글 미리보기. 작성한 댓글이 없을때도 안내함. -->
            
              <h3 class="mb-5"><a href="/userInfo/myreply">내 댓글 미리보기</a></h3>
              <c:choose>
              	<c:when test="${userReplyCount == 0}">
              		<h4 style="padding-bottom: 48px; padding-left: 48px;">작성한 댓글 없음</h4>
              	</c:when>
              	<c:otherwise>
              		<ul class="comment-list">
		              	<c:forEach items="${replyList}" var="replyDto" begin="0" end="0"> <!-- 댓글 리스트 한개만 -->
		                <li class="comment">
		                  <div class="comment-body" style="float: none;">
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
          </div> <!-- .col-md-8 -->

        </div>
      </div>
    </section> <!-- .section -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>