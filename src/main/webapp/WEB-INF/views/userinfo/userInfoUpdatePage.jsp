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
	// 유저정보 수정 완료
	$("#btnUpdateDone").click(function(){
		var updateUnickname = $("#unickname").val().trim();
//		var updateUimg = $("#uimg").val().trim();  이미지 수정 미구현
		var updateUpw = $("#upw").val().trim();
		var checkUpw = $("#checkUpw").val().trim();
		
		// 입력한 비밀번호와 비밀번호 확인이 다르면 경고문과 함께 수정 기능 작동하지 않음
		var doUpdate = true;
		if (updateUpw != checkUpw) {
			// 구현 필요. 당장은 alert으로 대체
			doUpdate = false;
		}
		
		// 데이터 전송 폼에 든 내용 수정. 입력한 값이 있을때만 수정함
		if (updateUnickname != "") {
			$("#updateUnickname").val(updateUnickname);
		}
		if (updateUimg != "") {
//			$("#updateUimg").val(updateUimg);
		}
		if (updateUpw != "") {
			$("#updateUpw").val(updateUpw);
		}
		
		// 수정기능 작동 확인. 하나라도 만족 못하면 경고문만 출력. alert 이외의 방법 고민.
		if (doUpdate == false) { // 비밀번호 확인 실패시 작동 안함
			alert("비밀번호를 다시 확인해주세요.");
		} else if (updateUnickname == "" && updateUpw == "") { // 수정할 내용이 하나도 없으면 유저정보 수정이 작동 안함. 유저 이미지는 나중에.
			alert("수정할 내용이 없습니다.");
		} else {
			alert("수정이 완료되었습니다.");
			var form = $("#userVoForm")
			form.attr("action","/userinfo/updateDone");
			form.submit();
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
          	
            
            
            
            <form action="#" class="p-5 bg-light">
            
            <h2 class="mb-5">사용자 정보 수정</h2>
            
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