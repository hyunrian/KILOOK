<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>   
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
 	$("#userUpdate").click(function(e){
 		e.preventDefault();
		var form = $("#userVoForm");
		form.attr("action", "/userInfo/infoUpdate");
		form.submit();
	});
	
});
</script>
    
<div class="col-md-4 sidebar ftco-animate">
  <div class="sidebar-box ftco-animate">
    <div class="categories">
      <h3>내 정보</h3>
      <li><a href="/userInfo/mypost">작성한 게시글 <span>(${userBoardCount})</span></a></li>
      <li><a href="/userInfo/myreply">내 댓글 <span>(${userReplyCount})</span></a></li>
      <li><a href="#" id="userUpdate">내 정보 수정하기</a></li>      
      <li><a href="/userInfo//getVerifyEmail">이메일 본인확인 <span>(인증 필요)</span> </a></li>
    </div>
  </div>

  <div class="sidebar-box ftco-animate">
    <h3>이메일 본인확인</h3>
    <p id="emailCheckMessage">확인되지 않음</p>
    <p id="verifiedEmail"></p>
    <form action="/userInfo/verifyMail" method="post">
    	  <input type="hidden" name="userid" value="${userVo.userid}"> <!-- 임시 데이터. loginInfo 에서 데이터 받아오기 가능해지면 삭제. -->
     <input type="email" name="uemail" id="uemail" placeholder="이메일 입력" style="margin-bottom: 10px;">
     <input type="submit" id="btnEmailVerify" value="본인인증 하기" class="btn py-3 px-4 btn-primary">
    </form>
  </div>
</div> <!-- .col-md-4 -->