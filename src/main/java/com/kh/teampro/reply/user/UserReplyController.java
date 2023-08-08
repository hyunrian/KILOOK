package com.kh.teampro.reply.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/userReply")
public class UserReplyController {

	@Autowired
	private UserReplyService userReplyService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public List<UserReplyVo> getUserReply(int bno) {
		return userReplyService.getUserReply(bno);
	}
	
	@RequestMapping(value = "/viewcnt", method = RequestMethod.GET)
	public String getViewcnt(int bno) {
		int replycnt = userReplyService.getReplycnt(bno);
		return null;
	}
	
}
