<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/menu.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<style>
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
</style>
<script>

//사용자 지정 메소드

//글자수 제한(닉네임)
$.validator.addMethod("lengthCheckNickName", function(value, element) {
	  return this.optional(element) || /^.{2,10}$/.test(value);
	}, "**** 닉네임은 2 ~ 10자 입니다 ****");

//글자수 제한(비밀번호)
$.validator.addMethod("lengthCheckPw", function(value, element) {
	  return this.optional(element) || /^.{4,30}$/.test(value);
	}, "**** 비밀번호는 4 ~ 15자 입니다 ****");
	
//글자 제한 (영문과 숫자, 한글만)
$.validator.addMethod("spellCheckNickName", function(value, element) {
	  return this.optional(element) || /^[A-Za-z0-9\uAC00-\uD7A3]+$/.test(value);
	}, "**** 닉네임은 영문, 숫자, 한글만 가능합니다 ****");
	
//특수문자 제한
$.validator.addMethod("spellCheckSC", function(value, element) {
	  return this.optional(element) || /^[a-zA-Z0-9!@#$%_]*$/.test(value);
	}, "**** 특수문자는 !@#$%_만 사용 가능합니다 ****");

//글자 제한 (영문+숫자+특수기호)
$.validator.addMethod("spellCheckPW", function(value, element) {
	  return this.optional(element) || /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%_])[A-Za-z\d!@#$%-_]+$/.test(value);
	}, "**** 영문, 숫자, 특수문자를 조합해야 합니다 ****");
	
$(function(){
	// 페이지 실행되면 유저 프로필사진 display
	var userid = $("#userid").val();
	$("#userProfile").attr("src", "/profile/display?userid=" + userid);
	
	// 유저 이미지 변경 미리보기(파일선택 버튼)
	let filePath = "";
	$("#inputImg").change(function (e) {
		const file = e.target.files[0];
		const formData = new FormData();
		formData.append("file", file);
		// 서버에 이미지 저장
		$.ajax({
			"type" : "post",
			"url" : "/profile/upload",
			"data" : formData,
			"contentType" : false,
			"processData" : false,
			"success" : function(rData) {
				console.log("filePath : " + rData);
				$("#imgProfile").attr("src", "/profile/displayUpdate?filePath=" + rData);
				filePath = rData;
			}
		});
	});
	
	const form = $("#userVoForm");
	// 회원가입 유효성 검사
	var idDubMessage = "";
	var dataTest = "";
	form.validate({
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
	
	// 유저정보 수정 완료 및 전송
	$("#btnUpdateDone").click(function(){
		// 닉네임, 비밀번호, 비밀번호 확인 정보
		var updateUnickname = $("#unickname").val().trim();
		var updateUpw = $("#upw").val().trim();
		var checkUpw = $("#checkUpw").val().trim();
		
		// 입력한 비밀번호와 비밀번호 확인이 다르면 수정 기능 작동하지 않음
		var doUpdate = true;
		if (updateUpw != checkUpw) {
			doUpdate = false;
		}
		
		// 수정기능 작동 확인. 하나라도 만족 못하면 경고문만 출력. alert 이외의 방법 고민.
		if (doUpdate == false) { // 비밀번호 확인 실패시 작동 안함 + 비밀번호, 비밀번호 확인란 비우기
			$("#upw").val("");
			$("#checkUpw").val("");
			alert("비밀번호를 다시 확인해주세요.");
		} else if (updateUnickname == "" && filePath == "" && updateUpw == "") { // 수정할 내용이 하나도 없으면 유저정보수정 작동 안함
			alert("수정할 내용이 없습니다.");
		} else { // 조건 전부 만족하여 유저정보 업데이트 기능 작동
			
//			데이터 전송 폼에 든 내용으로 DB 수정. 입력한 값이 있는것들만 수정함
			if (updateUnickname != "") {
				$("#updateUnickname").val(updateUnickname);
			}
			if (updateUpw != "") {
				$("#updateUpw").val(updateUpw);
			}
			if (filePath != "") {
				$("#updateUimg").val(filePath);
			}
			
			alert("수정이 완료되었습니다.");
			form.submit();
		}
		
	}); // 유저 정보 수정 완료 (btnUpdateDone 클릭)
	
});

</script>
<body>
    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        
        <%@ include file="/WEB-INF/views/include/mypageSidemenu.jsp" %>
        
          <div class="col-md-8 ftco-animate">
           <div class="sidebar-box ftco-animate">
            <form action="#" class="p-5 bg-light">
            
            <h2 class="mb-5">사용자 정보 수정</h2>
            
            <div class="form-group">
                <label for="unickname">프로필 사진</label>
                <div class="bio align-self-md-center mr-5">
              		<c:choose>
	              		<c:when test="${userVo.uimg == null}">              		
			                <img src="/resources/images/userProfile/default_profile.png" alt="profile" id="imgProfile" style="height: 100px; width: 100px;">
	              		</c:when>
	              		<c:otherwise>
			                <img id="userProfile" src="${userVo.uimg}" alt="profile" id="imgProfile" style="height: 100px; width: 100px;">              		
	              		</c:otherwise>
	              	</c:choose>
             		<input type="file" id="inputImg">
            	</div>
            </div>
            
              <div class="form-group">
                <label for="unickname">닉네임</label>
                <input type="text" class="form-control" id="unickname" placeholder="${userVo.unickname}">
              </div>
              <div class="form-group">
                <label for="upw">비밀번호</label>
                <input type="password" class="form-control" id="upw" placeholder="새 비밀번호">
              </div>
              <div class="form-group">
                <label for="checkUpw">비밀번호 확인</label>
                <input type="password" class="form-control" id="checkUpw" placeholder="새 비밀번호 확인">
              </div>
              <div class="form-group">
                <input type="button" id="btnUpdateDone" value="정보 수정 완료" class="btn py-3 px-4 btn-primary">
                <input type="submit" id="btnUpdateDone" value="정보 수정 완료" class="btn py-3 px-4 btn-primary">
              </div>	
            </form>
            
            <input type="hidden" id="verifyCode" value="${verifyCode}">
            <input type="hidden" id="uemail" value="${uemail}">
             
           </div>
          </div> <!-- .col-md-8 -->

        </div>
      </div>
    </section> <!-- .section -->
    
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>