package com.kh.teampro.user.info;

import java.util.List;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.teampro.commons.MyConstants;

@Controller
@RequestMapping("/userInfo")
public class UserInfoController {

	@Autowired
	private UserInfoService userInfoService;
	
	// 마이페이지로 가기 버튼을 눌렀을 때
	// 유저 한명 정보 읽어서 데이터를 model로 돌려줌
	// 이후 페이지를 열 때 작동하는 기능들은 전부 여기로 (유저 본인확인 상태 체크 등)
	// 유저 작성 글, 댓글 정보 읽어서 리스트 띄우기
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String readOneUserInfo(Model model, HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		String userid = userVo.getUserid();
		//UserVo userVo = userInfoService.readOneUserInfo(userid); 
		List<UserBoardDto> boardList = userInfoService.readUserBoard(userid); 
		List<UserReplyDto> replyList = userInfoService.readUserReply(userid); 
		int userBoardCount = userInfoService.readUserBoardCount(userid); 
		int userReplyCount = userInfoService.readUserReplyCount(userid); 
		// 유저 한명 정보를 읽은 뒤 데이터와 함께 마이페이지로 보냄 
		model.addAttribute("userVo", userVo); // 유저 데이터. 현재 세션에 있음
		model.addAttribute("boardList", boardList); // 게시글 목록
		model.addAttribute("replyList", replyList); // 댓글 목록
		model.addAttribute("userBoardCount", userBoardCount); // 게시글 갯수
		model.addAttribute("userReplyCount", userReplyCount); // 댓글 갯수
		
		return "userinfo/mypage";
	}
	
	// 유저 정보 수정 페이지로 이동, 데이터를 받아서 수정란에 넣기
	// 원한다면 수정하려는 유저 id만 받아서 해당 id로 정보 기록하는 방식으로 변경 가능 - 현재는 아님.
	@RequestMapping(value = "/infoUpdate", method = RequestMethod.POST)
	public String toUserInfoUpdatePage(@ModelAttribute UserVo userVo, Model model) {
		model.addAttribute("userVo", userVo);
		return "userinfo/userInfoUpdatePage";
	}
	
	// 유저 정보 수정하기
	// 현재 수정 가능 데이터 = uimg, unickname, upw
	@RequestMapping(value = "/updateDone", method = RequestMethod.POST)
	public String updateUserInfo(@ModelAttribute UserVo userVo, Model model) {
		// 정보 수정 전 jsp에서 비동기로 중복 닉네임 있는지 확인
		// 기능 구현 확인 후 아래 주석처리 해제
		userInfoService.updateUserInfo(userVo);
		// 정보 수정 후 다시 마이페이지로
		model.addAttribute("userVo", userVo);
		return "userinfo/mypage";
	}
	
	@Autowired
	private JavaMailSenderImpl mailSender;		
	// 본인확인 코드 생성 (이메일 연동)
	// 생성된 코드로 ~~ 를 한 후 유저테이블의 verified 'F' -> 'T'
	@RequestMapping(value="/verifyMail", method = RequestMethod.POST)
	public String verifyMail(String userid, String uemail, Model model) {
		System.out.println("id:" + userid);
		System.out.println("email:" + uemail);
		
		String uuid = UUID.randomUUID().toString();
		String verifyCode = uuid.substring(0, uuid.indexOf("-"));
		System.out.println("verifyCode:" + verifyCode);
			
		// 메일로 코드 전송
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper helper = new MimeMessageHelper(
						mimeMessage,
						false, // multipart 여부
						"utf-8"
						);
				
				helper.setFrom("teamprobusan@gmail.com"); // 보내는이
				helper.setTo(uemail); // 받는이
				helper.setSubject("KILOOK 계정 본인확인"); // 제목
				helper.setText("본인확인 코드: " + verifyCode); // 내용
			}
		};
		mailSender.send(preparator);
		// /메일로 코드전송
		
		// model에 email, verifyCode를 담아서 이메일에 전송된 uuid를 입력하도록 하는 인풋창을 사용자에게 보여줌
		// (jsp 생성 필요, 해당 jsp로 리턴)
		
		model.addAttribute("verifyCode", verifyCode);
		model.addAttribute("uemail", uemail);
		
		return "userinfo/userVerifyPage";
	}
		
		// 본인확인 성공/실패 확인
		@RequestMapping(value = "/checkVerify", method = RequestMethod.POST)
		@ResponseBody
		public String checkVerify(String verifyCode, String userVerifyCode, String userid, String uemail) {
			System.out.println(verifyCode);
			System.out.println(userVerifyCode);
			System.out.println(userid);
			System.out.println(uemail);
			
			// 유저 코드와 임시 코드가 동일한 경우
			if (verifyCode.equals(userVerifyCode)) {
				// 성공했으므로 이메일, 본인확인 성공 저장
				userInfoService.updateVerified(uemail, userid);
				return "success"; // 이후 리턴 트루. jsp에서 비동기 처리 한 뒤 true 돌려받으면 "success"에서 function으로 마이페이지로.
			}
			
			// 본인확인 실패 시 그냥 실패 처리
			return "fail";
		}
	
}
