package com.kh.teampro.board.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.teampro.Like.board.LikeUserBoardService;
import com.kh.teampro.reply.user.UserReplyService;
import com.kh.teampro.reply.user.UserReplyVo;

@Controller
@RequestMapping("/userboard")
public class UserBoardController {

	@Autowired
	private UserBoardService userBoardService;
	
	@Autowired
	private UserReplyService userReplyService;
	
	@Autowired
	private LikeUserBoardService likeUserBoardService;
	
	// 유저 게시글 목록 보기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getList(Model model) {
		
		List<UserBoardVo> list = userBoardService.getUserArticleList();
		for (UserBoardVo userBoardVo : list) {
			int replycnt = userReplyService.getReplycnt(userBoardVo.getBno());
			int likecnt = likeUserBoardService.countLikes(userBoardVo.getBno());
			userBoardVo.setLikecnt(likecnt);
			userBoardVo.setReplycnt(replycnt);
			// 댓글 개수, 조회수, 좋아요 수 db에 저장할지 안할지 정해야 함
		}
		model.addAttribute("userArticleList", list);
		
		return "userboard/userboard";
	}
	
	// 게시글 쓰기
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeArticle() {
		return "userboard/userboardWrite";
	}
	
	// 유저 게시글 내용 보기
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getDetail(int bno, Model model) {
		
		userBoardService.addViewcnt(bno);

		UserBoardVo userBoardVo = userBoardService.getUserArticleDetail(bno);
		int replycnt = userReplyService.getReplycnt(bno);
		userBoardVo.setReplycnt(replycnt);
		model.addAttribute("userBoardVo", userBoardVo);
		
		List<UserReplyVo> list = userReplyService.getUserReply(bno);
//		System.out.println(list);
		model.addAttribute("replyList", list);
		
		int likecnt = likeUserBoardService.countLikes(bno);
		model.addAttribute("likecnt", likecnt);
		
		return "userboard/userboardDetail";
	}
	
	
	
	
}
