<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/menu.jsp" %>
<style>
	html, body {
		background-color: gray;
	}
</style>
<script>
$(function(){
	// 유저 본인확인 상태 체크, 본인 확인 완료 시 버튼 숨김
	function checkVerified() {
		if ('${userVo.verified}' == 'T') {
			$("#emailCheckMessage").text("확인됨. 본인확인 이메일:");
			$("#verifiedEmail").text("${userVo.uemail}");
			$("#uemail").hide();
			$("#btnEmailVerify").hide();
		}
	}
	checkVerified(); // 페이지를 열면 본인확인 체크 함수 실행

	// 유저 정보 수정 버튼(데이터 담아서 정보 수정 페이지로 이동)
 	$("#btnUserUpdate").click(function(){
		var form = $("#userVoForm");
		form.attr("action", "/userInfo/infoUpdate");
		form.submit();
	});
	
});
</script>
<body>
    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        
        <%@ include file="/WEB-INF/views/include/mypageSidemenu.jsp" %>
        
          <div class="col-md-8 ftco-animate">
            <div class="about-author d-flex p-5 bg-light">
              <div class="bio align-self-md-center mr-5">
              	<!-- ${userVo.uimg}(유저 이미지)가 없으면 기본이미지, 있으면 경로로 지정 -->
              	<!-- ${userVo.uimg} = "/resources/images/userProfile/....png" -->
              	<c:choose>
              		<c:when test="${userVo.uimg == null}">              		
		                <img src="/resources/images/userProfile/default_profile.png" alt="Image placeholder" class="img-fluid mb-4">
              		</c:when>
              		<c:otherwise>
		                <img src="${userVo.uimg}" alt="Image placeholder" class="img-fluid mb-4">              		
              		</c:otherwise>
              	</c:choose>
              </div>
              <div class="desc align-self-md-center">
                <h3>${userVo.unickname}님의 마이페이지</h3>
                <p>보유 포인트 : ${userVo.upoint}</p>
                <c:choose>
                	<c:when test="${userVo.uemail != null}">
		                <p>본인확인 이메일 : ${userVo.uemail}</p>                	
                	</c:when>
	                <c:otherwise>
		                <p>본인확인 이메일 : 없음</p>
	                </c:otherwise>
                </c:choose>
                <div class="meta">가입일 : ${userVo.joindate}</div>
                <input type="button" id="btnLogout" value="로그아웃" style="margin-top: 5px" onclick="location.href='/loginUser/logout'">
                <p style="color: white;">ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</p>
              </div>
            </div>

			<!-- 작성한 게시물 미리보기. 작성한 글이 없을때도 안내함. -->
            <div class="pt-5 mt-5">
              <h3 class="mb-5">내 게시물 미리보기</h3>
              <c:choose>
              	<c:when test="${userBoardCount == 0}">
              		<h4 class="mb-5">작성한 게시물 없음</h4>
              	</c:when>
              	<c:otherwise>
              		<ul class="comment-list">
	              	<c:forEach items="${boardList}" var="boardDto" begin="0" end="0"> <!-- 글 리스트 한개만 -->
		              <li class="comment">
		                 <div class="comment-body">
		                   <h3>${boardDto.title}</h3>
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
            
            <!-- 작성한 댓글 미리보기. 작성한 댓글이 없을때도 안내함. -->
            <div class="pt-5 mt-5">
              <h3 class="mb-5">내 댓글 미리보기</h3>
              <c:choose>
              	<c:when test="${userReplyCount == 0}">
              		<h4 class="mb-5">작성한 댓글 없음</h4>
              	</c:when>
              	<c:otherwise>
              		<ul class="comment-list">
		              	<c:forEach items="${replyList}" var="replyDto" begin="0" end="0"> <!-- 댓글 리스트 한개만 -->
		                <li class="comment">
		                  <div class="comment-body">
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