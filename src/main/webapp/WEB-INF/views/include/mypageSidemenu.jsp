<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-md-4 sidebar ftco-animate">
  <div class="sidebar-box ftco-animate">
    <div class="categories">
      <h3>내 정보</h3>
      <li><a href="/userInfo/mypost">작성한 게시글 <span>(${userBoardCount})</span></a></li>
      <li><a href="/userInfo/myreply">내 댓글 <span>(${userReplyCount})</span></a></li>
    </div>
  </div>

  <div class="sidebar-box ftco-animate">
    <h3>내 정보 수정하기</h3>
    <input type="button" id="btnUserUpdate" value="정보 수정" class="btn py-3 px-4 btn-primary">
  </div>

  <div class="sidebar-box ftco-animate">
    <h3>이메일 본인확인</h3>
    <p id="emailCheckMessage">확인되지 않음</p>
    <p id="verifiedEmail"></p>
    <form action="/userInfo/verifyMail" method="post">
    	  <input type="hidden" name="userid" value="${userVo.userid}"> <!-- 임시 데이터. loginInfo 에서 데이터 받아오기 가능해지면 삭제. -->
     <input type="email" name="uemail" id="uemail" placeholder="이메일 입력" style="margin-bottom: 10px;">
     <input type="submit" id="btnEmailVerify" value="본인인증 하기" class="btn py-3 px-4 btn-primary">
    </form>
  </div>
</div> <!-- .col-md-4 -->