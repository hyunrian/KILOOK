package com.kh.teampro.point;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.teampro.commons.MyConstants;

@Controller
@RequestMapping("/point")
public class PointController {

	@Autowired
	private PointService pointService;
	
	// 글 작성 포인트
	private final int WRITING_POINT = 20;
	// 댓글 작성 포인트
	private final int COMMENT_POINT = 5;
	
	// 포인트보상 페이지로
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String toPointReward() {
		return "point/pointReward";
	}
	
	// 포인트 추가
	// getPointType = 포인트 획득 경로. 데이터 보낼때 "글", "댓글" 로 구분
	@RequestMapping(value = "/addPoint", method = RequestMethod.GET)
	@ResponseBody
	public String addPoint(String userid, String getPointType) {
		if (getPointType.equals(MyConstants.POST)) {
			pointService.addPoint(userid, WRITING_POINT);	// 글 작성 포인트로 pointService에 전달
		} else if (getPointType.equals(MyConstants.REPLY)) {			// 포인트 획득 경로가 댓글 작성 일때
			pointService.addPoint(userid, COMMENT_POINT);	// 댓글 작성 포인트로 pointService에 전달
		}
		
		return "success";
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
			return "use success";
		}
		// 포인트 부족
		return "use fail";
	}
	
	
	
}
