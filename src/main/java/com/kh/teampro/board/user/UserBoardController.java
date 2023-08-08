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
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getList(Model model) {
		
		List<UserBoardVo> list = userBoardService.getUserArticleList();
		for (UserBoardVo userBoardVo : list) {
			int replycnt = userReplyService.getReplycnt(userBoardVo.getBno());
			userBoardVo.setReplycnt(replycnt);
			System.out.println("userboardvo: " + userBoardVo);
		}
		model.addAttribute("userArticleList", list);
		
		return "userboard/userboard";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeArticle() {
		return "userboard/userArticle";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getDetail(int bno) {
		
		
		
		return "userboard/userBoardDetail";
	}
	
	
	
	
}
