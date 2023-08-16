<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/menu.jsp" %>
<style>
	html, body {
		background-color: gray;
	}
</style>
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
<body>
    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        
        	<div class="col-md-2 sidebar ftco-animate">
          	</div> <!-- .col-md-2 -->
        
          <div class="col-md-8 ftco-animate">
          
          <div class="sidebar-box ftco-animate">
          	
            <h3 class="mb-5">사용자 정보 수정 페이지</h3>
            
          	<div class="form-control" style="margin-bottom: 10px">닉네임 : <input type="text" id="unickname" placeholder="${userVo.unickname}"></div>
			<div class="form-control" style="margin-bottom: 10px">비밀번호 : <input type="password" id="upw" placeholder="비밀번호"></div>
			<div class="form-control" style="margin-bottom: 10px">비밀번호 확인 : <input type="password" id="checkUpw" placeholder="비밀번호 확인"></div>
			<input type="button" id="btnUpdateDone" value="정보 수정 완료" class="btn py-3 px-4 btn-primary">
          
            <input type="hidden" id="userid" value="testuser"> <!-- 임시데이터. 이후 loginInfo session 생성시 거기서 userid 따올것 -->
            <input type="hidden" id="verifyCode" value="${verifyCode}">
            <input type="hidden" id="uemail" value="${uemail}">
             
          </div>
          
          </div> <!-- .col-md-8 -->
          
          <div class="col-md-2 sidebar ftco-animate">
            
          </div> <!-- .col-md-2 -->

        </div>
      </div>
    </section> <!-- .section -->
    
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
    
    <!-- 마이페이지로 돌아가기 -->
    <form id="frmBackToInfo" action="/userinfo/mypage/${userVo.userid}" method="get"></form>
    <!-- //마이페이지로 돌아가기 -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>