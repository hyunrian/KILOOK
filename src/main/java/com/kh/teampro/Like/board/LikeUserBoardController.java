package com.kh.teampro.Like.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.teampro.commons.MyConstants;

@RestController
@RequestMapping("/like")
public class LikeUserBoardController {

	@Autowired
	private LikeUserBoardService likeUserBoardService;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addLike(LikeUserBoardVo likeUserBoardVo) {
		likeUserBoardService.addLike(likeUserBoardVo);
		return MyConstants.SUCCESS_MESSAGE;
	}
	
	@RequestMapping(value = "/cancel/{bno}/{unickname}", 
			method = RequestMethod.DELETE)
		public String cancelLike(
				@PathVariable String unickname, @PathVariable int bno) {
		LikeUserBoardVo likeUserBoardVo = new LikeUserBoardVo(unickname, bno);
		likeUserBoardService.cancelLike(likeUserBoardVo);
		return MyConstants.SUCCESS_MESSAGE;
	}
	
	@RequestMapping(value = "/liked", method = RequestMethod.GET)
	public boolean userLiked(LikeUserBoardVo likeUserBoardVo) {
		return likeUserBoardService.userLiked(likeUserBoardVo);
	}
	
	@RequestMapping(value = "/count/{bno}", method = RequestMethod.GET)
	public int countLikes(@PathVariable int bno) {
		return likeUserBoardService.countLikes(bno);
	}
}
