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

.inputMiddle {
	background: #eee;
	padding: 11px;
	margin: 8px 0;
	width: 65%;
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
	border-radius: 25px;
	box-shadow: -5px -5px 10px #fff, 5px 5px 8px #babebc;
	cursor: pointer;
}

.btnHome a {
	color: #000;
}

.btnHome:active {
	box-shadow: inset 1px 1px 2px #babebc, inset -1px -1px 2px #fff;
}

/* 유효성 검사시 호출되는 텍스트 */
.error{
    font-size: 12px;
	font-weight: bold;
    color: #f00;
    border-color: #f00;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

<!-- 스크립트 시작 -->
<script>
// 아이디, 닉네임 중복확인용 함수
var dubChckId = false;
var dubChckNickname = false;

// 사용자 지정 메소드
// 글자수 제한 (아이디)
jQuery.validator.addMethod("lengthCheckId", function(value, element) {
	  return this.optional(element) || /^.{0,15}$/.test(value);
	}, "**** 아이디는 최대 15자 입니다 ****");

// 글자수 제한(닉네임)
jQuery.validator.addMethod("lengthCheckNickName", function(value, element) {
	  return this.optional(element) || /^.{2,30}$/.test(value);
	}, "**** 닉네임은 2 ~ 30자 입니다 ****");

// 글자수 제한(비밀번호)
jQuery.validator.addMethod("lengthCheckPw", function(value, element) {
	  return this.optional(element) || /^.{4,30}$/.test(value);
	}, "**** 비밀번호는 4 ~ 15자 입니다 ****");
	
// 글자 제한 (영문과 숫자만)
jQuery.validator.addMethod("spellCheckId", function(value, element) {
	  return this.optional(element) || /^[A-Za-z0-9]+$/.test(value);
	}, "**** 아이디는 영문, 숫자만 가능합니다 ****");
	
// 특수문자 제한
jQuery.validator.addMethod("spellCheckPW1", function(value, element) {
	  return this.optional(element) || /^[a-zA-Z0-9!@#$%_]*$/.test(value);
	}, "**** 특수문자는 !@#$%_만 사용 가능합니다 ****");

// 글자 제한 (영문+숫자+특수기호)
jQuery.validator.addMethod("spellCheckPW2", function(value, element) {
	  return this.optional(element) || /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%_])[A-Za-z\d!@#$%-_]+$/.test(value);
	}, "**** 영문, 숫자, !@#$%_를 조합해야 합니다 ****");
	
// 아이디 중복체크
jQuery.validator.addMethod("idDubChck", function(value, element) {
	  return dubChckId;
	}, "**** 아이디 중복 확인이 필요합니다 ****");

//닉네임 중복체크
jQuery.validator.addMethod("nicknameDubChck", function(value, element) {
	  return dubChckNickname;
	}, "**** 아이디 중복 확인이 필요합니다 ****");


// 로그인 유효성 검사
jQuery(function() {
	const loginForm = $("#loginForm");
	loginForm.validate({
		rules: {                    // 유효성 검사 규칙
			userid: {				// 아이디 필드 (name="userid")
				required: true,     // 필수 입력
			},
			upw: {     		        // 비밀번호 필드 (name="upw")
				required: true,     // 필수 입력
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
	createForm.validate({
		rules: {                    	// 유효성 검사 규칙
			userid: {					// 이름 필드 (name="userid")
				required: true,			// 필수 입력
				lengthCheckId: true,
										
// 원인을 알수 없는 이유로 작동이 되었다 안되었다 하기 때문에 아래 2코드는 사용하지 말것
// 	  			rangelength: [5, 15]	// 입력범위 0~15자 (위 코드로 대체함)
// 				maxlength: 15			// 최대 15자 까지 입력 가능
				
				spellCheckId: true,
				idDubChck: true
										
			},
			unickName: {     			// 비밀번호 필드 (name="unickName")
				required: true,			// 필수 입력
				lengthCheckNickName: true,
// 				rangelength: [0, 30]	
// 				maxlength: 30
				nicknameDubChck: true
			},
			upw: {     					// 비밀번호 필드 (name="upw")
				required: true,			// 필수 입력
				lengthCheckPw: true,
// 				rangelength: [0, 15]	
// 				maxlength: 15
				spellCheckPW1: true,
				spellCheckPW2: true
			},
			upwCheck: {     			// 비밀번호 필드 (name="upwCheck")
				required: true,			// 필수 입력
				equalTo: "#createUpw"	// 해당 아이디와 값이 같아야함
			}
		},
		messages: {                 // 오류값 발생시 출력할 메시지 수동 지정
			userid: {
				required:		"**** 아이디를 입력해 주세요 ****",
// 				rangelength:	"**** 아이디는 최대 15자 입니다 ****"
// 				maxlength:		"**** 아이디는 최대 15자 입니다 ****"
			},
			unickName: {
				required:		"**** 닉네임을 입력해 주세요 ****",
// 				rangelength:	"**** 닉네임은 최대 30자 입니다 ****"
// 				maxlength:		"**** 닉네임은 최대 30자 입니다 ****"
			},
			upw: {
				required:		"**** 비밀번호를 입력해 주세요 ****",
// 				rangelength:	"**** 비밀번호는 최대 15자 입니다 ****"
// 				maxlength:		"**** 비밀번호는 최대 15자 입니다 ****"
			},
			upwCheck: {
				required: 		"**** 비밀번호를 확인해 주세요 ****",
				equalTo: 		"**** 비밀번호가 일치하지 않습니다 ****"
			}
		},
		errorPlacement: function(error, element) {
			var elId = element.attr('id')
			if (elId == "createUserid" || elId == "createUnickName"){
				element.parent().after(error);
			} else {
				element.after(error);
			}
		}
	});
});
</script>
<!-- 스크립트 끝 -->

<body>
	<div class="wrapper">
		<div class="homeContainer">
			<div class="btnHome">
				<a href="/">
					<img style="	max-width: 160px;
									height: auto;
									object-fit: cover;" 
						alt="home" src="/resources/images/logo/logo1.png">
				</a>
			</div>
		</div>
		<div class="container">
			<!-- 회원가입 폼 -->
			<div class="create-Account-container">
				<form id="createForm">
					<h1>회원가입</h1>
					<div>
						<input class="inputMiddle" type="text" placeholder="아이디"
							id="createUserid" name="userid" required>
						<button id="btnDubCheckId" class="btnSmall form_btn">중복확인</button>
					</div>
					<div>
						<input class="inputMiddle" type="password" placeholder="닉네임"
							id="createUnickName" name="unickName" required>
						<button id="btnDubCheckNickname" class="btnSmall form_btn">중복확인</button>
					</div>
					<input class="inputSamll" type="password" placeholder="비밀번호"
						id="createUpw" name="upw" required>
					<input class="inputSamll" type="password" placeholder="비밀번호 확인"
						id="createUpwCheck" name="upwCheck" required>
					<button type="submit" class="btn form_btn">확인</button>
				</form>
			</div>
			<!-- 로그인 폼 -->
			<div class="log-in-container">
				<form id="loginForm" action="/user/login" method="post">
					<h1>소셜 로그인</h1>
					<div class="social-links">
						<div>
							<a href="#"><i class="xi-naver" aria-hidden="true"></i></a>
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
	                        	id="useCookie" name="useCookie">
						<label class="form-check-label" for="useCookie">아이디 기억하기</label>
					</div>
					<button type="submit" class="btn form_btn">확인</button>
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
					<p>끼룩 계정을 만들어서 더 많은<br>여행 정보를 이용하세요!</p>
					<button id="createAccount" class="btn overlay_btn">회원가입</button>
				</div>
			</div>
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
</script>
</html>