<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
	.parent {
	  position: relative;
	}
	
	.clickable {
		cursor: pointer;
		font-size: 40pt;
	}
	
	#heart {
	  position: absolute; 
	  left: 43%; 
	  top: 50%; 
	  transform: translate(-50%, -50%);
	}
	
	#share {
	  position: absolute; 
	  left: 57%; 
	  top: 50%; 
	  transform: translate(-50%, -50%);
	}
	
	#heartCount {
		position: absolute; 
		left: 43%; 
		top: 100%; 
		transform: translate(-50%, -50%);
		margin-top: 40px;
	}
	
	#shareText {
		position: absolute; 
		left: 57%; 
		top: 100%; 
		transform: translate(-50%, -50%);
		margin-top: 40px;
	}
</style>
<script>
$(function() {
	
	// 현재 페이지로 이동하면 자동 스크롤 이동
	$("#dateSpan").text(getDate("${userBoardVo.regdate}"));
	location.href="/userboard/detail?bno=${userBoardVo.bno}#pageBegin";
	
	// 좋아요
	let heartStatus = "off";
	let heartCount = parseInt($("#heartCount").text());
	
	$("#heart").click(function() {
		
		let sData = {
				"unickname" : "tester", // 나중에 session에 넣은 loginInfo로 수정 필요
				"bno" : "${userBoardVo.bno}"
		}
		
		$.get("/like/liked", sData, function(rData) {
			if (rData == true) { // 사용자가 해당 글을 이미 좋아요한 경우
				$.ajax({
					"type" : "delete",
					"url" : "/like/cancel/${userBoardVo.bno}/tester",
					"success" : function(rData) {
						console.log("ajax - rData:", rData);
						// 좋아요 기능구현 완료. view 부분부터 다시 작성하면 됨
					}
				});
			} else { // 사용자가 해당 글을 아직 좋아요하지 않은 경우
				$.post("/like/add", sData, function(rData) {
					console.log("post - rData:", rData);
				});
				
			}
		});
		
// 		$.post("/like/add", sData, function(rData) {
// 			if (rData == "SUCCESS") {
				
// 			}
// 		});
// 		if (heartStatus == "off") {
// 			$("#heartEmpty").hide();
// 			$("#heartFull").show();
// 			heartStatus = "on";
// 			$("#heartCount").text(heartCount + 1);
// 		} else if(heartStatus == "on") {
// 			$("#heartFull").hide();
// 			$("#heartEmpty").show();
// 			heartStatus = "off";
// 			$("#heartCount").text(heartCount - 1);
// 		}
	});
	
	// 댓글 가져오기
	function getReplyList() {
		
		$.get("/userReply/list?bno=${userBoardVo.bno}", function(rData) {
			$.each(rData, function(i, item) {
				let li = $("#replyLi").clone();
				let div = li.find("div").eq(1);
				div.find("h3").text(rData[i].replyer);
				
				// 작성일 또는 수정일이 오늘 날짜인 경우 시간으로 출력, 그렇지 않은 경우 날짜로 출력
				if (isSameDate(rData[i].regdate))
					div.find("div").text(getTime(rData[i].regdate));
				else 
					div.find("div").text(getDate(rData[i].regdate));
				div.find("p").eq(0).text(rData[i].replytext);
				li.show();
				$("#replyUl").append(li);
			});
		});
	}
	
	getReplyList();
	
});
</script>
<%@ include file="/WEB-INF/views/include/menu.jsp" %>
	
<div class="hero-wrap js-fullheight"
	style="background-image: url('/resources/images/bg_4.jpg');">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
			data-scrollax-parent="true">
			<div class="col-md-9 ftco-animate text-center"
				data-scrollax=" properties: { translateY: '70%' }">
				
				<h1 class="mb-3 bread"
					data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Tips
					&amp; Articles</h1>
			</div>
		</div>
	</div>
</div>

<div id="pageBegin"></div>
<section class="ftco-section ftco-degree-bg">
	<div class="container">
		<div class="row">
			<div class="col-md-8 ftco-animate">
				<h2 class="mb-3">${userBoardVo.title}</h2>
				<br>
				<div>
					<span> <i class="fa-solid fa-umbrella-beach"
						style="color: #2667cf; font-size: 2rem;"></i> &nbsp;&nbsp;
					</span>
					<span style="font-size: 14pt;">${userBoardVo.writer} &nbsp;&nbsp;&nbsp;</span>
					<span style="font-size: 10pt;" id="dateSpan">${userBoardVo.regdate}</span>
				</div>
				<br>
				<br>
				<p>${userBoardVo.content}</p>
				<div class="tag-widget post-tag-container mb-5 mt-5">
					<div class="tagcloud">
						<a class="tag-cloud-link">Life</a>
						<a class="tag-cloud-link">Sport</a>
						<a class="tag-cloud-link">Tech</a>
						<a class="tag-cloud-link">Travel</a>
					</div>
				</div>
				
				<!-- 게시글 좋아요, 공유하기 -->
				<div class="parent">
					<span id="heart" class="child">
						<i class="fa-regular fa-heart clickable" style="color: #eb1414;"
							id="heartEmpty"></i>
						<i class="fa-solid fa-heart clickable" style="color: #eb1414;
							display: none;" id="heartFull"></i>
					</span>
					<span id="share" class="child">
						<i class="fa-solid fa-square-share-nodes clickable" 
							style="color: #5CD1E5;"></i>
					</span>
				</div>
				<div class="parent">
					<span class="badge badge-light" style="font-size: 10pt;" id="heartCount">3</span>
					<span class="badge badge-light" style="font-size: 10pt;" id="shareText">Share</span>
				</div><br>

				<!-- 댓글 -->
				<div class="pt-5 mt-5">
					<h3 class="mb-5">${userBoardVo.replycnt} Comments</h3>
					<ul class="comment-list" id="replyUl" >
						<li class="comment" id="replyLi" style="display: none;"/>
							<div class="vcard bio">
								<img src="/resources/images/person_1.jpg"
									alt="Image placeholder">
							</div>
							<div class="comment-body">
								<h3>작성자</h3>
								<div class="meta" style="text-align: right;">날짜</div>
								<p>내용</p>
								<p>
									<a href="#" class="reply">Reply</a>
								</p><br>
							</div>
						</li>
					</ul>
					<!-- END comment-list -->

					<div class="comment-form-wrap pt-5">
						<h3 class="mb-5">Leave a comment</h3>
						<form action="#" class="p-5 bg-light">
							<div class="form-group">
								<label for="name">Name *</label> <input type="text"
									class="form-control" id="name">
							</div>
							<div class="form-group">
								<label for="email">Email *</label> <input type="email"
									class="form-control" id="email">
							</div>
							<div class="form-group">
								<label for="website">Website</label> <input type="url"
									class="form-control" id="website">
							</div>

							<div class="form-group">
								<label for="message">Message</label>
								<textarea name="" id="message" cols="30" rows="10"
									class="form-control"></textarea>
							</div>
							<div class="form-group">
								<input type="submit" value="Post Comment"
									class="btn py-3 px-4 btn-primary">
							</div>

						</form>
					</div>
				</div>

			</div>
			<!-- .col-md-8 -->
			<div class="col-md-4 sidebar ftco-animate">
				<div class="sidebar-box">
					<form action="#" class="search-form">
						<div class="form-group">
							<span class="icon fa fa-search"></span> <input type="text"
								class="form-control" placeholder="Type a keyword and hit enter">
						</div>
					</form>
				</div>
				<div class="sidebar-box ftco-animate">
					<div class="categories">
						<h3>Categories</h3>
						<li><a href="#">Tour <span>(12)</span></a></li>
						<li><a href="#">Hotel <span>(22)</span></a></li>
						<li><a href="#">Coffee <span>(37)</span></a></li>
						<li><a href="#">Drinks <span>(42)</span></a></li>
						<li><a href="#">Foods <span>(14)</span></a></li>
						<li><a href="#">Travel <span>(140)</span></a></li>
					</div>
				</div>

				<div class="sidebar-box ftco-animate">
					<h3>Recent Blog</h3>
					<div class="block-21 mb-4 d-flex">
						<a class="blog-img mr-4"
							style="background-image: url(/resources/images/image_1.jpg);"></a>
						<div class="text">
							<h3 class="heading">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
							<div class="meta">
								<div>
									<a href="#"><span class="icon-calendar"></span> July 12,
										2018</a>
								</div>
								<div>
									<a href="#"><span class="icon-person"></span> Admin</a>
								</div>
								<div>
									<a href="#"><span class="icon-chat"></span> 19</a>
								</div>
							</div>
						</div>
					</div>
					<div class="block-21 mb-4 d-flex">
						<a class="blog-img mr-4"
							style="background-image: url(/resources/images/image_2.jpg);"></a>
						<div class="text">
							<h3 class="heading">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
							<div class="meta">
								<div>
									<a href="#"><span class="icon-calendar"></span> July 12,
										2018</a>
								</div>
								<div>
									<a href="#"><span class="icon-person"></span> Admin</a>
								</div>
								<div>
									<a href="#"><span class="icon-chat"></span> 19</a>
								</div>
							</div>
						</div>
					</div>
					<div class="block-21 mb-4 d-flex">
						<a class="blog-img mr-4"
							style="background-image: url(/resources/images/image_3.jpg);"></a>
						<div class="text">
							<h3 class="heading">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
							<div class="meta">
								<div>
									<a href="#"><span class="icon-calendar"></span> July 12,
										2018</a>
								</div>
								<div>
									<a href="#"><span class="icon-person"></span> Admin</a>
								</div>
								<div>
									<a href="#"><span class="icon-chat"></span> 19</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="sidebar-box ftco-animate">
					<h3>Tag Cloud</h3>
					<div class="tagcloud">
						<a href="#" class="tag-cloud-link">dish</a> <a href="#"
							class="tag-cloud-link">menu</a> <a href="#"
							class="tag-cloud-link">food</a> <a href="#"
							class="tag-cloud-link">sweet</a> <a href="#"
							class="tag-cloud-link">tasty</a> <a href="#"
							class="tag-cloud-link">delicious</a> <a href="#"
							class="tag-cloud-link">desserts</a> <a href="#"
							class="tag-cloud-link">drinks</a>
					</div>
				</div>

				<div class="sidebar-box ftco-animate">
					<h3>Paragraph</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Ducimus itaque, autem necessitatibus voluptate quod mollitia
						delectus aut, sunt placeat nam vero culpa sapiente consectetur
						similique, inventore eos fugit cupiditate numquam!</p>
				</div>
			</div>

		</div>
	</div>
</section>
<!-- .section -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>