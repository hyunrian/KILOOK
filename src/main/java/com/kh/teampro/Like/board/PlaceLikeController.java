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
public class PlaceLikeController {

	@Autowired
	private PlaceLikeService placeLikeService;
	
	// 좋아요 추가
	@RequestMapping(value = "/addPlaceLike/{bno}", method = RequestMethod.GET)
	@ResponseBody
	public String addPlaceLike(@PathVariable int bno, HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		PlaceLikeVo placeLikeVo = new PlaceLikeVo();
		placeLikeVo.setUserid(userVo.getUserid());
		placeLikeVo.setBno(bno);
		boolean result = placeLikeService.addPlaceLike(placeLikeVo);
		return String.valueOf(result);
	}
	
	// 좋아요 목록
	@RequestMapping(value = "/placeLikeList/{bno}", method = RequestMethod.POST)
	@ResponseBody
	public String placeLikeList(@PathVariable int bno, HttpSession session, Model model) {
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		PlaceLikeVo placeLikeVo = new PlaceLikeVo();
		placeLikeVo.setUserid(userVo.getUserid());
		placeLikeVo.setBno(bno);
		boolean result = placeLikeService.placeLikeList(placeLikeVo); // 좋아요를 했다면 true, 아니라면 false 반환
		return String.valueOf(result);
	}
	
	// 좋아요 취소
	@RequestMapping(value = "/deletePlaceLike/{bno}", method = RequestMethod.GET)
	@ResponseBody
	public String deletePlaceLike(@PathVariable int bno, HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		PlaceLikeVo placeLikeVo = new PlaceLikeVo();
		placeLikeVo.setUserid(userVo.getUserid());
		placeLikeVo.setBno(bno);
		boolean result = placeLikeService.deletePlaceLike(placeLikeVo);
		return String.valueOf(result);
	}
	
	// 좋아요 개수 확인
	@RequestMapping(value = "/getPlaceLikeCount/{bno}", method = RequestMethod.POST)
	@ResponseBody
	public String getPlaceLikeCount(@PathVariable int bno) {
		int count = placeLikeService.getPlaceLikeCount(bno);
		return String.valueOf(count);
	}
}
