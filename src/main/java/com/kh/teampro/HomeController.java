package com.kh.teampro;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.teampro.board.user.UserBoardService;
import com.kh.teampro.board.user.UserBoardVo;

@Controller
public class HomeController {
	
	@Autowired
	private UserBoardService userBoardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<UserBoardVo> list = userBoardService.getTopSix();
		model.addAttribute("list", list);
		
		return "index";
	}
	
}
