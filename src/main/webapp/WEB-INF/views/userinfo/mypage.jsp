<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<script>
$(function(){
	
	// 유저 본인확인 상태 체크, 본인 확인 완료 시 버튼 숨김
	function checkVerified() {
		if ('${userVo.verified}' == 'T') {
			$("#btnVerify").css('display', 'none');
		}
	}
	checkVerified();

	// 유저 정보 수정 버튼
	$("#btnUserUpdate").click(function(){
		var form = $("#userVoForm");
		form.attr("action", "/userinfo/infoUpdate");
		form.submit();
	});
	
	// 유저 본인확인
	
	// !!--- 구현 필요 ---!!
	$("#btnVerify").click(function(){
		alert("구현 필요");
	});
	// !!--- 구현 필요 ---!!
	
});

</script>
</head>
<body>
	
	<h1>마이 페이지</h1>
	
	<div>유저 이미지 공간 <button id="btnUserUpdate">유저 정보 수정</button></div><br>
	
	<div>닉네임 : ${userVo.unickname}</div>
	<div>소지 포인트 : ${userVo.upoint}</div>
	<div>본인확인 여부 : ${userVo.verified} <button id="btnVerify">본인 확인</button></div>
	
	
	
	
	
	<!-- 이하 페이지에 표시 되지 않는 내용 -->
	
	<!-- 유저 정보 보관용 form -->
	<!-- 정보 수정 시 전달될 데이터 -->
	<form id="userVoForm" method="post">
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
</body>
</html>