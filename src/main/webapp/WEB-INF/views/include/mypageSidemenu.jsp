<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- bootstrap -->
<script src="/myjs/myscript_hyun.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>   
<style>
	.btn-primary {
		border: 1px solid #5CD1E5;
	}
</style>
<script>
$(function(){
	// 사이드바 메뉴 내 정보 수정하기 버튼 (데이터 담아서 정보 수정 페이지로 이동)
 	$("#userUpdate").click(function(e){
 		e.preventDefault();
		var form = $("#userVoForm");
		form.attr("action", "/userInfo/infoUpdate");
		form.submit();
	});
	
 	// 인증된 계정은 이메일 본인확인 비활성화
	if (${userVo.verified == 'T'}) {
		$("#verifyEmail").click(function(e){
			alert("이미 인증된 계정입니다.");
			e.preventDefault();
		})	
	}
	
});
</script>
    
<div class="col-md-4 sidebar ftco-animate">
  <div class="sidebar-box ftco-animate">
    <div class="categories">
      <h3><a href="/userInfo/mypage" style="font-size: 25px">마이페이지</a></h3>
      <li><a href="/userInfo/mypost">작성한 게시글 <span>(${userBoardCount})</span></a></li>
      <li><a href="/userInfo/myreply">내 댓글 <span>(${userReplyCount})</span></a></li>
      <li><a href="#" id="userUpdate">내 정보 수정하기</a></li>      
      <li><a href="/userInfo/getVerifyEmail" id="verifyEmail">이메일 본인확인 
      	<c:choose>
      		<c:when test="${userVo.verified == 'F'}">
	      		<span>(인증 필요)</span>
      		</c:when>
      		<c:otherwise>
      			<span>(인증됨)</span>
      		</c:otherwise>
      	</c:choose>
      </a></li>
    </div>
  </div>
</div> <!-- .col-md-4 -->

<!-- 페이지에 표시 되지 않는 내용 -->
	
	<!-- 유저 정보 보관용 form -->
	<!-- 정보 수정 시 전달될 데이터. mypage.jsp 와 다르게 수정될 input 3개에 id 붙음 -->
	<!-- 이미지는 기본적으로 "/resources/images/userProfile/" 를 이미지 var 앞에 붙여서 vo로 전해줌 -->
	<form id="userVoForm" action="/userInfo/updateDone" method="post">
		<input type="hidden" name="userid" id="userid" value="${userVo.userid}">
		<input type="hidden" name="upw" id="updateUpw" value="${userVo.upw}">
		<input type="hidden" name="unickname" id="updateUnickname" value="${userVo.unickname}">
		<input type="hidden" name="upoint" value="${userVo.upoint}">
		<input type="hidden" name="uimg" id="updateUimg" value="${userVo.uimg}">
		<input type="hidden" name="uemail" value="${userVo.uemail}">
		<input type="hidden" name="signupfrom" value="${userVo.signupfrom}">
		<input type="hidden" name="joindate" value="${userVo.joindate}">
		<input type="hidden" name="verified" value="${userVo.verified}">
	</form>
	<!-- //유저 정보 보관용 form -->
    
    <!-- 마이페이지로 돌아가기 -->
    <form id="frmBackToInfo" action="/userInfo/mypage" method="get"></form>
    <!-- //마이페이지로 돌아가기 -->


