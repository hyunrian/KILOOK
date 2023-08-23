<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/menu.jsp" %>
<script>
$(function(){
	
	console.log($("#userid").val());

	// 작성된 이메일로 본인확인 코드 전송 버튼
	$("#btnEmailVerify").click(function(){
		$.ajax({
			"type" : "post",
			"url" : "/userInfo/verifyMail",
			"data" : {
				"uemail" : $("#uemail").val()
			},
			"success" : function(rData){
				$("#verifyCode").val(rData);
				console.log($("#verifyCode").val());
			}
		});
		$("#uemail").attr("readonly", true);
		$(this).hide();
		$("#btnEmailModify").show();
		$("#divCheckVerify").slideDown();
	});
	
	// 본인확인 이메일 수정 버튼
	$("#btnEmailModify").hide(); // 기본적으론 숨겨둠
	$("#btnEmailModify").click(function(){
		$("#uemail").attr("readonly", false);
		$(this).hide();
		$("#btnEmailVerify").show();
		$("#divCheckVerify").slideUp();
		$("#userVerifyCode").text("");
	});
	
	// 본인인증 완료 버튼
	$("#btnCheckVerify").click(function(){
		$.ajax({
			"type" : "post",
			"url"  : "/userInfo/checkVerify",
			"data" : {
					"verifyCode" : $("#verifyCode").val(),
					"userVerifyCode" : $("#userVerifyCode").val().trim(),
					"userid" : $("#userid").val(),
					"uemail" : $("#uemail").val()
				},
			"success" : function(rData){
				console.log(rData);
				if (rData == "success") {
					// 본인확인 성공 메세지 띄우기. 당장은 alert처리
					alert("본인확인 성공");
					// 마이페이지로 돌아가기
					$("#frmBackToInfo").attr("action","/userInfo/mypage");
					$("#frmBackToInfo").submit();
				} else {
					alert("본인확인 실패. 잘못된 코드입니다.");
				}
			}
		});
	});
});

</script>
<body>
    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        
        <%@ include file="/WEB-INF/views/include/mypageSidemenu.jsp" %>
        	
        
          <div class="col-md-8 ftco-animate">
          
          <div class="bg-light" style="padding: 25px 25px 25px 25px">
             	<h2 class="mb-5">이메일 본인확인</h2>
             	
			    <p id="verifiedEmail"></p>
			    <form action="/userInfo/verifyMail" method="post">
			    </form>
				<input type="email" class="form-control" id="uemail" 
					placeholder="이메일 입력" style="margin-bottom: 10px">
				<input type="button" id="btnEmailVerify" value="본인 확인 코드전송" class="btn py-3 px-4 btn-primary"
					style="margin-bottom: 25px">
				<input type="button" id="btnEmailModify" value="이메일 수정" class="btn py-3 px-4 btn-primary"
					style="margin-bottom: 25px">
			  
	          	<div id="divCheckVerify" style="display: none;">
	              <h6 class="mb-5" style="margin-top: 20px;">해당 메일로 본인인증 코드가 발송되었습니다.</h6>
	              <input type="hidden" id="verifyCode">
	              <input type="hidden" id="formUemail">
	              <input type="text" class="form-control" id="userVerifyCode" name="userVerifyCode"
					placeholder="본인인증 코드 입력" style="margin-bottom: 10px">
	              <input type="button" id="btnCheckVerify" value="본인 확인" class="btn py-3 px-4 btn-primary">
	            </div>
          </div>
          
          </div> <!-- .col-md-8 -->

        </div>
      </div>
    </section> <!-- .section -->
    
    <form id="frmBackToInfo" action="/userinfo/mypage" method="get"></form>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>