package com.kh.teampro.reply.user;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.teampro.commons.MyConstants;
import com.kh.teampro.paging.ReplyPagingDto;
import com.kh.teampro.user.info.UserVo;

@RestController
@RequestMapping("/userReply")
public class UserReplyController {

	@Autowired
	private UserReplyService userReplyService;
	
//	@RequestMapping(value = "/list", method = RequestMethod.GET) 
//    public List<UserReplyVo> getUserReply(int bno) {
//        return userReplyService.getUserReply(bno);
//	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET) 
	public Map<String, Object> getUserReply(ReplyPagingDto replyPagingDto) {
		System.out.println("controller, nowPage: " + replyPagingDto.getNowPage());
		return userReplyService.getTenReplies(replyPagingDto);
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertUserReply(UserReplyVo userReplyVo, HttpSession session) {
		
		UserVo loginInfo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		
		userReplyVo.setReplyer(loginInfo.getUnickname());
		userReplyVo.setUserid(loginInfo.getUserid());
		
		if (userReplyVo.getRlevel() == 0) { // 새 댓글인 경우
			userReplyService.insertUserNewReply(userReplyVo);
		} else { // 대댓글인 경우
			int bno = userReplyVo.getBno();
			int rgroup = userReplyService.getRgroup(userReplyVo.getRno());
			userReplyVo.setRgroup(rgroup);
			int maxRseq = 
					userReplyService.getMaxRseq(bno, userReplyVo.getRgroup());
			userReplyVo.setRseq(maxRseq + 1);
			userReplyService.insertUserReReply(userReplyVo);
		}
		
		return MyConstants.SUCCESS_MESSAGE;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.PATCH)
	public String deleteUserReply(@RequestBody UserReplyVo userReplyVo) {
		userReplyService.deleteReply(userReplyVo);
		return MyConstants.SUCCESS_MESSAGE;
	}
	
	@RequestMapping(value = "/checkDelete/{rno}", method = RequestMethod.GET)
	public boolean hasChildReply(@PathVariable String rno) {
		return userReplyService.hasChildReply(Integer.valueOf(rno));
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.PATCH)
	public String updateUserReply(@RequestBody UserReplyVo userReplyVo,
			HttpSession session) {
		
		UserVo loginInfo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		userReplyVo.setReplyer(loginInfo.getUnickname());
		userReplyService.updateUserReply(userReplyVo);
		return MyConstants.SUCCESS_MESSAGE;
	}
	
	@RequestMapping(value = "/replycnt/{bno}", method = RequestMethod.GET)
	public int getReplycnt(@PathVariable int bno) {
		return userReplyService.getReplycnt(bno);
	}
	
	@RequestMapping(value = "/totalCount/{bno}", method = RequestMethod.GET)
	public int getTotalCount(@PathVariable int bno) {
		return userReplyService.getReplycnt(bno);
	} 
	
	
	
}
