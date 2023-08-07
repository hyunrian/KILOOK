package com.kh.teampro.board.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/userboard")
public class UserBoardController {

	@Autowired
	private UserBoardService userBoardService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getList(Model model) {
		
		List<UserBoardVo> list = userBoardService.getUserArticleList();
		model.addAttribute("userArticleList", list);
		
		return "userboard/userboard";
	}
	
	
	
}
