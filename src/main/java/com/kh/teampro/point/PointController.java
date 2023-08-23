package com.kh.teampro.point;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.teampro.commons.MyConstants;
import com.kh.teampro.user.info.UserVo;

@Controller
@RequestMapping("/point")
public class PointController {

	@Autowired
	private PointService pointService;
	
	
	
	// 포인트보상 페이지로
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String toPointReward(HttpSession session, Model model) {
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		model.addAttribute("userVo", userVo);
		return "point/pointReward";
	}
	
	// 포인트 사용 (requiredPoint = 필요 포인트 비용)
	@RequestMapping(value = "/usePoint", method = RequestMethod.GET)
	@ResponseBody
	public String usePoint(String userid, int requiredPoint) {
		// 해당 유저의 현재 포인트 소지량 확인
		int userPoint = pointService.checkPoint(userid);
		// 소지 포인트가 요구 포인트보다 충분한지 확인
		if (userPoint >= requiredPoint) {
			// 충분히 소지 시 요구 포인트만큼 사용 후
			pointService.usePoint(userid, requiredPoint);
			// 해당 상품을 사용자에게 선물
			// ㅡㅡㅡ 구현 필요 ㅡㅡㅡ //
			return "success";
		}
		// 포인트 부족
		return "fail";
	}
	
}
