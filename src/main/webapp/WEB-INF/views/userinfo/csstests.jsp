<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/menu.jsp" %>
<style>
	html, body {
		background-color: gray;
	}
</style>
<body>
    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        
        	<div class="col-md-3 sidebar ftco-animate">
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>내 정보</h3>
                <li><a href="#">작성한 게시글 <span>(게시글 수)</span></a></li>
                <li><a href="#">내 댓글 <span>(댓글 수)</span></a></li>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>내 정보 수정하기</h3>
              <input type="submit" value="버튼 예제" class="btn py-3 px-4 btn-primary">
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>이메일 본인확인</h3>
              <p>확인되지 않음 (확인되면 해당 이메일 이곳에 작성, 본인인증 버튼 hide();)</p>
              <input type="submit" value="본인인증 하기" class="btn py-3 px-4 btn-primary">
            </div>
          </div> <!-- .col-md-3 -->
        
          <div class="col-md-9 ftco-animate">
            <div class="about-author d-flex p-5 bg-light">
              <div class="bio align-self-md-center mr-5">
                <img src="/resources/images/person_1.jpg" alt="Image placeholder" class="img-fluid mb-4">
              </div>
              <div class="desc align-self-md-center">
                <h3>~~~님의 마이페이지</h3>
                <p>사용자 정보 여기에 호로록 적으세요 --적은 글자 수로 인한 사진 확대 방지----적은 글자 수로 인한 사진 확대 방지----적은 글자 수로 인한 사진 확대 방지----적은 글자 수로 인한 사진 확대 방지----적은 글자 수로 인한 사진 확대 방지----적은 글자 수로 인한 사진 확대 방지--</p>
              </div>
            </div>

            <div class="pt-5 mt-5">
              <h3 class="mb-5">내 게시물 미리보기</h3>
              <ul class="comment-list">
                <li class="comment">
                  <div class="comment-body">
                    <h3>게시물 제목 예제</h3>
                    <div class="meta">작성 일자</div>
                    <p>좋아요 갯수</p>
                    <p>조회수</p>
                    </div>
                </li>
              </ul>
            </div>
            
            <div class="pt-5 mt-5">
              <h3 class="mb-5">내 댓글 미리보기</h3>
              <ul class="comment-list">
                <li class="comment">
                  <div class="comment-body">
                    <h3>댓글 내용 예제</h3>
                    <div class="meta">작성 일자</div>
                    <p>댓글 작성된 게시물 제목</p>
                  </div>
                </li>
              </ul>
            </div>
          </div> <!-- .col-md-8 -->

        </div>
      </div>
    </section> <!-- .section -->

    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">dirEngine</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Information</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Service</a></li>
                <li><a href="#" class="py-2 d-block">Terms and Conditions</a></li>
                <li><a href="#" class="py-2 d-block">Become a partner</a></li>
                <li><a href="#" class="py-2 d-block">Best Price Guarantee</a></li>
                <li><a href="#" class="py-2 d-block">Privacy and Policy</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Customer Support</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">FAQ</a></li>
                <li><a href="#" class="py-2 d-block">Payment Option</a></li>
                <li><a href="#" class="py-2 d-block">Booking Tips</a></li>
                <li><a href="#" class="py-2 d-block">How it works</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>