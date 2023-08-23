package com.kh.teampro.Like.board;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.teampro.commons.MyConstants;
import com.kh.teampro.user.info.UserVo;

@RestController
@RequestMapping("/like")
public class AccLikeController {

	@Autowired
	private AccLikeService accLikeService;
	
	// 좋아요 추가
	@RequestMapping(value = "/addAccomLike/{bno}", method = RequestMethod.GET)
	@ResponseBody
	public String addAccomLike(@PathVariable int bno, HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		AccLikeVo accLikeVo = new AccLikeVo();
		accLikeVo.setUserid(userVo.getUserid());
		accLikeVo.setBno(bno);
		boolean result = accLikeService.addAccomLike(accLikeVo);
		return String.valueOf(result);
	}
	
	// 좋아요 목록
	@RequestMapping(value = "/accomLikeList/{bno}", method = RequestMethod.POST)
	@ResponseBody
	public String accomLikeList(@PathVariable int bno, HttpSession session, Model model) {
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		AccLikeVo accLikeVo = new AccLikeVo();
		accLikeVo.setUserid(userVo.getUserid());
		accLikeVo.setBno(bno);
		boolean result = accLikeService.accomLikeList(accLikeVo); // 좋아요를 했다면 true, 아니라면 false 반환
		return String.valueOf(result);
	}
	
	// 좋아요 취소
	@RequestMapping(value = "/deleteAccomLike/{bno}", method = RequestMethod.GET)
	@ResponseBody
	public String deleteAccomLike(@PathVariable int bno, HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		AccLikeVo accLikeVo = new AccLikeVo();
		accLikeVo.setUserid(userVo.getUserid());
		accLikeVo.setBno(bno);
		boolean result = accLikeService.deleteAccomLike(accLikeVo);
		return String.valueOf(result);
	}
	
	// 좋아요 개수 확인
	@RequestMapping(value = "/getAccomLikeCount/{bno}", method = RequestMethod.POST)
	@ResponseBody
	public String getAccomLikeCount(@PathVariable int bno) {
		int count = accLikeService.getAccomLikeCount(bno);
		return String.valueOf(count);
	}
}
