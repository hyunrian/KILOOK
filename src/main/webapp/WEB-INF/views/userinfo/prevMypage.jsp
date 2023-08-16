<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<script>
$(function(){
	
	// 유저 본인확인 상태 체크, 본인 확인 완료 시 버튼 숨김
	function checkVerified() {
		if ('${userVo.verified}' == 'T') {
			$("#btnVerify").css('display', 'none');
		}
	}
	checkVerified(); // 페이지를 열면 본인확인 체크 함수 실행

	// 유저 정보 수정 버튼(데이터 담아서 정보 수정 페이지로 이동)
 	$("#btnUserUpdate").click(function(){
		var form = $("#userVoForm");
		form.attr("action", "/userinfo/infoUpdate");
		form.submit();
	});
	
	// 유저 본인확인
	
	// !!--- 구현 필요 ---!!
	$("#btnVerify").click(function(){
		alert("구현 필요");
	});
	// !!--- 구현 필요 ---!!
	
});

</script>
</head>
<body>
	<!-- 현재 방식 - 내 정보를 전부 다른 페이지로 넘겨서 수정 후 돌려받는 방식 -->
	<!-- 희망 방식 - 표시된 내 정보들을 수정 가능한 input타입으로 변경한 뒤, 변경사항 저장 시 다시 div 타입으로 바꾸고 변경사항 저장 -->
	<h1>마이 페이지</h1>
	
	<div>유저 이미지 공간</div><br>
	<button>유저 이미지 변경</button>
	
	<div id="divUnickname">닉네임 : ${userVo.unickname}</div>
	<div id="divUpoint">소지 포인트 : ${userVo.upoint}</div>
	<div id="divVerified">본인확인 여부 : ${userVo.verified} <button id="btnVerify">본인 확인</button></div>
	<button id="btnUserUpdate">유저 정보 수정</button>
	
	<!-- 작성한 게시글 리스트 작성 -->
	<div>작성한 게시글 (${userBoardCount})</div>
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
						<th>좋아요</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${boardList}" var="boardDto">
					<tr>
						<td>${boardDto.bno}</td>
						<td>${boardDto.title}</td>
						<td>${boardDto.regdate}</td>
						<td>${boardDto.viewcnt}</td>
						<td>${boardDto.likecnt}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<nav>
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">&laquo;</a>
					</li>
					<c:forEach var="v" begin="1" end="5">
						<li class="page-item">
							<a class="page-link" href="#">${v}</a>
						</li>
					</c:forEach>
					<li class="page-item">
						<a class="page-link" href="#">&raquo;</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
	
	<!-- 작성한 댓글 리스트 작성, 어느 글에 달린 댓글인지 게시글 리스트를 가져오고, 그 하단에 댓글 내용 표시 -->
	<div>작성한 댓글 (${userReplyCount})</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>댓글 작성글 제목</th>
						<th>댓글 내용</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${replyList}" var="replyDto">
					<tr>
						<td>${replyDto.rno}</td>
						<td>${replyDto.title}</td>
						<td>${replyDto.replytext}</td>
						<td>${replyDto.regdate}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<nav>
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">&laquo;</a>
					</li>
					<c:forEach var="v" begin="1" end="5">
						<li class="page-item">
							<a class="page-link" href="#">${v}</a>
						</li>
					</c:forEach>
					<li class="page-item">
						<a class="page-link" href="#">&raquo;</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
	</div>
	
	
	<!-- 이하 페이지에 표시 되지 않는 내용 -->
	
	<!-- 유저 정보 보관용 form -->
	<!-- 정보 수정 시 전달될 데이터 -->
	<form id="userVoForm" method="post" action="/userinfo/infoUpdate">
		<input type="hidden" name="userid" value="${userVo.userid}">
		<input type="hidden" name="upw" value="${userVo.upw}">
		<input type="hidden" name="unickname" value="${userVo.unickname}">
		<input type="hidden" name="upoint" value="${userVo.upoint}">
		<input type="hidden" name="uimg" value="${userVo.uimg}">
		<input type="hidden" name="uemail" value="${userVo.uemail}">
		<input type="hidden" name="signupfrom" value="${userVo.signupfrom}">
		<input type="hidden" name="joindate" value="${userVo.joindate}">
		<input type="hidden" name="verified" value="${userVo.verified}">
	</form>
	<!-- //유저 정보 보관용 form -->
</body>
</html>