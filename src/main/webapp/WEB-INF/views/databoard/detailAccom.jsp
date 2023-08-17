<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!-- menu -->
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
<!-- END menu -->

<script>
	// 좋아요 하트 기능
	$(document).ready(function() {
	
		var bno = "${getAccomInfo.bno}";
		var likeImg = $("#likeImg");
		
		// 좋아요 페이지 유지
		var likeResult = "${likeMap.likeResult}";
		console.log("likeResult:", likeResult)
		var likeImg = $("#likeImg");
		
		if(likeResult == "true"){
			console.log("likeResult.true:", likeResult);
			$("#likeImg").attr("src", "../resources/images/heart/heart2.png");
		} else {
			console.log("likeResult.false:", likeResult);
			$("#likeImg").attr("src", "../resources/images/heart/heart1.png");
		}
		
		// 좋아요를 눌렀을 때
		$("#likeHeart").click(function(){
			var that = $(this);
			var url = "";
			if(likeResult == "true"){
				url = "/like/deleteAccomLike/${getAccomInfo.bno}";
			} else {
				url = "/like/addAccomLike/${getAccomInfo.bno}";
			}
			
			$.get(url, function(rData){
				if(rData == "true"){
					var likeCount = parseInt($("#likeCount").text());
					var img = "";
					if(likeResult == "true"){
						likeImg.attr("src", "../resources/images/heart/heart1.png"); 
						likeCount--;
						likeResult = "false";
					} else {
						likeImg.attr("src", "../resources/images/heart/heart2.png"); 
						likeCount++;
						likeResult = "true";
					}
					$("#likeCount").text(likeCount);
				}
			});
		});
	});
	
	// 댓글창 보기
	function showReply(){
		$("#reply").css('display', 'block')
		$("#replyFlag").attr("onClick", "hideReply()")
	}

	// 댓글 여부 체크
	function hasChildReply(rno) {
		$.get("/reply/checkChildAccomReply/" + rno, function(hasReply) {
			if (hasReply == "true") {
				return true;
			} else {
				return false;
			}
		})
	}

	// 댓글창 숨기기 
	function hideReply(){
		$("#reply").css('display', 'none')
		$("#replyFlag").attr("onClick", "showReply()")
	} 

	// 댓글 리스트 가져오기
	function getReplyList(){

		const bno = "${getAccomInfo.bno}";
		$.get("/reply/accomList?bno=" + bno, function(rData){
			console.log(`rdata`)
			console.log(rData)
			console.log(`rdata`)
			$.each(rData, function(i, item){
				$(".replyElem").remove();
				var status = "default";
				$.get("/reply/checkChildAccomReply/" + item.rno, function(hasReply){
					if(item.delete_yn == "Y" && hasReply){
						status = "deleted";
					} else if(item.delete_yn == "Y" && !hasReply){
						status = "skip";
					}
				});
				setTimeout(function(){
					if(status == "default" || status == "deleted"){
						let reply = null;
						if(item.rlevel == 1){
							reply = $("#replyUl").clone();
						} else {
							reply = $("#replyLi").clone();
						}
						reply.removeAttr("id").addClass("replyElem");
						
						const div = reply.find("div").eq(1);
						div.find("h3").text(item.replyer);
						
						const dateDiv = div.find("div").eq(0);
						if(item.updatedate != null){
							if(isSameDate(item.updatedate)){
								dateDiv.text(getTime(item.updatedate));
							} else {
								dateDiv.text(getDate(item.updatedate));
							}
						} else {
							if(isSameDate(item.regdate)){
								dateDiv.text(getTime(item.regdate));
							} else {
								dateDiv.text(getDate(item.regdate));
							}
						}
						if(item.unickname != null){
							const span = div.find("span").eq(0);
							span.show();
							span.text("@" + item.unickname + " ");
						}
						div.find("span").eq(1).text(item.replytext);
						div.find("p > a").attr("data-rno", item.rno);
						
						if(status == "deleted"){
							div.find("span").eq(1).text("---------- 삭제된 댓글입니다. ----------");
							div.find("p").hide();
							div.find("div").eq(0).remove();
							div.find("h3").remove();
							div.prev().find("img").remove();
						}
						reply.show();
						$("#replyList").append(reply);
					}
				}, 600);
			});
		});
	}

	function btnReplyCommentWrite(rno){
		
		const replytext = $("#replytext").val().trim();
		const replyObject = {
			replytext : replytext,
			rlevel : 1,
			rno : rno,
			parentreplyer : null,
			type : "newReply",
			bno : "${getAccomInfo.bno}"
		}
		debugger;
		insertReply(replyObject);
		
		$("#replytext").val(""); 
	}

	$(window).on("load", function() {
		getReplyList();
		// 대댓글 쓰기
		$("#btnReplyWrite").on("click",function(){
			
			const replytext = $("#replytext").val().trim();
			const replyObject = {
				replytext : replytext,
				rlevel : 0,
				rno : 0,
				parentreplyer : null,
				type : "newReply",
				bno : "${getAccomInfo.bno}"
			}
			
			insertReply(replyObject);
			
			$("#replytext").val(""); 
		}); 
		
		
		//대댓글창 열기
		$("#replyList").on("click", ".replyBtn", function(e) {
			e.preventDefault();
				$(".replyForm").remove();
				$(".replyElem").find("div").show();
				const replyForm = $("#replyForm").clone();
				replyForm.addClass("replyForm");
				replyForm.find("input").eq(1).attr("data-type", "reReply");
				const rno = $(this).attr("data-rno");
				console.log(`rno`)
				console.log(rno)
				console.log(`rno`)
				replyForm.find("input").eq(1).attr("onClick", `btnReplyCommentWrite(\${rno})`);
				
				$(this).parent().append(replyForm);
		});

		// 댓글 삭제
		$("#replyList").on("click", ".deleteReply", function(e) {
			e.preventDefault();
			const that = $(this);
			const rno = that.attr("data-rno");
			$.ajax({
				"type" : "patch",
				"url" : "/reply/accomDelete",
				"data" : rno,
				"success" : function(rData) {
					that.closest(".replyElem").fadeOut(700);
				}
			});
		});

		// 댓글 수정창 열기
		$("#replyList").on("click", ".updateReply", function(e) {
			e.preventDefault();
//				$("#updateFormCopy").remove();
			$(".replyForm").remove();
			$(".replyElem").find("div").show();
			const element = $(this).closest(".replyElem");
			const replyForm = $("#replyForm").clone();
			replyForm.addClass("replyForm");
//				replyForm.attr("id", "updateFormCopy");
			replyForm.attr("style", "margin-top: 30px; margin-bottom: 80px;");
			const replytext = element.find("span").eq(1).text();
			replyForm.find("#replytext").val(replytext);
			const rno = $(this).attr("data-rno");
			replyForm.find("#btnReplyWrite").hide();		
			replyForm.find("#replyUpdateBtn").show().attr("data-rno", rno);
			element.find("div").hide();
			element.append(replyForm);
		});
		
		// 댓글 수정
		$("#replyList").on("click", "#replyUpdateBtn", function() {
			const that = $(this);
			const replytext = $(this).parent().prev().find("input").val().trim();
			const sData = {
					"rno" : $(this).attr("data-rno"),
					"replytext" : replytext
			};
			$.ajax ({
				"type" : "patch",
				"url" : "/reply/accomUpdate",
				"contentType" : "application/json",
				"data" : JSON.stringify(sData),
				"success" : function(rData) {
					const element = that.closest(".replyElem");
					element.find("span").eq(1).text(replytext);
					element.find("div").fadeIn(700);
					element.find(".replyForm").remove();
					element.find("div").eq(1).find("div").text(getTime(new Date()));
				}
			});
		});
		
	}) 

	//댓글 입력하기 - 공통 부분 함수
	function insertReply(replyObject) {

			if (replyObject != "") {
				const sData = {
					"bno" : replyObject?.bno,
					"replytext" : replyObject?.replytext,
					"rlevel" : replyObject?.rlevel,
					"rno" : replyObject?.rno,
					"unickname" : replyObject?.unickname ?? "test",
				};
				
				$.post("/reply/accomInsert", sData, function(rData) {
					getReplyList();
				});
			}
		} 
	
	
	
</script>

<div style="background-color: #000000; width: 100%; height: 90px;">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
			data-scrollax-parent="true">
			<div class="col-md-9 ftco-animate text-center"
				data-scrollax=" properties: { translateY: '70%' }">
				<p class="breadcrumbs"
					data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
					<span class="mr-2"><a href="index.html">Home</a></span> <span
						class="mr-2"><a href="hotel.html">Hotel</a></span> <span>Hotel
						Single</span>
				</p>
				<h1 class="mb-3 bread"
					data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Hotels
					Details</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section ftco-degree-bg">
	<div class="container">
		<div style="text-align: right;">조회수&nbsp;${getAccomInfo.areplycnt}</div>
		<div class="row">
			<div class="col-lg-3 sidebar"></div>
			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-12 ftco-animate">
						<div class="single-slider owl-carousel">
							<div class="item">
								<div class="hotel-img"
									style="background-image: url('..${getAccomInfo.image}.jpg');"></div>
							</div>
							<div class="item">
								<div class="hotel-img"
									style="background-image: url('..${getAccomInfo.image}.jpg');"></div>
							</div>
						</div>
					</div>
					<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
						<h2>${getAccomInfo.aname}</h2>
						<p class="rate mb-5">
							<span class="loc"><i class="icon-map"></i>${getAccomInfo.address} ${getAccomInfo.addressdetail}</span>
							<br>
							<span>
								전화번호:&nbsp;&nbsp;${getAccomInfo.anumber}
							</span>
							<br>
							<span>
								홈페이지:&nbsp;&nbsp;${getAccomInfo.url}
							</span>
							<br>
							<span id="contentReply">
								<a id="replyFlag" onclick="showReply()">댓글보기
									<span>(0)</span>
								</a>
							</span>
						</p>
<%-- 						<p>${getFoodInfo.content}</p> --%>
						
					<!-- 좋아요 -->
					<!-- heart/heart1.png -->
					<div class="heart">
						<button style="background-color:transparent; border: none; " id="likeHeart">
							<img id="likeImg" alt="" src="../resources/images/heart/heart1.png" style=" width : 10%; height : 10%; border: none; cursor:pointer"  >
						</button> 
						<p id="likeCount" style="font-size:20px; ">${likeMap.likeCount}</p>
					</div>
						
						<!-- 댓글 -->
						<div id="reply" style="display: none;">
							
							<div class="pt-5 mt-5">
				              <h3 class="mb-5">${getAccomInfo.areplycnt} Comments</h3>
							  <!-- 댓글목록 -->
				              <ul class="comment-list" id="replyList">
				                  <ul class="children" id="replyUl">
				                    <li class="comment" id="replyLi">
				                      <div class="vcard bio">
				                        <img src="../resources/images/person_1.jpg" alt="Image placeholder">
				                      </div>
				                      <div class="comment-body">
				                        <h3>작성자</h3>
				                        <div class="meta">날짜</div>
				                        <span style="font-weight: bold; display: none;">@원댓글작성자</span>
				                        <span>내용</span>
				                        <p style="text-align: right;">
										<a href="#" class="reply updateReply">수정</a>
										<a href="#" class="reply deleteReply">삭제</a>
										<a href="#" class="reply replyBtn">답댓글</a>
										</p><br>
				                      </div>
				                    </li>
				                  </ul>
				              </ul>
				              
				              <!-- 댓글 입력 -->
							<form action="#" id="replyForm">
								<div class="row" style="margin-top:50px; margin-bottom: 80px;">
									<div class="col-md-11">
										<input type="text" class="form-control" placeholder="내용을 입력하세요." 
										id="replytext">
									</div>
									<div class="col-md-1">
											<input type="button" value="댓글 쓰기"  
											class="btn py-3 px-4 btn-primary" style="border: none;"
											data-type="newReply" id="btnReplyWrite">
<!-- 										<button type="button" class="btn btn-sm btn-primary" -->
<!-- 											id="btnReplyWrite" onclick="ReplyWrite()">입력</button> -->
									</div>
								</div>
							</form>
				              <!-- END comment-list -->
				            </div>

						<!-- END 댓글 -->
					</div>
					
					
					
					<div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
						<h4 class="mb-4">다른 숙소 보기</h4>
						<div class="row">
							<c:forEach items="${recomendedAccomList}" var="accomVo">
								<div class="col-md-4">
									<div class="destination">
										<a href="/databoard/getAccomInfo?bno=${accomVo.bno}" class="img img-2"
											style="background-image: url('..${accomVo.image}.jpg');"></a>
										<div class="meta p-3">
											<div class="d-flex">
												<div class="one" style="width: calc(100%);">
													<h3>
														<a href="/databoard/getAccomInfo?bno=${accomVo.bno}">${accomVo.aname}</a><br>
														<a href="#" class="meta-chat"><span class="icon-chat"></span>${accomVo.areplycnt}</a>
													</h3>
													<p class="rate">
														<i class="icon-star"></i> <i class="icon-star"></i> 
														<i class="icon-star"></i> <i class="icon-star"></i> 
														<i class="icon-star-o"></i> 
													</p>
												</div>
											</div>
											<span class="tag">${accomVo.address} ${accomVo.addressdetail}</span>
											<div class="meta mb-3" >
												<div>
													Tel. ${accomVo.anumber}
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke="#eeeeee" />
		<circle class="path" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
</div>