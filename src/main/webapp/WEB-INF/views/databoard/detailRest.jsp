<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!-- menu -->
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
<!-- END menu -->

<script>
// 댓글 여부 체크
function hasChildReply(rno) {
	$.get("/userReply/checkDelete/" + rno, function(hasReply) {
		if (hasReply == "true") {
			return true;
		} else {
			return false;
		}
	});
}

// 댓글창 보기
function showReply(){
	$("#reply").css('display', 'block')
	$("#replyFlag").attr("onClick", "hideReply()")
}

// 댓글창 숨기기 
function hideReply(){
	$("#reply").css('display', 'none')
	$("#replyFlag").attr("onClick", "showReply()")
} 

// 댓글 리스트 가져오기
function getReplyList(){
	const bno = "${getFoodInfo.bno}";
	$.get("/reply/restList?bno=" + bno, function(rData){
		$.each(rData, function(i, item){
			$(".replyElem").remove();
			
			var status = "default";
			$.get("/reply/checkChildRestReply/" + rData[i].rno, function(hasReply){
				if(rData[i].delete_yn == "Y" && hasReply){
					status = "deleted";
				} else if(rData[i].delete_yn == "Y" && !hasReply){
					status = "skip";
				}
			});
			setTimeout(function(){
				if(status == "default" || status == "deleted"){
					let reply = null;
					if(rData[i].rlevel == 1){
						reply = $("#rplyUl").clone();
					} else {
						reply = $("#replyLi").clone();
					}
					reply.removeAttr("id").addClass("replyElem");
					
					const div = reply.find("div").eq(1);
					div.find("h3").text(rData[i].replyer);
					
					const dateDiv = div.find("div").eq(0);
					if(rData[i].updatedate != null){
						if(isSameDate(rData[i].updatedate)){
							dateDiv.text(getTime(rData[i].updatedate));
						} else {
							dateDiv.text(getDate(rData[i].updatedate));
						}
					} else {
						if(isSameDate(rData[i].regdate)){
							dateDiv.text(getTime(rData[i].regdate));
						} else {
							dateDiv.text(getDate(rData[i].regdate));
						}
					}
					if(rData[i].unickname != null){
						const span = div.find("span").eq(0);
						span.show();
						span.text("@" + rData[i].unickname + " ");
					}
					div.find("span").eq(1).text(rData[i].replytext);
					div.find("p > a").attr("data-rno", rData[i].rno);
					
					if(status == "deleted"){
						div.find("span").eq(1).text("---------- 삭제된 댓글입니다. ----------");
						div.find("p").hide();
						div.find("div").eq(0).remove();
						div.find("h3").remove();
						div.prev().find("img").remove();
					}
					reply.show();
					$("replyList").append(reply);
				}
			}, 600);
		});
	});
}

getReplyList();

// 새댓글 쓰기
$("#btnReplyWrite").click(function(){
	const replytext = $("#replytext").val().trim();
	insertReply(replytext, 0, 0, null, "newReply");
	$("#replytext").val("");
});

// 대댓글 쓰기
$("#replyList").on("click", "#btnReplyWrite", function(){
	const replyInput = $(this).parent().prev().find("input");
	const replytext = replyInput.val().trim();
	const rno = $(this).closest("p").find("a").attr("data-rno");
	const replyer = $(this).closest("p").find("a").attr("data-replyer");
	const unickname = $(this).closest("li").find("h3").text();
	insertReply(replytext, 1, rno, unickname, "reReply");
	replyInput.val("");
});

//댓글 입력하기 - 공통 부분 함수
function insertReply(replytext, rlevel, rno, parentreplyer, type) {
	if (replytext != "") {
		const sData = {
				"bno" : bno,
				"replytext" : replytext,
				"rlevel" : rlevel,
				"rno" : rno,
				"unickname" : unickname
		};
		$.post("/reply/restInsert", sData, function(rData) {
			getReplyList();
		});
	}
}

//대댓글창 열기
$("#replyList").on("click", ".replyBtn", function(e) {
	e.preventDefault();
		$(".replyForm").remove();
		$(".replyElem").find("div").show();
		const replyForm = $("#replyForm").clone();
		replyForm.addClass("replyForm");
		replyForm.find("input").eq(1).attr("data-type", "reReply");
		$(this).parent().append(replyForm);
});

// 댓글 삭제
$("#replyList").on("click", ".deleteReply", function(e) {
	e.preventDefault();
	const that = $(this);
	const rno = that.attr("data-rno");
	$.ajax({
		"type" : "patch",
		"url" : "/userReply/delete",
		"data" : rno,
		"success" : function(rData) {
			that.closest(".replyElem").fadeOut(700);
		}
	});
});

// 댓글 수정창 열기
$("#replyList").on("click", ".updateReply", function(e) {
	e.preventDefault();
//		$("#updateFormCopy").remove();
	$(".replyForm").remove();
	$(".replyElem").find("div").show();
	const element = $(this).closest(".replyElem");
	const replyForm = $("#replyForm").clone();
	replyForm.addClass("replyForm");
//		replyForm.attr("id", "updateFormCopy");
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
		"url" : "/reply/restUpdate",
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


</script>

<div class="hero-wrap js-fullheight"
	style="background-image: url('../resources/images/bg_5.jpg');">
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
		<div style="text-align: right;">조회수&nbsp;${getFoodInfo.replycnt}</div>
		<div class="row">
			<div class="col-lg-3 sidebar"></div>
			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-12 ftco-animate">
						<div class="single-slider owl-carousel">
							<div class="item">
								<div class="hotel-img"
									style="background-image: url('${getFoodInfo.image}');"></div>
							</div>
							<div class="item">
								<div class="hotel-img"
									style="background-image: url('${getFoodInfo.thumbimage}');"></div>
							</div>
						</div>
					</div>
					<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
						<h2>${getFoodInfo.rname}</h2>
						<p class="rate mb-5">
							<span class="loc"><i class="icon-map"></i>${getFoodInfo.address}</span>
							<br>
							<span class="star">
								평점
								<i class="icon-star"></i>
								<i class="icon-star"></i> 
								<i class="icon-star"></i>
								<i class="icon-star"></i>
								<i class="icon-star-o"></i> 
							</span>
							<br>
							<span>
								${getFoodInfo.openhours}
							</span>
							<br>
							<span>
								대표메뉴&nbsp;${menu}
							</span>
							<br>
							<span id="contentReply">
								<a id="replyFlag" onclick="showReply()">댓글보기
								<span>(0)</span>
								</a>
							</span>
						</p>
						<p>${getFoodInfo.content}</p>
						<!-- 댓글 -->
						<div id="reply" style="display:none;">
							<!-- 댓글 입력 -->
							<form action="#" id="replyForm">
								<div class="row" style="margin-top:30px;">
									<div class="col-md-11">
										<input type="text" class="form-control" placeholder="내용을 입력하세요." 
										id="replytext">
									</div>
									<div class="col-md-1">
											<input type="button" value="댓글 쓰기" id="btnReplyWrite"
											class="btn py-3 px-4 btn-primary" style="border: none;"
											data-type="newReply">
<!-- 										<button type="button" class="btn btn-sm btn-primary" -->
<!-- 											id="btnReplyWrite" onclick="ReplyWrite()">입력</button> -->
									</div>
								</div>
							</form>
							<div class="pt-5 mt-5">
				              <h3 class="mb-5">${getFoodInfo.replycnt} Comments</h3>
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
				              <!-- END comment-list -->
				            </div>

						<!-- END 댓글 -->
					</div>
					
					<!-- 좋아요 -->
					<!-- heart/heart1.png -->
					<div class="heart">
						<button style="background-color:transparent; border: none; " >
							<img alt="" src="../resources/images/heart/heart1.png" style=" width : 10%; height : 10%; border: none; " >
						</button> 
						<p> 좋아요 수 </p>
						<!-- <button style="background-color:transparent; border: none; display: none;" >
							<img alt="" src="../resources/images/heart/heart2.png" style=" width : 15px; height : 15px; border: none; ">
						</button> -->
					</div>
					
					<div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
						<h4 class="mb-4">다른 맛집 보기</h4>
						<div class="row">
							<c:forEach items="${recomendedFoodList}" var="foodVo">
								<div class="col-md-4">
									<div class="destination">
										<a href="hotel-single.html" class="img img-2"
											style="background-image: url('${foodVo.thumbimage}');"></a>
										<div class="text p-3">
											<div class="d-flex">
												<div class="one" style="width: calc(100%);">
													<h3>
														<a href="/databoard/detailRest">${foodVo.rname}</a><br>
														<a href="#" class="meta-chat"><span class="icon-chat"></span>${foodVo.replycnt}</a>
													</h3>
													<p class="rate">
														<i class="icon-star"></i> <i class="icon-star"></i> 
														<i class="icon-star"></i> <i class="icon-star"></i> 
														<i class="icon-star-o"></i> 
													</p>
												</div>
											</div>
											<span class="tag">${foodVo.address}</span>
											<div class="meta mb-3" >
												<div>
													<a href="#">Tel. ${foodVo.rnumber}</a>
												</div>
												<div>
													<a href="#">Open. ${foodVo.openhours}</a>
												</div>
												<div>
													<a href="#">${foodVo.menu}</a>
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