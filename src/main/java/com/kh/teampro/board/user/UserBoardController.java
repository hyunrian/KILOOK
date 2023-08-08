package com.kh.teampro.board.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.teampro.reply.user.UserReplyService;

@Controller
@RequestMapping("/userboard")
public class UserBoardController {

	@Autowired
	private UserBoardService userBoardService;
	
	@Autowired
	private UserReplyService userReplyService;
	
	// 유저 게시글 목록 보기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getList(Model model) {
		
		List<UserBoardVo> list = userBoardService.getUserArticleList();
		for (UserBoardVo userBoardVo : list) {
			int replycnt = userReplyService.getReplycnt(userBoardVo.getBno());
			userBoardVo.setReplycnt(replycnt);
//			System.out.println("userboardvo: " + userBoardVo);
		}
		model.addAttribute("userArticleList", list);
		
		return "userboard/userboard";
	}
	
	// 게시글 쓰기
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeArticle() {
		return "userboard/userArticle";
	}
	
	// 유저 게시글 내용 보기
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getDetail(int bno, Model model) {

		UserBoardVo userBoardVo = userBoardService.getUserArticleDetail(bno);
		System.out.println("time:" + userBoardVo.getRegdate());
		model.addAttribute("userBoardVo", userBoardVo);
		
		return "userboard/userboardDetail";
	}
	
	
	
	
}
