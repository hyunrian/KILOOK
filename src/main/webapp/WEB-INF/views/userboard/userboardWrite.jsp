<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
  
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css" -->
<!-- integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg=" crossorigin="anonymous"> -->

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
$(document).ready(function() {
	
	// 창닫기, 새로고침 시 서버에 업로드된 파일 삭제
	let submitStatus = false; // 전송버튼을 클릭하면 true로 변경
	$(window).bind("beforeunload", function() {
		if (!submitStatus) {
			$("")
		}
	});
	
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
				console.log("length:", files.length);
				if (files.length > 5) {
					alert("5개 이하의 이미지만 업로드 가능");
				}
				
				for (var v = 0; v < files.length; v++) {
					uploadImage(files[v], this);
					
				}
// 				console.log(files.name);
			},
		}
	});
	
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
				console.log(rData);
				$("#summernote").summernote("insertImage", "/attach/displayImage?filePath=" + rData);
			},
			"error" : function(request, error) {
				console.log("status : " + request.status + ", message : " 
						+ request.responseText + ", error : " + error);
			}
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
		const title = $("#titleText").val().trim();
		const content = $("#summernote").val();
		
		console.log("title:", title, "content:", content);
		$("#test").find("span").eq(0).text(title);
		$("#test").find("span").eq(1).html(content);
		const imgSrc = $("#test").find("span").eq(1).find("img").eq(0).attr("src");
		console.log("thumbnail: ", imgSrc)
		if (imgSrc != null && imgSrc != "") {
			const sub = imgSrc.substring((imgSrc.indexOf("="))+1);
			$("#thumbnail").val(sub);
		}
		$("#articleForm").submit();
	});
	
	
});	 
</script>
<!-- <body> -->
<%@ include file="/WEB-INF/views/include/menu.jsp"%>

<section class="ftco-section contact-section ftco-degree-bg">
	<div class="container">
		<div class="row block-9">
			<div class="col-md-12 pr-md-10">
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
			</div>

		</div>
	</div>
</section>

<div id="test">
	<span></span>
	<span></span>
</div>
</body>
</html>
