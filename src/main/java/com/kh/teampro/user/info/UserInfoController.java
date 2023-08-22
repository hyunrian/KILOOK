package com.kh.teampro.user.info;

import java.io.File;
import java.io.IOException;
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
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	public String toMypage(Model model, HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		String userid = userVo.getUserid();
		List<UserBoardDto> boardList = userInfoService.readUserBoard(userid); 
		List<UserReplyDto> replyList = userInfoService.readUserReply(userid); 
		int userBoardCount = userInfoService.readUserBoardCount(userid); 
		int userReplyCount = userInfoService.readUserReplyCount(userid); 
		// 유저 한명 정보를 읽은 뒤 데이터와 함께 마이페이지로 보냄 
		model.addAttribute("userVo", userVo); // 유저 데이터
		model.addAttribute("boardList", boardList); // 게시글 목록
		model.addAttribute("replyList", replyList); // 댓글 목록
		model.addAttribute("userBoardCount", userBoardCount); // 게시글 갯수
		model.addAttribute("userReplyCount", userReplyCount); // 댓글 갯수
		
		return "userinfo/mypage";
	}
	
	// 내 게시글 목록
	// 페이지Dto 포함해서 넘겨주기
	@RequestMapping(value = "/mypost", method = RequestMethod.GET)
	public String toMyPostList(UserInfoPagingDto infoPagingDto, Model model, HttpSession session) {
		
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		String userid = userVo.getUserid();
		int userBoardCount = userInfoService.readUserBoardCount(userid);
		int userReplyCount = userInfoService.readUserReplyCount(userid);
		model.addAttribute("userVo", userVo);
		model.addAttribute("userBoardCount", userBoardCount); // 게시글 갯수
		model.addAttribute("userReplyCount", userReplyCount); // 댓글 갯수
		
		
		infoPagingDto = new UserInfoPagingDto(infoPagingDto.getPage(), 
												infoPagingDto.getPerPage(), 
												userBoardCount);
		List<UserBoardDto> boardList = userInfoService.readUserBoard(userid); 
		model.addAttribute("boardList", boardList); // 전체 게시글 목록
		model.addAttribute("infoPagingDto",infoPagingDto);
		
		return "userinfo/myPostList";
	}
	
	// 내 댓글 목록
	@RequestMapping(value = "/myreply", method = RequestMethod.GET)
	public String toMyReplyList(UserInfoPagingDto infoPagingDto, Model model, HttpSession session) {
		
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		String userid = userVo.getUserid();
		int userBoardCount = userInfoService.readUserBoardCount(userid);
		int userReplyCount = userInfoService.readUserReplyCount(userid);
		model.addAttribute("userVo", userVo);
		model.addAttribute("userBoardCount", userBoardCount); // 게시글 갯수
		model.addAttribute("userReplyCount", userReplyCount); // 댓글 갯수
		
		infoPagingDto = new UserInfoPagingDto(infoPagingDto.getPage(), 
												infoPagingDto.getPerPage(), 
												userReplyCount);
		List<UserReplyDto> replyList = userInfoService.readUserReply(userid); // 전체 댓글 목록
		model.addAttribute("replyList", replyList);
		model.addAttribute("infoPagingDto",infoPagingDto);
		
		return "userinfo/myReplyList";
	}
	
	
	// 유저 정보 수정 페이지로 이동
	@RequestMapping(value = "/infoUpdate", method = RequestMethod.POST)
	public String toUserInfoUpdatePage(Model model, HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		model.addAttribute("userVo", userVo);
		String userid = userVo.getUserid();
		int userBoardCount = userInfoService.readUserBoardCount(userid);
		int userReplyCount = userInfoService.readUserReplyCount(userid);
		model.addAttribute("userBoardCount", userBoardCount); // 게시글 갯수
		model.addAttribute("userReplyCount", userReplyCount); // 댓글 갯수
		return "userinfo/userInfoUpdatePage";
	}
	
	// 중복 닉네임 확인 (미구현)
	@RequestMapping(value = "/checkDup", method = RequestMethod.POST)
	@ResponseBody
	public String checkDupNickname() {
		
		return "success";
	}
	
	// 유저 정보 수정하기, 정보 수정 전 위 함수로 jsp에서 비동기로 중복 닉네임 있는지 확인
	// 현재 수정 가능 데이터 = uimg, unickname, upw
	@RequestMapping(value = "/updateDone", method = RequestMethod.POST)
	public String updateUserInfo(@ModelAttribute UserVo userVo, HttpSession session) {
		// 변경된 닉네임, 비밀번호, 이미지경로를 @ModelAttribute userVo형태로 받아와서 저장
		userInfoService.updateUserInfo(userVo);
//		
//		// 이미지 저장 경로
//		String baseImgPath = "/resources/images/userProfile/";
//		// 이미지 파일명
//		String imgPath = userVo.getUimg();
//		// DB에 저장될 이미지파일 경로
//		String dbPath = baseImgPath + imgPath;
//		// 위의 과정을 JSP 에서 처리?
		
		
		// 수정 후 세션에서 기존 데이터 삭제 후 수정된 데이터 저장
		session.removeAttribute(MyConstants.LOGIN);
		session.setAttribute(MyConstants.LOGIN, userVo);
		// 정보 수정 후 다시 마이페이지로
		return "redirect:/userInfo/mypage";
	}
	
	// 이미지 업데이트 시키기 (이미지폴더에 이미지 저장)
	// UUID를 돌려줘서 jsp 에서 이름 재조합 후 DB에 저장하도록 시킬것
	// 파일 경로 및 이름 = C:/teampro/profile/(유저명)_(파일명).JPG
	@ResponseBody
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public String updateProfile(MultipartFile profile, String userid) {
//		String filePath = "/resources/images/userProfile/";
//		String filePath = "D:/workspace/spring/teampro/src/main/webapp/resources/images/userProfile/";
		String filePath = "C:/teampro/profile/";
		String originalFilename = profile.getOriginalFilename();
		/// C:/teampro/profile/(유저명)_(파일명.확장자)
		String saveFilename = filePath + userid + "_" + originalFilename;
		File target = new File(saveFilename);
		try {
			byte[] bytes = profile.getBytes();
			FileCopyUtils.copy(bytes, target);
		} catch (IOException e) {
			e.printStackTrace();
		}
//		String responseFilename = "images/userProfile/" + userid + "_" + originalFilename;
		return filePath;
	}
	
	
	// 이메일로 본인확인 페이지로 이동
	@RequestMapping(value = "/getVerifyEmail", method = RequestMethod.GET)
	public String getVerifyEmail(Model model, HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		String userid = userVo.getUserid();
		int userBoardCount = userInfoService.readUserBoardCount(userid);
		int userReplyCount = userInfoService.readUserReplyCount(userid);
		model.addAttribute("userVo", userVo);
		model.addAttribute("userBoardCount", userBoardCount); // 게시글 갯수
		model.addAttribute("userReplyCount", userReplyCount); // 댓글 갯수
		return "userinfo/userVerifyPage";
	}
	
	@Autowired
	private JavaMailSenderImpl mailSender;		
	// 본인확인 코드 생성, 이메일로 전송 후 코드 리턴
	@RequestMapping(value="/verifyMail", method = RequestMethod.POST)
	@ResponseBody
	public String verifyEmail(String uemail) {
		System.out.println("email:" + uemail);
		
		String uuid = UUID.randomUUID().toString();
		String verifyCode = uuid.substring(0, uuid.indexOf("-"));
		System.out.println("verifyCode:" + verifyCode);
			
		// 메일로 코드 전송
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
//				helper.setTo(uemail); // 받는이
//				helper.setSubject("KILOOK 계정 본인확인"); // 제목
//				helper.setText("본인확인 코드: " + verifyCode); // 내용
//			}
//		};
//		mailSender.send(preparator);
		// /메일로 코드전송
		
		// 본인확인용 코드 리턴
		return verifyCode;
	}
		
		// 본인확인 성공/실패 확인
		@RequestMapping(value = "/checkVerify", method = RequestMethod.POST)
		@ResponseBody
		public String checkVerify(String verifyCode, String userVerifyCode, String userid, String uemail, HttpSession session) {
			System.out.println(verifyCode);
			System.out.println(userVerifyCode);
			System.out.println(userid);
			System.out.println(uemail);
			
			// 유저 코드와 임시 코드가 동일한 경우
			if (verifyCode.equals(userVerifyCode)) {
				// 성공했으므로 이메일, 본인확인 성공 저장
				userInfoService.updateVerified(uemail, userid);
				// 변경 전 세션에서 userVo 꺼내오기, 기존 세션 삭제 후 이메일 변경 후 새 세션으로 수정
				UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
				session.removeAttribute(MyConstants.LOGIN);
				userVo.setUemail(uemail);
				userVo.setVerified("T");
				session.setAttribute(MyConstants.LOGIN, userVo);
				
				return "success"; // 이후 리턴 트루. jsp에서 비동기 처리 한 뒤 true 돌려받으면 "success"에서 function으로 마이페이지로.
			}
			
			// 본인확인 실패 시 그냥 실패 처리
			return "fail";
		}
	
}
