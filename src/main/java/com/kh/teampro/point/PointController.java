package com.kh.teampro.point;

import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
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
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	// 포인트 사용 (requiredPoint = 필요 포인트 비용)
	@RequestMapping(value = "/usePoint", method = RequestMethod.GET)
	@ResponseBody
	public String usePoint(String userid, int requiredPoint, HttpSession session) {
		// 해당 유저의 현재 포인트 소지량 확인
		int userPoint = pointService.checkPoint(userid);
		// 소지 포인트가 요구 포인트보다 충분한지 확인
		if (userPoint >= requiredPoint) {
			// 충분히 소지 시 요구 포인트만큼 사용 후
			pointService.usePoint(userid, requiredPoint);
			// 해당 사용자의 잔여 포인트를 다시 세션에 넣어줌
			UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
			userVo.setUpoint(userPoint - requiredPoint);
			session.setAttribute(MyConstants.LOGIN, session);
			
			// 해당 상품을 사용자에게 선물
			String uemail = userVo.getUemail();
			
			String couponCode = UUID.randomUUID().toString();
			// 메일로 쿠폰코드 전송(UUID 더미데이터)
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
					helper.setSubject("KILOOK 포인트 상품 : 쿠폰 코드"); // 제목
					helper.setText("쿠폰 입력 코드: " + couponCode); // 내용
				}
			};
			// /메일로 코드전송
			mailSender.send(preparator);
			
			// 잔여 포인트를 문자열로 리턴해줌
			return (userPoint - requiredPoint) + "";
		}
		// 포인트 부족
		return "fail";
	}
	
}
