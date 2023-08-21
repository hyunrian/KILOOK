<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style>
/* summernote toolbar 메뉴 옆 화살표 제거 */
.dropdown-toggle::after {
	display: none; 
}

#btnInsert {
	position: absolute; 
	left: 50%; 
	top: 50%; 
	transform: translate(-50%, -50%);
	margin-top: 20px;
}
</style>

<script>
$(function() {
	
	// 게시글 새로 작성할 때 등록 완료하지 않으면 서버에 업로드된 파일 삭제
	let submitStatus = false; // 전송버튼을 클릭하면 true로 변경
	if ("${userBoardVo.bno}" == null) {
		$(window).bind("beforeunload", function() {
			if (!submitStatus) {
				const path = $(".uploaded").text().split("/userboard");
				for (var v = 0; v < path.length; v++) {
					if (path[v] != null && path[v] != "") {
						const filePath = "/userboard/" + path[v];
						deleteImage(filePath);
					}
				}
			}
		});
	}
	
	$("#summernote").summernote({
		height: 550, // 에디터 높이
		minHeight: null, // 최소 높이
		maxHeight: null, // 최대 높이
		focus: false, // 에디터 로딩 후 포커스온 여부
		lang: "ko-KR", // 한글 설정
		placeholder: '내용', // placeholder 설정
		tooltip: false,
		toolbar: [
		    // [groupName, [list of button]]
		    ['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    ['color', ['forecolor','color']],
		    ['table', ['table']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert',['picture','link','video']],
		    ['view', ['codeview']],
		  ],
		fontNames: ['Arial', 'Arial Black', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		
		callbacks: {
			onImageUpload: function(files) {
				
				if (getImageCnt() + files.length > 10) {
					alert("이미지는 최대 10개까지 업로드할 수 있습니다.");
					return;
				};
				
				for (var v = 0; v < files.length; v++) {
					uploadImage(files[v], this);
				}
			},
			
			onMediaDelete: function($target, editor, $editable) {
				if ("${userBoardVo.bno}" == null) {
					let filePath = $target.attr("src").split("=").pop();
					deleteImage(filePath);
				}
			}
		}
	});
	
	// 업로드된 이미지 개수 얻기
	function getImageCnt() {
		return $(".uploaded").length;
	}
	
	// 서버에 이미지 저장
	function uploadImage(file, editor) {
		let formData = new FormData();
		formData.append("file", file);
// 		console.log(file.name);
		$.ajax({
			"type" : "post",
			"url" : "/attach/save",
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
	}
	
	// 서버에 저장된 이미지 삭제
	function deleteImage(filePath) {
		$.ajax({
			"type" : "delete",
			"url" : "/attach/delete",
			"data" : filePath,
			"contentType" : false,
			"processData" : false,
			"success" : function(rData) {
				console.log(rData);
			},
		});
	}
	
	$("#summernote").summernote("fontName", "맑은 고딕");
	
	$(".modal-title").hide();
	
	// 모달창 css 수정 - 링크
	const linkDiv = $(".note-modal[aria-label='Insert Link']");
	linkDiv.find(".modal-body").find("div").eq(0).find("label").text("표시할 텍스트");
	linkDiv.find(".modal-body").find("div").eq(1).find("label").text("URL");
	linkDiv.find(".modal-body").find("div").eq(2).find("label").hide();
	linkDiv.find(".modal-body").find("div").eq(3).find("label").hide();
	linkDiv.find(".modal-footer").find("input").val("완료");

	// 모달창 css 수정 - 이미지
	const imageDiv = $(".note-modal[aria-label='Insert Image']");
	imageDiv.find(".modal-body").find("div").eq(0).find("label").text("업로드할 이미지를 선택하세요.");
	imageDiv.find(".modal-body").find("div").eq(1).find("label").text("URL");
	imageDiv.find(".modal-footer").find("input").val("완료");
	
	// 모달창 css 수정 - 영상
	const videoDiv = $(".note-modal[aria-label='Insert Video']");
	videoDiv.find(".modal-body").find(".note-form-label").text("URL(YouTube, Vimeo, Instagram 등)");
	videoDiv.find(".modal-body").find("div").eq(1).find("label").text("URL");
	videoDiv.find(".modal-footer").find("input").val("완료");
	
	// 게시글 작성
	$("#btnInsert").click(function() {
		let result = setData();
		if (result) $("#articleForm").submit();
	});
	
	// 수정하는 경우 기존 작성내용 불러오기
	if ("${userBoardVo.bno}" != null) {
		$("#titleText").val("${userBoardVo.title}");
		$(".note-editable").html('${userBoardVo.content}');
	}
	
	$("#btnUpdate").click(function() {
		let result = setData();
		if (result) $("#articleForm").submit();
	});
	
	function setData() {
		submitStatus = true;
		const title = $("#titleText").val().trim();
		const content = $("#summernote").val().trim();
		$("#thumbnailPath").html(content);
		
		if (title.length > 40) {
			alertMessage("제목으로 입력 가능한 글자 수는 최대 40자입니다.");
			return false;
		}
		
		if (title == "") {
			alertMessage("제목을 입력해주세요.");
			return false;
		}
		
		
		const imgSrc = $("#thumbnailPath").find("img").eq(0).attr("src");
		if (imgSrc != null && imgSrc != "") {
			const sub = imgSrc.substring((imgSrc.indexOf("="))+1);
			$("#thumbnail").val(sub);
		}
		return true;
	}
	
	function alertMessage(message) {
		$("#btnModal").trigger("click");
		$("#modalTitle").show();
		$("#modalBody").text(message);
	}
	
});	 

</script>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>

<section class="ftco-section contact-section ftco-degree-bg">
	<div class="container">
		<div class="row block-9">
			<div class="col-md-12 pr-md-10">
			<c:choose>
				<c:when test="${userBoardVo != null}">
					<form action="/userboard/update" method="post" id="articleForm">
						<input type="hidden" name="thumbnail" id="thumbnail">
						<input type="hidden" name="bno" value="${userBoardVo.bno}">
						<input type="text" class="form-control" placeholder="제목" 
							id="titleText" name="title"><br>
						<textarea id="summernote" name="content"></textarea><br>
						<div class="form-group" style="position: relative;">
							<input type="button" value="수정하기" 
								class="btn btn-primary btn-block" id="btnUpdate" style="border: none;">
						</div>
					</form>
				</c:when>
				<c:otherwise>
					<form action="/userboard/write" method="post" id="articleForm">
						<input type="hidden" name="thumbnail" id="thumbnail">
						<input type="text" class="form-control" placeholder="제목" 
							name="title" id="titleText"><br>
						<textarea id="summernote" name="content"></textarea><br>
						<div class="form-group" style="position: relative;">
							<input type="button" value="완료" 
								class="btn btn-primary btn-block" id="btnInsert" style="border: none;">
						</div>
					</form>
				</c:otherwise>
			</c:choose>
				
			</div>
		</div>
	</div>
</section>

<div style="text-align: right;">
	<span class="alert alert-warning" style="display: none; margin-right: 20px;"></span>
</div>

<!-- 유저 입력 관련 알림 모달창 -->
<button type="button" class="btn btn-primary" data-toggle="modal" 
	data-target="#myModal" id="btnModal" style="display: none;"></button>
<div class="modal" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modalTitle">
					<i class="fa-solid fa-triangle-exclamation" style="color: #ec8209;"></i>
					게시글을 등록할 수 없습니다.
				</h5>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" id="modalBody"></div>
			<div class="modal-footer">
				<button type="button" class="btn" style="color: white; 
					background-color: #5CD1E5;" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

<div style="display: none;">
	<span id="temp"></span>
	<span id="thumbnailPath"></span>
	<span id="uploaded"></span>
</div>
</body>
</html>
