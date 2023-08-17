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
	$("#btnCheckVerify").click(function(){
		$.ajax({
			"type" : "post",
			"url"  : "/userinfo/checkVerify",
			"data" : {
					"verifyCode" : $("#verifyCode").val(),
					"userVerifyCode" : $("#userVerifyCode").val(),
					"userid" : $("#userid").val(),
					"uemail" : $("#uemail").val()
				},
			"success" : function(rData){
				if (rData == "success") {
					// 유저아이디 그대로 마이페이지로
					// 임시데이터. loginInfo에서 userid 데이터 받아오게 이미 세팅되어있음.
					$("#frmBackToInfo").attr("action","/userinfo/mypage/testuser");
					// 본인확인 성공 메세지 띄울 것. 당장은 alert처리
					alert("본인확인 성공");
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
        
        	<div class="col-md-2 sidebar ftco-animate">
          	</div> <!-- .col-md-2 -->
        
          <div class="col-md-8 ftco-animate">
          
          <div class="sidebar-box ftco-animate">
              <h3 class="mb-5">해당 메일로 본인인증 코드가 발송되었습니다. : ${uemail}</h3>
              <input type="hidden" id="userid" value="testuser"> <!-- 임시데이터. 이후 loginInfo session 생성시 거기서 userid 따올것 -->
              <input type="hidden" id="verifyCode" value="${verifyCode}">
              <input type="hidden" id="uemail" value="${uemail}">
              <input type="text" class="form-control" id="userVerifyCode" name="userVerifyCode"
              	placeholder="본인인증 코드 입력" style="margin-bottom: 10px">
              <input type="button" id="btnCheckVerify" value="본인 확인" class="btn py-3 px-4 btn-primary">
          </div>
          
          </div> <!-- .col-md-8 -->
          
          <div class="col-md-2 sidebar ftco-animate">
            
          </div> <!-- .col-md-2 -->

        </div>
      </div>
    </section> <!-- .section -->
    
    <form id="frmBackToInfo" action="/userinfo/mypage/${userid}" method="get"></form>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>