<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>마이페이지</title>
<script>
$(function(){
	// 유저정보 수정 완료
	$("#btnUpdateDone").click(function(){
		var updateUnickname = $("#unickname").val().trim();
//		var updateUimg = $("#uimg").val().trim();  이미지 수정 미구현
		var updateUpw = $("#upw").val().trim();
		var checkUpw = $("#checkUpw").val().trim();
		
		// 입력한 비밀번호와 비밀번호 확인이 다르면 경고문과 함께 수정버튼 자체가 작동하지 않음
		if (updateUpw != checkUpw) {
			// 내용 구현 필요
		}
		
		// 입력한 값이 있을때만 수정함
		if (updateUnickname != "") {
			$("#updateUnickname").val(updateUnickname);
		}
		if (updateUimg != "") {
//			$("#updateUimg").val(updateUimg);
		}
		if (updateUpw != "") {
			$("#updateUpw").val(upw);
		}
		
		// 수정할 내용이 하나라도 있어야 유저정보 수정이 작동함. 유저 이미지는 나중에.
		if (updateUnickname != "" || updateUpw != "") {
			var form = $("#userVoForm")
			form.attr("action","/userinfo/updateDone");
			form.submit();
		} else { // alert 이외의 방법 고민.
			alert("수정할 내용이 없습니다.");
		}
		
	}); // 유저 정보 수정 완료 (btnUpdateDone 클릭)
	
});

</script>
</head>
<body>
	<h1>유저 정보 수정 페이지</h1>
	
	
	<div>이미지 : ${userVo.uimg} <button>사진 변경</button></div>
	<div>닉네임 : <input type="text" id="unickname" placeholder="${userVo.unickname}"></div>
	<div>비밀번호 : <input type="password" id="upw" placeholder="비밀번호"></div>
	<div>비밀번호 확인 : <input type="password" id="checkUpw" placeholder="비밀번호 확인"></div>
	<button id="btnUpdateDone">정보 수정 완료</button>

	
	
	
	
	
	<!-- 이하 페이지에 표시 되지 않는 내용 -->
	
	<!-- 유저 정보 보관용 form -->
	<!-- 정보 수정 시 전달될 데이터. mypage.jsp 와 다르게 수정될 input 3개에 id 붙음 -->
	<form id="userVoForm" method="post">
		<input type="hidden" name="userid" value="${userVo.userid}">
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
	
</body>
</html>