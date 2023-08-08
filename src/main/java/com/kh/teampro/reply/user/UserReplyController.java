package com.kh.teampro.reply.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/userReply")
public class UserReplyController {

	@Autowired
	private UserReplyService userReplyService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getUserReply(int bno, Model model) {
		List<UserReplyVo> list = userReplyService.getUserReply(bno);
		model.addAttribute("userReplyList", list);
		return null;
		
	}
	
	@RequestMapping(value = "/viewcnt", method = RequestMethod.GET)
	public String getViewcnt(int bno) {
		int replycnt = userReplyService.getReplycnt(bno);
		return null;
	}
	
}
