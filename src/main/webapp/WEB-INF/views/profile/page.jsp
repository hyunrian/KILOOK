<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
$(function() {
	
	let filePath = "";
	
	$("#inputProfile").change(function(e) {
		const file = e.target.files[0];
		const formData = new FormData();
		formData.append("file", file);
		// 서버에 이미지 저장
		$.ajax({
			"type" : "post",
			"url" : "/profile/upload",
			"data" : formData,
			"contentType" : false,
			"processData" : false,
			"success" : function(rData) {
				$("#imgProfile").attr("src", "/profile/displayUpdate?filePath=" + rData);
				filePath = rData;
			}
		});
	});
	
	$("#btnProfile").click(function() {
		$.ajax({
			"type" : "post",
			"url" : "/profile/uimg?filePath=" + filePath,
			"success" : function(rData) {
				console.log(rData); 
				// rData == "SUCCESS"면 다음에 실행할 코드 작성
				// 비밀번호 등 수정한 다른 정보와 함께 변경처리해도 됨
// 				$("#frmUpdate").submit(); // action에 실행할 controller mappgng value 입력해서 처리
			},
		});
	});
	
});
</script>
<div style="height: 500px;">
	<label>프로필 사진</label>
	<img src="/profile/display" alt="profile" id="imgProfile" style="height: 100px; width: 100px;">
	<form action="" method="post" id="frmUpdate">
		<input type="file" id="inputProfile" name="uimg"><br><br>
		<button type="button" id="btnProfile">확인</button>
	</form>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
