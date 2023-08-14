<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!-- menu -->
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
<!-- END menu -->

<script>


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
	$.get("/reply/restList/${getFoodInfo.bno}", function(rData){
		console.log("rData:", rData);
	});
}


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
							<div class="row" style="margin-top:30px;">
								<div class="col-md-11">
									<input type="text" class="form-control" placeholder="댓글내용"
										id="replytext">
								</div>
								
								<div class="col-md-1">
									<button type="button" class="btn btn-sm btn-primary"
										id="btnReplyWrite" onclick="ReplyWrite()">입력</button>
								</div>
							</div>
							
							<!-- 댓글 목록 -->
<!-- 							<div id="replyListDiv" class="row" style="margin-top:30px;  "> -->
<!-- 								<div class="col-md-12"> -->
<!-- 									<table class="table"> -->
<!-- 										<thead> -->
<!-- 											<tr> -->
<!-- 												<th>#</th> -->
<!-- 												<th>댓글 내용</th> -->
<!-- 												<th>작성자</th> -->
<!-- 												<th>작성일</th> -->
<!-- 												<th>수정일</th> -->
<!-- 												<th>수정</th> -->
<!-- 												<th>삭제</th> -->
<!-- 											</tr> -->
<!-- 										</thead> -->
<!-- 										<tbody id="replyList"> -->
<!-- 											<tr style="display:none"> -->
<!-- 												<td></td> -->
<!-- 												<td><span class="hideSpan"></span></td> -->
<!-- 												<td><span class="hideSpan"></span></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td><button type="button" class="btn btn-sm btn-warning btn-reply-update">수정</button> -->
<!-- 													<button type="button" class="btn btn-sm btn-primary btn-reply-updateFinish" -->
<!-- 														style="display:none">완료</button> -->
<!-- 													</td> -->
<!-- 												<td><button type="button" class="btn btn-sm btn-danger btn-reply-delete">삭제</button></td> -->
<!-- 											</tr> -->
											
<!-- 										</tbody> -->
<!-- 									</table> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

							<div class="pt-5 mt-5">
				              <h3 class="mb-5">6 Comments</h3>
				              <ul class="comment-list">
				                <li class="comment">
				                  <div class="vcard bio">
				                    <img src="../resources/images/person_1.jpg" alt="Image placeholder">
				                  </div>
				                  <div class="comment-body">
				                    <h3>John Doe</h3>
				                    <div class="meta">June 27, 2018 at 2:21pm</div>
				                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
				                    <p>
				                    	<a href="#" class="reply">수정</a>
				                    	<a href="#" class="reply">삭제</a>
				                    </p>
				                    <p></p>
				                  </div>
				                </li>
				
				                <li class="comment">
				                  <div class="vcard bio">
				                    <img src="../resources/images/person_1.jpg" alt="Image placeholder">
				                  </div>
				                  <div class="comment-body">
				                    <h3>John Doe</h3>
				                    <div class="meta">June 27, 2018 at 2:21pm</div>
				                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
				                    <p><a href="#" class="reply">Reply</a></p>
				                  </div>
				
				                  <ul class="children">
				                    <li class="comment">
				                      <div class="vcard bio">
				                        <img src="../resources/images/person_1.jpg" alt="Image placeholder">
				                      </div>
				                      <div class="comment-body">
				                        <h3>John Doe</h3>
				                        <div class="meta">June 27, 2018 at 2:21pm</div>
				                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
				                        <p><a href="#" class="reply">Reply</a></p>
				                      </div>
				
				
				                      <ul class="children">
				                        <li class="comment">
				                          <div class="vcard bio">
				                            <img src="../resources/images/person_1.jpg" alt="Image placeholder">
				                          </div>
				                          <div class="comment-body">
				                            <h3>John Doe</h3>
				                            <div class="meta">June 27, 2018 at 2:21pm</div>
				                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
				                            <p><a href="#" class="reply">Reply</a></p>
				                          </div>
				
				                            <ul class="children">
				                              <li class="comment">
				                                <div class="vcard bio">
				                                  <img src="../resources/images/person_1.jpg" alt="Image placeholder">
				                                </div>
				                                <div class="comment-body">
				                                  <h3>John Doe</h3>
				                                  <div class="meta">June 27, 2018 at 2:21pm</div>
				                                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
				                                  <p><a href="#" class="reply">Reply</a></p>
				                                </div>
				                              </li>
				                            </ul>
				                        </li>
				                      </ul>
				                    </li>
				                  </ul>
				                </li>
				
				                <li class="comment">
				                  <div class="vcard bio">
				                    <img src="../resources/images/person_1.jpg" alt="Image placeholder">
				                  </div>
				                  <div class="comment-body">
				                    <h3>John Doe</h3>
				                    <div class="meta">June 27, 2018 at 2:21pm</div>
				                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
				                    <p><a href="#" class="reply">Reply</a></p>
				                  </div>
				                </li>
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