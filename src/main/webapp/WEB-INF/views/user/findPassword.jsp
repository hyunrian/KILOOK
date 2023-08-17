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
	border-radius: 50px;
	box-shadow: -5px -5px 10px #fff, 5px 5px 10px #babebc;
	position: absolute;
	width: 384px;
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

.main-container {
	position: absolute;
	left: 0;
	width: 100%;
	height: 100%;
	transition: all 0.5s;
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
.useable{
font-size: 12px;
	font-weight: bold;
    color: #008000;
    border-color: #008000;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

<!-- 스크립트 시작 -->
<script>

// 사용자 지정 메소드
// 글자수 제한 (아이디)
$.validator.addMethod("lengthCheckId", function(value, element) {
	  return this.optional(element) || /^.{2,15}$/.test(value);
	}, "**** 아이디는 2 ~ 15자 입니다 ****");
	
// 글자 제한 (영문과 숫자만)
$.validator.addMethod("spellCheckId", function(value, element) {
	  return this.optional(element) || /^[A-Za-z0-9]+$/.test(value);
	}, "**** 아이디는 영문, 숫자만 가능합니다 ****");
	
$(function() {
// 로그인 유효성 검사
	const loginForm = $("#passwordForm");
	loginForm.validate({
		rules: {                    // 유효성 검사 규칙
			userid: {				// 아이디 필드 (name="userid")
				required: true,     // 필수 입력
				lengthCheckId: true,
				spellCheckId: true
			},
			uemail: {     		        // 비밀번호 필드 (name="upw")
				required: true,     // 필수 입력
			}
		},
		messages: {                 // 오류값 발생시 출력할 메시지 수동 지정
			userid: {
				required: "**** 아이디를 입력해 주세요 ****"
			},
			uemail: {
				required: "**** 이메일을 입력해 주세요 ****"
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
			<!-- 비밀번호 생성 폼 -->
			<div class="main-container">
				<form id="passwordForm" action="/loginUser/login" method="post">
					<h1>임시 비밀번호 생성</h1>
					<input class="input" type="text" placeholder="아이디"
						id="userid" name="userid" required>
					<input class="input" type="email" placeholder="이메일"
						id="uemail" name="uemail" required>
					<button id="btnMakePassword" type="submit" class="btn form_btn">확인</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>