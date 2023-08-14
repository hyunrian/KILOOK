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
	$("#summernote").summernote({
		height: 700, // 에디터 높이
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
	});
	
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
	
	
});	 
</script>
<!-- <body> -->
<%@ include file="/WEB-INF/views/include/menu.jsp"%>

<section class="ftco-section contact-section ftco-degree-bg">
	<div class="container">
		
		<div class="row block-9">
			<div class="col-md-12 pr-md-10">
				<form action="#" type="post">
					<input type="text" class="form-control" placeholder="제목"><br>
					<textarea id="summernote" name="editordata"></textarea><br>
					<div class="form-group" style="position: relative;">
						<input type="button" value="완료" 
							class="btn btn-primary btn-block" id="btnInsert" style="border: none;">
<!-- 						<input type="button" value="취소"  -->
<!-- 							class="btn py-3 px-4 btn-primary" id="btnCancel" style="border: none;"> -->
					</div>
				</form>
			</div>

		</div>
	</div>
</section>
</body>
</html>
