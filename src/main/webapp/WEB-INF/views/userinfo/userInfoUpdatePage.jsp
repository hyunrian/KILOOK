<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/menu.jsp" %>
<style>
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
	// 페이지 실행되면 유저 프로필사진 display
	var userid = $("#userid").val();
	$("#userProfile").attr("src", "/profile/display?userid=" + userid);
	
	// 유저 이미지 변경 미리보기(파일선택 버튼)
	let filePath = "";
	$("#inputImg").change(function (e) {
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
				console.log("filePath : " + rData);
				$("#imgProfile").attr("src", "/profile/displayUpdate?filePath=" + rData);
				filePath = rData;
			}
		});
	});
	
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
		} else if (updateUnickname == "" && filePath == "" && updateUpw == "") { // 수정할 내용이 하나도 없으면 유저정보수정 작동 안함
			alert("수정할 내용이 없습니다.");
		} else { // 조건 전부 만족하여 유저정보 업데이트 기능 작동
			
//			데이터 전송 폼에 든 내용으로 DB 수정. 입력한 값이 있는것들만 수정함
			if (updateUnickname != "") {
				$("#updateUnickname").val(updateUnickname);
			}
			if (updateUpw != "") {
				$("#updateUpw").val(updateUpw);
			}
			if (filePath != "") {
				$("#updateUimg").val(filePath);
			}

			alert("수정이 완료되었습니다.");
			var form = $("#userVoForm");
			form.submit();
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
			                <img src="/resources/images/userProfile/default_profile.png" alt="profile" id="imgProfile" style="height: 100px; width: 100px;">
	              		</c:when>
	              		<c:otherwise>
			                <img id="userProfile" src="${userVo.uimg}" alt="profile" id="imgProfile" style="height: 100px; width: 100px;">              		
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
    
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>