package com.kh.teampro.user.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/userinfo")
public class UserInfoController {

	@Autowired
	private UserInfoService userInfoService;
	
	// 마이페이지로 가기 버튼을 눌렀을 때
	// 유저 한명 정보 읽어서 데이터를 model로 돌려줌
	// 이후 페이지를 열 때 작동하는 기능들은 전부 여기로 (유저 본인확인 상태 체크 등)
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String readOneUserInfo(String userid, Model model) {
		UserVo userVo = userInfoService.readOneUserInfo(userid);
		model.addAttribute("userVo", userVo);
		
		// 유저 한명 정보를 읽은 뒤 데이터와 함께 마이페이지로 보냄
		System.out.println("model in readOneUserInfo:" + model);
		return "userinfo/mypage";
	}
	
	// 유저 정보 수정 페이지로 이동, 데이터를 받아서 수정란에 넣기
	// 원한다면 수정하려는 유저 id만 받아서 해당 id로 정보 기록하는 방식으로 변경 가능 - 현재는 아님.
	@RequestMapping(value = "/infoUpdate", method = RequestMethod.POST)
	public String toUserInfoUpdatePage(@ModelAttribute UserVo userVo, Model model) {
		System.out.println(userVo);
		model.addAttribute(userVo);
		return "userinfo/infoUpdate";
	}
	
	// 유저 정보 수정하기
	@RequestMapping(value = "/updateDone", method = RequestMethod.POST)
	public String updateUserInfo(UserVo userVo) {
		// 정보 수정 전 jsp에서 비동기로 중복 닉네임 있는지 확인
		// 기능 구현 확인 후 아래 주석처리 해제
//		userInfoService.updateUserInfo(userVo);
		// 정보 수정 후 다시 마이페이지로
		return "userinfo/mypage";
	}
	
}
