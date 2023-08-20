<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<style>
@import
	url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css");

@import 
	url("https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css");

* {
	box-sizing: border-box;
}

body {
	font-family: "Montserrat", sans-serif;
	margin: 0;
	padding: 0;
}

.wrapper {
	width: 100%;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background: #ebecf0;
	overflow: hidden;
}

.container {
	border-radius: 10px;
	box-shadow: -5px -5px 10px #fff, 5px 5px 10px #babebc;
	position: absolute;
	width: 768px;
	min-height: 500px;
	overflow: hidden;
}

form{
	background: #ebecf0;
	display: flex;
	flex-direction: column;
	padding: 0 50px;
	height: 100%;
	justify-content: center;
 	align-items: center; 
 	text-align: center;
}

.input {
	background: #eee;
	padding: 16px;
	margin: 8px 0;
	width: 85%;
	border: 0;
	outline: none;
	border-radius: 20px;
	box-shadow: inset 7px 2px 10px #babebc, inset -5px -5px 12px #fff;
}

.inputSamll {
	background: #eee;
	padding: 11px;
	margin: 8px 0;
	width: 85%;
	border: 0;
	outline: none;
	border-radius: 20px;
	box-shadow: inset 7px 2px 10px #babebc, inset -5px -5px 12px #fff;
}

.btn {
	border-radius: 20px;
	border: none;
	outline: none;
	font-size: 12px;
	font-weight: bold;
	padding: 15px 45px;
	margin: 14px;
	letter-spacing: 1px;
	text-transform: uppercase;
	cursor: pointer;
	transition: transform 80ms ease-in;
}

.btnSmall {
	border-radius: 5px;
	border: none;
	outline: none;
	font-size: 12px;
	font-weight: bold;
	padding: 5px 5px;
	letter-spacing: 1px;
	text-transform: uppercase;
	cursor: pointer;
	transition: transform 80ms ease-in;
}

.form_btn {
	box-shadow: -5px -5px 10px #fff, 5px 5px 8px #babebc;
}

.form_btn:active {
	box-shadow: inset 1px 1px 2px #babebc, inset -1px -1px 2px #fff;
}

.overlay_btn {
	background-color: #00D8FF;
	color: #fff;
	box-shadow: -5px -5px 10px #90FFFF, 5px 5px 8px #006C93;
}

.log-in-container {
	position: absolute;
	left: 0;
	width: 50%;
	height: 100%;
	transition: all 0.5s;
}

.create-Account-container {
	position: absolute;
	left: 0;
	width: 50%;
	height: 100%;
	opacity: 0;
	transition: all 0.5s;
}

.overlay-left {
	display: flex;
	flex-direction: column;
	padding: 0 50px;
	justify-content: center;
	align-items: center;
	position: absolute;
	right: 0;
	width: 50%;
	height: 100%;
	opacity: 0;
	background-color: #00D8FF;
	color: #fff;
	transition: all 0.5s;
}

.overlay-right {
	display: flex;
	flex-direction: column;
	padding: 0 50px;
	justify-content: center;
	align-items: center;
	position: absolute;
	right: 0;
	width: 50%;
	height: 100%;
	background-color: #00D8FF;
	color: #fff;
	transition: all 0.5s;
}

.container.right-panel-active .log-in-container {
	transform: translateX(100%);
	opacity: 0;
}

.container.right-panel-active .create-Account-container {
	transform: translateX(100%);
	opacity: 1;
	z-index: 2;
}

.container.right-panel-active .overlay-right {
	transform: translateX(-100%);
	opacity: 0;
}

.container.right-panel-active .overlay-left {
	transform: translateX(-100%);
	opacity: 1;
	z-index: 2;
}

.social-links {
	margin: 20px 0;
}

form h1 {
	font-weight: bold;
	margin: 0;
	color: #000;
}

p {
	font-size: 16px;
	font-weight: bold;
	letter-spacing: 0.5px;
	margin: 20px 0 30px;
}

span {
	font-size: 12px;
	color: #000;
	letter-spacing: 0.5px;
	margin-bottom: 10px;
}

.social-links div {
	width: 40px;
	height: 40px;
	display: inline-flex;
	justify-content: center;
	align-items: center;
	margin: 0 5px;
	border-radius: 50%;
	box-shadow: -5px -5px 10px #fff, 5px 5px 8px #babebc;
	cursor: pointer;
}

.social-links a {
	color: #000;
}

.social-links div:active {
	box-shadow: inset 1px 1px 2px #babebc, inset -1px -1px 2px #fff;
}

.homeContainer {
	background: #ebecf0;
	margin-bottom: 600px;
	margin-right: 570px;
}

.btnHome {
	width: 200px;
	height: 50px;
	display: inline-flex;
	justify-content: center;
	align-items: center;
	margin: 0 5px;
	cursor: pointer;
}

.btnHome a {
	color: #000;
}

/* 유효성 검사시 호출되는 텍스트 */
.error{
    font-size: 12px;
	font-weight: bold;
    color: #f00;
    border-color: #f00;
}
.useable{
font-size: 12px;
	font-weight: bold;
    color: #008000;
    border-color: #008000;
}

/* 모달창 배경 */
.modal-background {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

/* 모달 내용 */
.modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.2);
}

/* 닫기 버튼 */
.modal-btn-x {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
}

.modal-btn-close {
	position: absolute;
	bottom: 10px;
	right: 10px;
	background-color: skyblue;
	color: white;
	padding: 5px 10px;
	margin-top: 5px;
	border-radius: 5px;
	cursor: pointer;
	border: none;
	font-weight: bold;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

<%
Boolean joinResult = (Boolean) session.getAttribute("joinResult");
%>

<!-- 네이버 로그인용 -->
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!-- 스크립트 시작 -->
<script>
var joinResult = <%= joinResult %>;

// 사용자 지정 메소드
// 글자수 제한 (아이디)
$.validator.addMethod("lengthCheckId", function(value, element) {
	  return this.optional(element) || /^.{4,15}$/.test(value);
	}, "**** 아이디는 4 ~ 15자 입니다 ****");

// 글자수 제한(닉네임)
$.validator.addMethod("lengthCheckNickName", function(value, element) {
	  return this.optional(element) || /^.{2,10}$/.test(value);
	}, "**** 닉네임은 2 ~ 10자 입니다 ****");

// 글자수 제한(비밀번호)
$.validator.addMethod("lengthCheckPw", function(value, element) {
	  return this.optional(element) || /^.{4,30}$/.test(value);
	}, "**** 비밀번호는 4 ~ 15자 입니다 ****");
	
// 글자 제한 (영문과 숫자만)
$.validator.addMethod("spellCheckId", function(value, element) {
	  return this.optional(element) || /^[A-Za-z0-9]+$/.test(value);
	}, "**** 아이디는 영문, 숫자만 가능합니다 ****");
	
// 글자 제한 (영문과 숫자, 한글만)
$.validator.addMethod("spellCheckNickName", function(value, element) {
	  return this.optional(element) || /^[A-Za-z0-9\uAC00-\uD7A3]+$/.test(value);
	}, "**** 닉네임은 영문, 숫자, 한글만 가능합니다 ****");
	
// 특수문자 제한
$.validator.addMethod("spellCheckSC", function(value, element) {
	  return this.optional(element) || /^[a-zA-Z0-9!@#$%_]*$/.test(value);
	}, "**** 특수문자는 !@#$%_만 사용 가능합니다 ****");

// 글자 제한 (영문+숫자+특수기호)
$.validator.addMethod("spellCheckPW", function(value, element) {
	  return this.optional(element) || /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%_])[A-Za-z\d!@#$%-_]+$/.test(value);
	}, "**** 영문, 숫자, 특수문자를 조합해야 합니다 ****");
	
	
$(function() {
// 로그인 유효성 검사
	const loginForm = $("#loginForm");
	loginForm.validate({
		rules: {                    // 유효성 검사 규칙
			userid: {				// 아이디 필드 (name="userid")
				required: true      // 필수 입력
			},
			upw: {     		        // 비밀번호 필드 (name="upw")
				required: true      // 필수 입력
			}
		},
		messages: {                 // 오류값 발생시 출력할 메시지 수동 지정
			userid: {
				required: "**** 아이디를 입력해 주세요 ****"
			},
			upw: {
				required: "**** 비밀번호를 입력해 주세요 ****"
			}
		}
	});
	
// 회원가입 유효성 검사
	const createForm = $("#createForm");
	var idDubMessage = "";
	var dataTest = "";
	createForm.validate({
		rules: {                    	// 유효성 검사 규칙
			userid: {					// 이름 필드 (name="userid")
				required: true,			// 필수 입력
				lengthCheckId: true,
										
				spellCheckId: true,
				// 실시간 유효성 체크(아이디)
				remote: {
                    url: "/loginUser/idDubCheck",
                    type: "post",
                    data: {
                        userid: function() {
                            return $("#createUserid").val();
                        }
                    }
                }
			},
			unickname: {     			// 비밀번호 필드 (name="unickname")
				required: true,			// 필수 입력
				lengthCheckNickName: true,
				spellCheckNickName: true,
				// 실시간 유효성 체크(닉네임)
				remote: {
                    url: "/loginUser/nickNameDubCheck",
                    type: "post",
                    data: {
                        userid: function() {
                            return $("#createUnickName").val();
                        }
                    }
                }
			},
			upw: {     					// 비밀번호 필드 (name="upw")
				required: true,			// 필수 입력
				lengthCheckPw: true,
				spellCheckSC: true,
				spellCheckPW: true
			},
			upwCheck: {     			// 비밀번호 필드 (name="upwCheck")
				required: true,			// 필수 입력
				equalTo: "#createUpw"	// 해당 아이디와 값이 같아야함
			}
		},
		messages: {                 // 오류값 발생시 출력할 메시지 수동 지정
			userid: {
				required:		"**** 아이디를 입력해 주세요 ****",
				remote: 		"**** 중복된 아이디 입니다 ****"
			},
			unickname: {
				required:		"**** 닉네임을 입력해 주세요 ****",
				remote: 		"**** 중복된 닉네임 입니다 ****"
			},
			upw: {
				required:		"**** 비밀번호를 입력해 주세요 ****",
			},
			upwCheck: {
				required: 		"**** 비밀번호를 확인해 주세요 ****",
				equalTo: 		"**** 비밀번호가 일치하지 않습니다 ****"
			}
		}
	});
	
// 아이디 기억하기(cookie)
	//쿠키 값 가져오기
	function getCookie(name) {
		name = name + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(name);
		var value = '';
		if(start != -1){
			start += name.length;
			var end = cookieData.indexOf(';', start);
			if(end == -1){
				end = cookieData.length;
			}
			value = cookieData.substring(start, end);
		}
		return unescape(value);
	}

    // 쿠키 값을 설정하는 함수
    function setCookie(name, value, days) {
    	var expire = new Date();
        expire.setDate(expire.getDate() + days);
        value = escape(value);
        
        cookies = name + '=' + value + '; path=/loginUser ';
        if(typeof cDay != 'undefined') {
        	cookies += ';expires=' + expire.toGMTString() + ';';
        }
        document.cookie = cookies;
    }
	
    // 쿠키 삭제
    function deleteCookie(name) {
    	console.log("deleteCookie");
        document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/loginUser;';
    }
    
    const useCookieCheckbox = $("#useCookie");
    const useridInput = $("#userid");

    // 아이디 기억하기 체크박스가 변경될 때 처리
    useCookieCheckbox.change(function() {
    	
        if (!(this.checked)) {
        	deleteCookie("remUserid"); // 쿠키 삭제
        	useCookieCheckbox.attr('checked', 'false');
        } else {
        	useCookieCheckbox.removeAttr('checked');
        }
    });
    
    // 로그인시 아이디 쿠기 생성
    $("#btnLogin").click(function(){
    	console.log("clicked");
    	if (useCookieCheckbox.is(":checked")){
    		deleteCookie("remUserid"); // 쿠키 삭제
    		setCookie("remUserid", useridInput.val(), 3650); // 쿠키를 10년 동안 저장
    	}
    	$("#loginForm").submit();
    	
    });

    // 페이지 로드 시 쿠키 값을 가져와 아이디 필드에 채움
    const remUserid = getCookie("remUserid");
	if (remUserid) {
		useridInput.val(remUserid);
		useCookieCheckbox.prop("checked", true);
	}
	
	// 로고 이미지 변경
	var defaultLogo = $('#homeLogo').attr("src"); // 기본 로고가 있는곳
	  
    $(".btnHome").mouseenter(function() {
      $("#homeLogo").attr("src", "/resources/images/logo/logo4.png"); // 새 이미지로 변경
    }).mouseleave(function() {
      $("#homeLogo").attr("src", defaultLogo); // 원래 이미지로 복원
    });
	
	// 엔터로 로그인 폼 서브밋
    $("#loginForm").keypress(function(event) {
        if (event.which === 13) { // 13은 Enter 키의 키
        	event.preventDefault();
            $(this).submit();
        }
    });
	
	// 회원가입 엔터키 막기
    $("#createForm").keypress(function(event) {
        if (event.which === 13) { // 13은 Enter 키의 키
        	event.preventDefault();
        }
    });
	
	
	// 여기부터 모달창
	if (joinResult != null){
		if (joinResult == true) {
			$("#modalTitle").text("회원가입 성공");
			$("#modalContext_1").text("끼룩에 오신것을 환영합니다!");
			$("#modalContext_2").text("더 많은 서비스를 이용 하시려면 이메일 인증이 필요 합니다.");
		} else if (joinResult == false) {
			$("#modalTitle").text("회원가입 실패");
			$("#modalContext_1").text("회원가입에 실패하였습니다.");
			$("#modalContext_2").text("다시 한번 시도해 주세요");
		};
		$("#modalBackground").fadeIn();
	}
	
	$(".close-button-Modal").click(function () {
		$("#modalBackground").fadeOut();
	});
	
	$("#modalBackground").click(function (event) {
		if (event.target === this) {
			$("#modalBackground").fadeOut();
		}
	});
});
</script>
<!-- 스크립트 끝 -->

<body>
    <!-- 홈 버튼(로고) -->
	<div class="wrapper">
		<div class="homeContainer" onmouseover="changeLogo()">
			<div class="btnHome">
				<a href="/">
					<img id = "homeLogo"
						style="	max-width: 160px;
									height: auto;
									object-fit: cover;" 
						alt="home" src="/resources/images/logo/logo1.png">
				</a>
			</div>
		</div>
		<div class="container">
			<!-- 회원가입 폼 -->
			<div class="create-Account-container">
				<form id="createForm" action="/loginUser/join" method="post">
					<h1>회원가입</h1>
					<input class="inputSamll" type="text" placeholder="아이디"
						id="createUserid" name="userid" required>
					<div id="useridAble" style="display: none;">
						<label class="useable">**** 사용 가능한 아이디 입니다 ****</label>
					</div>
					<input class="inputSamll" type="text" placeholder="닉네임"
						id="createUnickName" name="unickname" required>
					<input class="inputSamll" type="password" placeholder="비밀번호"
						id="createUpw" name="upw" required>
					<input class="inputSamll" type="password" placeholder="비밀번호 확인"
						id="createUpwCheck" name="upwCheck" required>
					<button type="submit" class="btn form_btn">확인</button>
				</form>
			</div>
			<!-- 로그인 폼 -->
			<div class="log-in-container">
				<form id="loginForm" action="/loginUser/login" method="post">
					<h1>소셜 로그인</h1>
					<div class="social-links">
					<%
						String clientId = "Ff68RrCXYQ06kTgurgWY";//애플리케이션 클라이언트 아이디값";
						String redirectURI = URLEncoder.encode("http://localhost/loginUser/naverCallback", "UTF-8");
						SecureRandom random = new SecureRandom();
						String state = new BigInteger(130, random).toString();
						String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
							+ "&client_id=" + clientId
							+ "&redirect_uri=" + redirectURI
							+ "&state=" + state;
						session.setAttribute("state", state);
 					%>
						<div>
							<a href="<%=apiURL%>"><i class="xi-naver" aria-hidden="true"></i></a>
						</div>
						<div>
							<a href="#"><i class="xi-kakaotalk" aria-hidden="true"></i></a>
						</div>
						<div>
							<a href="#"><i class="fa fa-google" aria-hidden="true"></i></a>
						</div>
					</div>
					<span>----- 또는 끼룩 계정으로 로그인 -----</span> 
					<input class="input" type="text" placeholder="아이디"
						id="userid" name="userid" required>
					<input class="input" type="password" placeholder="비밀번호"
						id="upw" name="upw" required>
					<div>
						<input type="checkbox" class="form-check-input" 
	                        	id="useCookie" name="useCookie" >
						<label class="form-check-label" for="useCookie">아이디 기억하기</label>
					</div>
					<button id="btnLogin" type="button" class="btn form_btn">확인</button>
					<a href="/loginUser/findPassword" style="font-size: 10px; margin-top: 15px">비밀번호를 잊으셨나요?</a>
				</form>
			</div>
			<div class="overlay-container">
				<!-- 로그인 페이지로 전환 -->
				<div class="overlay-left">
					<h1>간편하게 로그인<br>할 수 있습니다!</h1>
					<p>로그인 후 더 많은 정보를 이용하세요!</p>
					<button id="logIn" class="btn overlay_btn">로그인 하기</button>
				</div>
				<!-- 회원가입 페이지로 전환 -->
				<div class="overlay-right">
					<h1>환영합니다!</h1>
					<p style="margin-bottom: 0px;">끼룩 계정을 만들어서</p>
					<p style="margin-top: 0px;">더 많은 여행 정보를 이용하세요!</p>
					<button id="createAccount" class="btn overlay_btn">회원가입</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 -->
	<div id="modalBackground" class="modal-background">
		<div class="modal-content">
			<span class="close-button-Modal modal-btn-x">&times;</span>
			<h2 id="modalTitle"></h2>
			<p id="modalContext_1"></p>
			<p id="modalContext_2"></p>
			<button class="close-button-Modal modal-btn-close">닫기</button>
		</div>
	</div>
</body>
<!-- 웹 페이지 이벤트용 스크립트(위치 이동 금지) -->
<script>
const createAcctBtn = document.getElementById("createAccount");
const logInBtn = document.getElementById("logIn");
const container = document.querySelector(".container");

createAcctBtn.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});
logInBtn.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
});

<%
	session.removeAttribute("joinResult");
%>
</script>
</html>