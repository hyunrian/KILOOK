<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/menu.jsp" %>
<style>
	html, body {
		background-color: gray;
	}
	
	.inputSamll {
	    background: #eee;
	    padding: 11px;
	    margin: 8px 0;
	    width: 85%;
	    border: 0;
	    outline: none;
	    border-radius: 20px;
	    box-shadow: inset 7px 2px 10px #babebc, inset -5px -5px 12px #fff;
	}
</style>
<script>
$(function(){
	// 프로필 사진 수정
	// 파일, 파일명 필드 지정(저장버튼 클릭 시 전송 + null일때 개인정보 수정 실패 처리)
	var uploadProfile = null;
	var filename = "";
	// 사진 미리보기 띄우기, 필드에 값 저장
	$("#inputImg").change(function (e) {
		
		uploadProfile = e.target.files[0];
		var reader = new FileReader();
	    reader.onload = function(e) {
	    	$("#preview").attr("src", e.target.result);
	    }
	    reader.readAsDataURL(uploadProfile);
	    
	    filename = uploadProfile.name.toLowerCase();
	});
	
//	-----파일 적합성 확인(현재 미구현)-----
//	파일이 이미지가 아니거나, 용량이 너무 크면 적합성 확인 후 유저정보 수정 버튼 비활성화 + 경고문 출력할 것(기능 정상적 구동 확인 후 추가할 것)
	// 확장자가 이미지 파일인지 확인
	function isImageFile(file) {

	    var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다. 

	    return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
	}
	// 파일의 최대 사이즈 확인
	function isOverSize(file) {

	    var maxSize = 16 * 1024; // 16KB로 제한 

	    return (file.size > maxSize) ? true : false;
	}
//	----//파일 적합성 확인----
	
	
	// 유저정보 수정 완료 및 전송
	$("#btnUpdateDone").click(function(){
		// 닉네임, 비밀번호, 비밀번호 확인 정보
		var updateUnickname = $("#unickname").val().trim();
		var updateUpw = $("#upw").val().trim();
		var checkUpw = $("#checkUpw").val().trim();
		
		// 입력한 비밀번호와 비밀번호 확인이 다르면 수정 기능 작동하지 않음
		var doUpdate = true;
		if (updateUpw != checkUpw) {
			doUpdate = false;
		}
		
		// 수정기능 작동 확인. 하나라도 만족 못하면 경고문만 출력. alert 이외의 방법 고민.
		if (doUpdate == false) { // 비밀번호 확인 실패시 작동 안함 + 비밀번호, 비밀번호 확인란 비우기
			$("#upw").val("");
			$("#checkUpw").val("");
			alert("비밀번호를 다시 확인해주세요.");
		} else if (updateUnickname == "" && filename == "" && updateUpw == "") { // 수정할 내용이 하나도 없으면 유저정보 수정이 작동 안함
			alert("수정할 내용이 없습니다.");
		} else {
			alert("수정이 완료되었습니다.");
			// 이미지 수정했을 경우 서버에 해당 이미지 저장
			console.log(filename);
//			데이터 전송 폼에 든 내용 수정. 입력한 값이 있는것들만 수정함
			if (updateUnickname != "") {
				$("#updateUnickname").val(updateUnickname);
			}
			if (updateUpw != "") {
				$("#updateUpw").val(updateUpw);
			}
			if (filename != "") {
				// uploadProfile = 업로드할 파일
				console.log(uploadProfile);
				var formData = new FormData();
				var userid = $("#userid").val();
				formData.append("profile", uploadProfile);
				formData.append("userid", userid);
				var imgname = "";
				$.ajax({
					"type" : "post",
					"url" : "/userInfo/uploadFile",
					"processData" : false, 
					"contentType" : false,
					"data" : formData,
					"success" : function(rData){
						console.log(rData)
						//	rData = 파일 저장 경로 + 유저아이디 + _ + 파일명 (saveFilename)
						imgName = rData;
					}
				}); 
			}
			$("#updateUimg").val(imgname);
			var form = $("#userVoForm");
//			form.submit();
		}
		
	}); // 유저 정보 수정 완료 (btnUpdateDone 클릭)
	
});

</script>
<body>
    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        
        <%@ include file="/WEB-INF/views/include/mypageSidemenu.jsp" %>
        
          <div class="col-md-8 ftco-animate">
           <div class="sidebar-box ftco-animate">
            <form action="#" class="p-5 bg-light">
            
            <h2 class="mb-5">사용자 정보 수정</h2>
            
            <div class="form-group">
                <label for="unickname">프로필 사진</label>
                <div class="bio align-self-md-center mr-5">
              		<c:choose>
	              		<c:when test="${userVo.uimg == null}">              		
			                <img src="/resources/images/userProfile/default_profile.png" alt="Image placeholder" class="img-fluid mb-4">
	              		</c:when>
	              		<c:otherwise>
			                <img src="${userVo.uimg}" alt="Image placeholder" class="img-fluid mb-4">              		
	              		</c:otherwise>
	              	</c:choose>
             		<input type="file" id="inputImg">
            	</div>
            </div>
            
              <div class="form-group">
                <label for="unickname">닉네임</label>
                <input type="text" class="form-control" id="unickname" placeholder="${userVo.unickname}">
              </div>
              <div class="form-group">
                <label for="upw">비밀번호</label>
                <input type="password" class="form-control" id="upw" placeholder="새 비밀번호">
              </div>
              <div class="form-group">
                <label for="checkUpw">비밀번호 확인</label>
                <input type="password" class="form-control" id="checkUpw" placeholder="새 비밀번호 확인">
              </div>
              <div class="form-group">
                <input type="button" id="btnUpdateDone" value="정보 수정 완료" class="btn py-3 px-4 btn-primary">
              </div>	
            </form>
            
            <input type="hidden" id="verifyCode" value="${verifyCode}">
            <input type="hidden" id="uemail" value="${uemail}">
             
           </div>
          </div> <!-- .col-md-8 -->

        </div>
      </div>
    </section> <!-- .section -->
    
    <!-- 이하 페이지에 표시 되지 않는 내용 -->
	
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
    <form id="frmBackToInfo" action="/userinfo/mypage/${userVo.userid}" method="get"></form>
    <!-- //마이페이지로 돌아가기 -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>