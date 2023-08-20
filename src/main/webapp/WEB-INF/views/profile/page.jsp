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
				console.log("rData:", rData);
			},
			"error" : function(request, error) {
				console.log("status : " + request.status + ", message : " 
						+ request.responseText + ", error : " + error);
			}
		
		});
		
// 		$.ajax({
// 			"type" : "get",
// 			"url" : "/profile/display/" + file.name,
// 			"success" : function(rData) {
// 				console.log(rData);
// 			},
// 			"error" : function(request, error) {
// 				console.log("status : " + request.status + ", message : " 
// 						+ request.responseText + ", error : " + error);
// 			}
		
// 		});
	});
	
	$("#btnProfile").click(function() {
		$.ajax({
			"type" : "post",
			"url" : "/profile/upload",
			"data" : formData,
			"contentType" : false,
			"processData" : false,
			"success" : function(rData) {
				$("#summernote").summernote("insertImage", "/attach/displayImage?filePath=" + rData);
				const uploaded = $("#uploaded").clone();
				uploaded.addClass("uploaded");
				uploaded.text(rData);
				$("#uploaded").parent().append(uploaded);
				uploadedImageCnt = $(".uploaded").length;
			},
			"error" : function(request, error) {
				console.log("status : " + request.status + ", message : " 
						+ request.responseText + ", error : " + error);
			}
		
		});
	});
});
</script>
<div style="height: 500px;">
	<label>프로필 사진</label>
	<c:choose>
		<c:when test="${empty userVo.uimg}">
<%-- 			<img src="/profile/display/${userVo}" alt="profile"> --%>
		</c:when>
		<c:otherwise>
			<img src="" alt="profile">
		</c:otherwise>
	</c:choose>
	<form action="/profile/upload" method="post">
		<input type="file" id="inputProfile" name="uimg"><br><br>
		<button type="button" id="btnProfile">확인</button>
	</form>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
