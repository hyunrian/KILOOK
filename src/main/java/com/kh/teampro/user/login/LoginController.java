package com.kh.teampro.user.login;

import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.teampro.user.info.UserVo;


@Controller
@RequestMapping(value = "/loginUser")
public class LoginController {

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private UserService userService;
	
	// 로그인 폼 - get요청
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginFrom () {
		return "user/login";
	}
	
	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String createAcount(UserVo userVo, RedirectAttributes rttr) {
		System.out.println("conntroller: " + userVo.getUnickname());
		boolean result = userService.createAccount(userVo);
		boolean joinResult = false;
		if (result==true) {
			joinResult = true;
		}
		rttr.addAttribute("joinResult", joinResult);
		return "redirect:/loginUser/login";
	}
	
	// 아이디 중복 확인
	@ResponseBody
	@RequestMapping(value = "/idDubCheck", method = RequestMethod.POST)
	public boolean idDubChck (String userid) {
		return userService.dubCheckID(userid);
	}
	// 닉네임 중복 확인
	@RequestMapping(value = "/nickNameDubCheck", method = RequestMethod.POST)
	@ResponseBody
	public boolean nickNameDubChck (String unickname) {
		return userService.dubCheckNickName(unickname);
	}
	
	// 로그인 처리 - post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginRun (LoginDto loginDto, HttpSession session,
			RedirectAttributes rttr) {
		System.out.println("LoginDto:" + loginDto);
		UserVo userVo = userService.login(loginDto);
		String returnPage = "redirect:/";
		if (userVo != null) {
			String targetLocation = 
						(String)session.getAttribute("targetLocation");
			if(targetLocation != null) {
				returnPage = "redirect:"+ targetLocation;
			}
			session.removeAttribute("targetLocation");
			session.setAttribute("loginInfo", userVo);
		} else {
			rttr.addFlashAttribute("loginResult", "FAIL");
			returnPage = "redirect:/loginUser/login";
		}
		return returnPage;
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/loginUser/login";
	}
	
	// 비밀번호 찾기 폼으로 이동 (이메일 연동 임시 비밀번호 생성)
//	@RequestMapping(value="/forgotPassword", method = RequestMethod.GET)
//	public String forgotPassword() {
//		return "/user/forgotPassword";
//	}

	// 임시 비밀번호 생성 (이메일 연동)
//	@RequestMapping(value="/sendPassword", method = RequestMethod.POST)
//	public String sendPassword(String id, String email) {
//		System.out.println("id:" + id);
//		System.out.println("email:" + email);
//		
//		String uuid = UUID.randomUUID().toString();
//		String newPass = uuid.substring(0, uuid.indexOf("-"));
//		System.out.println("newPass:" + newPass);
//		
//		MimeMessagePreparator preparator = new MimeMessagePreparator() {
//			
//			@Override
//			public void prepare(MimeMessage mimeMessage) throws Exception {
//				MimeMessageHelper helper = new MimeMessageHelper(
//						mimeMessage,
//						false, // multipart 여부
//						"utf-8"
//						);
//				
//				helper.setFrom("teamprobusan@gmail.com"); // 보내는이
//				helper.setTo(email); // 받는이
//				helper.setSubject("비밀번호 변경 안내"); // 제목
//				helper.setText("변경된 비밀번호:" + newPass); // 내용
//			}
//		};
//		mailSender.send(preparator);
//		
//		return "redirect:/user/login";
//	}
	
	
}
