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
		form.attr("action", "/userinfo/infoUpdate");
		form.submit();
	});
	
	$("#btnLogout").click(function(){
		//loginUser/logout
	})
	
});
</script>
<body>
    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        
        	<div class="col-md-4 sidebar ftco-animate">
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>내 정보</h3>
                <!-- 이후 내 게시글, 내 댓글 jsp로 이동 기능... 기능 희망중이긴 한데 시간에 안맞을듯 -->
                <li><a href="#">작성한 게시글 <span>(${userBoardCount})</span></a></li>
                <li><a href="#">내 댓글 <span>(${userReplyCount})</span></a></li>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>내 정보 수정하기</h3>
              <input type="button" id="btnUserUpdate" value="정보 수정" class="btn py-3 px-4 btn-primary">
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>이메일 본인확인</h3>
              <p id="emailCheckMessage">확인되지 않음</p> <!-- 확인되면 해당 이메일 이곳에 작성, 본인인증 버튼 hide();, -->
              <p id="verifiedEmail"></p>
              <form action="/userinfo/verifyMail" method="post">
              	  <input type="hidden" name="userid" value="testuser"> <!-- 임시 데이터. loginInfo 에서 데이터 받아오기 가능해지면 삭제. -->
	              <input type="email" name="uemail" id="uemail" placeholder="이메일 입력" style="margin-bottom: 10px;">
	              <input type="submit" id="btnEmailVerify" value="본인인증 하기" class="btn py-3 px-4 btn-primary">
              </form>
            </div>
          </div> <!-- .col-md-4 -->
        
          <div class="col-md-8 ftco-animate">
            <div class="about-author d-flex p-5 bg-light">
              <div class="bio align-self-md-center mr-5">
                <img src="/resources/images/person_1.jpg" alt="Image placeholder" class="img-fluid mb-4">
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
                
                <input type="button" id="btnLogout" value="로그아웃" style="margin-top: 5px">
                <p style="color: white;">ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</p>
              </div>
            </div>

            <div class="pt-5 mt-5">
              <h3 class="mb-5">내 게시물 미리보기</h3>
              <ul class="comment-list">
              	<c:forEach items="${boardList}" var="boardDto" begin="0" end="0"> <!-- 글 리스트 한개만 -->
                <li class="comment">
                  <div class="comment-body">
                    <h3>${boardDto.title}</h3>
                    <div class="meta">작성일 : ${boardDto.regdate}</div>
                    <p>좋아요 갯수 : ${boardDto.likecnt}</p>
                    <p>조회수 : ${boardDto.viewcnt}</p>
                    </div>
                </li>
                </c:forEach>
              </ul>
            </div>
            
            <div class="pt-5 mt-5">
              <h3 class="mb-5">내 댓글 미리보기</h3>
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
            </div>
          </div> <!-- .col-md-8 -->

        </div>
      </div>
    </section> <!-- .section -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>