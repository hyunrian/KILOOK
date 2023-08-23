<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/menu.jsp" %>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>  
<style>
  .giftCard {
  	width: 300px;
    height: 200px;
    background-size: contain;
    background-repeat: no-repeat;
  }
  
  .rewardCard {
  	border : 2px dashed;
  	cursor: pointer;
  }
  
  .rewardCard p {
  	justify-content: center;
  	align-items: center;
  	color: white;
  	background-color: #444;
  }
  
  .rewardCard :hover {
  
  }

	.btn-primary {
		border: 1px solid #5CD1E5;
	}
	
}
</style>
<script>
$(function(){
	var userid = "";
	userid = $("#userid").val();
	var uemail = "";
	uemail = $("#uemail").val();
	
	// 포인트 상품 클릭
	var needPointNumber = "";
	$(".rewardCard").click(function(){
		// 포인트 상품 클릭 시 비로그인 상태 체크
		if (userid == "") {
			alert("로그인이 필요합니다.")
			location.href = "http://localhost/loginUser/login";
		} else {
			// 인증된 계정인지 확인
			if ($("#verified").val() == 'F') {
				alert("인증되지 않은 계정입니다. 상품 교환을 원하시면 계정 인증을 진행해주세요.")
				location.href = "http://localhost/userInfo/getVerifyEmail";
			} else {
				needPoint = $(this).find('span').text();
				var couponImg = $(this).find('img').attr('src');
				var couponName = $(this).find('h4').text();
				
				$("#modal-354826").trigger("click");
				$("#pointAmount").text(needPoint + "P");
				$("#choicedCoupon").attr("src", couponImg);
				$("#couponName").text(couponName);

				needPointNumber = Number(needPoint);
			}
			
		}
	});
	
	// 포인트 상품 구매(모달창 확인 버튼)
	$("#btnModalSend").click(function() {
		$.ajax({
		    "url": '/point/usePoint',
		    "type": 'GET',
		    "data": {
		    	"userid" : userid,
		    	"requiredPoint" : needPointNumber
		    },
		    "dataType": 'text',
		    "success": function(rData) {
		    	if (rData != "fail") {
			    	alert("상품 교환 완료. 이메일로 전송된 코드를 확인하세요.")
			    	// rData = 유저의 남은 포인트 문자열. DB와 
			    	$("#upoint").text(rData);
		    		$("#btnModalClose").trigger("click");
		    	} else {
		    		alert("포인트가 부족합니다.")
		    		$("#btnModalClose").trigger("click");
		    	}
		    }
		}); 
	});
	
	var targetid = "";
	var messageSendUrl = "";
	
	$(".sendMessage").click(function(e) {
		e.preventDefault();
		$("#modal-354826").trigger("click");
		targetid = $(this).parent().prev().text();
		messageSendUrl = $(this).attr("href");
	});
	
	$("#btnPointUseFailTest").click(function(e){
		e.preventDefault();
		$.ajax({
		    "url": '/point/usePoint',
		    "type": 'GET',
		    "data": {
		    	userid: 'testuser',
		    	requiredPoint: '10000'
		    },
		    "dataType": 'text',
		    "success": function(rData) {
		    	console.log(rData);
		    }
		}); 
	});	
		
	$("#btnPointUseTest").click(function(e){
		e.preventDefault();
		$.ajax({
		    "url": '/point/usePoint',
		    "type": 'GET',
		    "data": {
		    	userid: 'testuser',
		    	requiredPoint: '1'
		    },
		    "dataType": 'text',
		    "success": function(rData) {
		    	console.log(rData);
		    }
		}); 
	});	

});
</script>
<body>

<!-- 포인트 교환 모달창 -->
	<div class="row">
		<div class="col-md-12">
			 <a style="display:none;"
			 	id="modal-354826" href="#modal-container-354826" role="button" class="btn" data-toggle="modal">
			 	Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-354826" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								포인트 상품 교환
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
								<h3 style="margin-left: 14px">해당 상품을 교환하시겠습니까?</h3>
								<div style="margin-left: 14px; margin-bottom: 10px"> 쿠폰 코드는 본인확인에 사용한 이메일로 전송됩니다.</div>
								<img alt="Image placeholder" src="" class="img-fluid mb-4" id="choicedCoupon">
								<h5 style="margin-left: 14px;">상품명 : <span id="couponName"></span></h5>
								<div style="margin-left: 14px;">소지 포인트 : <span id="upoint">${userVo.upoint}</span>P</div>
								<div style="margin-left: 14px;">필요 포인트 : <span id="pointAmount"></span></div>
						</div>
						<div class="modal-footer">
							 
							<button type="button" id="btnModalSend"
								class="btn btn-primary">
								교환
							</button> 
							<button type="button" id="btnModalClose"
								class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
<!-- // 포인트 교환 모달창 -->



    <section class="ftco-section ftco-degree-bg bg-light" style="padding-top: 0px">
      <div class="container">
        <div class="row">
        
          <div class="col-md-16 ftco-animate">
            <div class="about-author d-flex p-5" style="border-bottom: 1px dashed gray;">
              <div class="bio align-self-md-center mr-5">
              </div>
              <div class="desc align-self-md-center">
                
				<h1 style="padding-top: 48px;">포인트 상품 교환</h1>
				<p>해당 쿠폰들은 끼룩 제휴점에서만 사용할 수 있으며 중복사용은 불가능합니다.</p>
                
				<h2 style="padding-top: 48px; padding-bottom: 48px">한식당 할인 쿠폰</h2>
				  <div class="row">
				    <div class="col-sm-4 rewardCard">
				      <img alt="Image placeholder" src="/resources/images/pointRewardImage/restaurant20.jpg" class="img-fluid mb-4" 
				      	style="padding: 24px 16px 16px 16px">
				      <h4>한식당 20% 할인 쿠폰</h4>
				      <p><span>2000</span>P 교환하기</p>
				    </div>
				    <div class="col-sm-4 rewardCard">
				      <img alt="Image placeholder" src="/resources/images/pointRewardImage/restaurant30.jpg" class="img-fluid mb-4"
				      	style="padding: 24px 16px 16px 16px">
				      <h4>한식당 30% 할인 쿠폰</h4>
				      <p><span>3000</span>P 교환하기</p><br>
				    </div>
				    <div class="col-sm-4 rewardCard">
				      <img alt="Image placeholder" src="/resources/images/pointRewardImage/restaurant50.jpg" class="img-fluid mb-4"
				      	style="padding: 24px 16px 16px 16px">
				      <h4>한식당 50% 할인 쿠폰</h4>
				      <p><span>5000</span>P 교환하기</p><br>
				    </div>
				  </div>
				  
				  <h2 style="padding-top: 48px; padding-bottom: 48px">숙소 할인 쿠폰</h2>
				  <div class="row">
				    <div class="col-sm-4 rewardCard">
				      <img alt="Image placeholder" src="/resources/images/pointRewardImage/coupon30.jpg" class="img-fluid mb-4"
				      	style="padding: 24px 16px 16px 16px">
				      <h4>숙소 30% 할인 쿠폰</h4>
				      <p><span>3000</span>P 교환하기</p>
				    </div>
				    <div class="col-sm-4 rewardCard">
				      <img alt="Image placeholder" src="/resources/images/pointRewardImage/coupon40.jpg" class="img-fluid mb-4"
				      	style="padding: 24px 16px 16px 16px">
				      <h4>숙소 40% 할인 쿠폰</h4>
				      <p><span>4000</span>P 교환하기</p><br>
				    </div>
				    <div class="col-sm-4 rewardCard">
				      <img alt="Image placeholder" src="/resources/images/pointRewardImage/coupon50.jpg" class="img-fluid mb-4"
				      	style="padding: 24px 16px 16px 16px">
				      <h4>숙소 50% 할인 쿠폰</h4>
				      <p><span>5000</span>P 교환하기</p><br>
				    </div>
				  </div>
				  
				  <h2 style="padding-top: 48px; padding-bottom: 48px">카페 할인 쿠폰</h2>
				  <div class="row">
				    <div class="col-sm-4 rewardCard">
				      <img alt="Image placeholder" src="/resources/images/pointRewardImage/coupon30.jpg" class="img-fluid mb-4"
				      	style="padding: 24px 16px 16px 16px">
				      <h4>카페 30% 할인 쿠폰</h4>
				      <p><span>3000</span>P 교환하기</p>
				    </div>
				    <div class="col-sm-4 rewardCard">
				      <img alt="Image placeholder" src="/resources/images/pointRewardImage/coupon40.jpg" class="img-fluid mb-4"
				      	style="padding: 24px 16px 16px 16px">
				      <h4>카페 40% 할인 쿠폰</h4>
				      <p><span>4000</span>P 교환하기</p><br>
				    </div>
				    <div class="col-sm-4 rewardCard">
				      <img alt="Image placeholder" src="/resources/images/pointRewardImage/coupon50.jpg" class="img-fluid mb-4"
				      	style="padding: 24px 16px 16px 16px">
				      <h4>카페 50% 할인 쿠폰</h4>
				      <p><span>5000</span>P 교환하기</p><br>
				    </div>
				  </div>
              </div>
            </div>
          </div> <!-- .col-md-16 -->

        </div>
      </div>
    </section> <!-- .section -->
    
    
    <!-- 페이지에 표시 되지 않는 내용 -->
	
	<!-- 유저 정보 보관용 form -->
	<!-- 스크립트에서 사용 -->
		<input type="hidden" name="userid" id="userid" value="${userVo.userid}">
		<input type="hidden" name="upw" id="updateUpw" value="${userVo.upw}">
		<input type="hidden" name="unickname" id="updateUnickname" value="${userVo.unickname}">
		<input type="hidden" name="upoint" value="${userVo.upoint}">
		<input type="hidden" name="uimg" id="updateUimg" value="${userVo.uimg}">
		<input type="hidden" name="uemail" id="uemail" value="${userVo.uemail}">
		<input type="hidden" name="signupfrom" value="${userVo.signupfrom}">
		<input type="hidden" name="joindate" value="${userVo.joindate}">
		<input type="hidden" name="verified" id="verified" value="${userVo.verified}">
	<!-- //유저 정보 보관용 form -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>