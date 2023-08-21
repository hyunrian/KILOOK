package com.kh.teampro.Like.board;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.teampro.user.info.UserVo;

@RestController
@RequestMapping("/like")
public class FoodLikeController {

	@Autowired
	private FoodLikeService foodLikeService;
	
	// 좋아요 추가
	@RequestMapping(value = "/addRestLike/{bno}", method = RequestMethod.GET)
	@ResponseBody
	public String addRestLike(@PathVariable int bno, HttpSession session) {
//		UserVo userVo = (UserVo)session.getAttribute(null); // 저장된 아이디 가져오기(수정필요)
		FoodLikeVo foodLikeVo = new FoodLikeVo();
		foodLikeVo.setUserid("testuser"); // 수정필요
		foodLikeVo.setBno(bno);
		boolean result = foodLikeService.addRestLike(foodLikeVo);
		return String.valueOf(result);
	}
	
	// 좋아요 목록
	@RequestMapping(value = "/restLikeList/{bno}", method = RequestMethod.POST)
	@ResponseBody
	public String restLikeList(@PathVariable int bno, HttpSession session, Model model) {
//		UserVo userVo = (UserVo)session.getAttribute(null); // 저장된 아이디 가져오기(수정필요)
		System.out.println("restLikeList Controller 들어옴");
		FoodLikeVo foodLikeVo = new FoodLikeVo();
		foodLikeVo.setUserid("testuser"); // 수정필요
		foodLikeVo.setBno(bno);
		boolean result = foodLikeService.restLikeList(foodLikeVo); // 좋아요를 했다면 true, 아니라면 false 반환
		return String.valueOf(result);
	}
	
	// 좋아요 취소
	@RequestMapping(value = "/deleteRestLike/{bno}", method = RequestMethod.GET)
	@ResponseBody
	public String deleteRestLike(@PathVariable int bno, HttpSession session) {
//		UserVo userVo = (UserVo)session.getAttribute(null); // 저장된 아이디 가져오기(수정필요)
		System.out.println("deleteRestLike Controller");
		FoodLikeVo foodLikeVo = new FoodLikeVo();
		foodLikeVo.setUserid("testuser"); // 수정필요
		foodLikeVo.setBno(bno);
		boolean result = foodLikeService.deleteRestLike(foodLikeVo);
		return String.valueOf(result);
	}
	
	// 좋아요 개수 확인
	@RequestMapping(value = "/getRestLikeCount/{bno}", method = RequestMethod.POST)
	@ResponseBody
	public String getRestLikeCount(@PathVariable int bno) {
		int count = foodLikeService.getRestLikeCount(bno);
		return String.valueOf(count);
	}
}
