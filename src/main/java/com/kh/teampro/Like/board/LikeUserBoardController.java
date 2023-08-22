package com.kh.teampro.Like.board;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.teampro.commons.MyConstants;
import com.kh.teampro.user.info.UserVo;

@RestController
@RequestMapping("/like")
public class LikeUserBoardController {

	@Autowired
	private LikeUserBoardService likeUserBoardService;
	
	@RequestMapping(value = "/add/{bno}", method = RequestMethod.POST)
	public String addLike(@PathVariable int bno, HttpSession session) {
		UserVo loginInfo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		LikeUserBoardVo likeUserBoardVo = 
				new LikeUserBoardVo(loginInfo.getUserid(), bno);
		likeUserBoardService.addLike(likeUserBoardVo);
		return MyConstants.SUCCESS_MESSAGE;
	}
	
	@RequestMapping(value = "/cancel/{bno}",
			method = RequestMethod.DELETE)
		public String cancelLike(@PathVariable int bno, HttpSession session) {
		
		UserVo loginInfo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		LikeUserBoardVo likeUserBoardVo = 
				new LikeUserBoardVo(loginInfo.getUserid(), bno);
		likeUserBoardService.cancelLike(likeUserBoardVo);
		return MyConstants.SUCCESS_MESSAGE;
	}
	
	@RequestMapping(value = "/liked/{bno}", method = RequestMethod.GET)
	public boolean userLiked(@PathVariable int bno, HttpSession session) {
		UserVo loginInfo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		LikeUserBoardVo likeUserBoardVo = 
				new LikeUserBoardVo(loginInfo.getUserid(), bno);
		return likeUserBoardService.userLiked(likeUserBoardVo);
	}
	
	@RequestMapping(value = "/count/{bno}", method = RequestMethod.GET)
	public int countLikes(@PathVariable int bno) {
		return likeUserBoardService.countLikes(bno);
	}
}
