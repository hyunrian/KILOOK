package com.kh.teampro.reply.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.teampro.board.user.UserBoardDao;
import com.kh.teampro.board.user.UserBoardVo;
import com.kh.teampro.paging.ReplyPagingDto;

@Service
public class UserReplyService {

	@Autowired
	private UserReplyDao userReplyDao;
	
	@Autowired
	private UserBoardDao userBoardDao;
	
	public List<UserReplyVo> getUserReply(int bno) {
		return userReplyDao.getUserReply(bno);
	}
	
	@Transactional
	public void insertUserNewReply(UserReplyVo userReplyVo) {
		userReplyDao.insertUserNewReply(userReplyVo);
		setUserBoardReplycnt(userReplyVo.getBno());
	}
	
	public void insertUserReReply(UserReplyVo userReplyVo) {
		userReplyDao.insertUserReReply(userReplyVo);
		setUserBoardReplycnt(userReplyVo.getBno());
	}
	
	public int getMaxRseq(int bno, int rgroup) {
		return userReplyDao.getMaxRseq(bno, rgroup);
	}
	
	public int getReplycnt(int bno) {
		return userReplyDao.getReplycnt(bno);
	}
	
	public int getRgroup(int rno) {
		return userReplyDao.getRgroup(rno);
	}
	
	@Transactional
	public void deleteReply(UserReplyVo userReplyVo) {
		userReplyDao.deleteReply(userReplyVo.getRno());
		setUserBoardReplycnt(userReplyVo.getBno());
	}
	
	public boolean hasChildReply(int rno) {
		return userReplyDao.hasChildReply(rno);
	}
	
	public void updateUserReply(UserReplyVo userReplyVo) {
		userReplyDao.updateUserReply(userReplyVo);
	}
	
	public void setUserBoardReplycnt(int bno) {
		UserBoardVo userBoardVo = new UserBoardVo();
		int replycnt = getReplycnt(bno);
		userBoardVo.setBno(bno);
		userBoardVo.setReplycnt(replycnt);
		userBoardDao.updateReplycnt(userBoardVo);
	}
	
	public Map<String, Object> getTenReplies(ReplyPagingDto replyPagingDto) {
		
		int bno = replyPagingDto.getBno();
		int totalCount = getTotalCount(bno);
		int nowPage = replyPagingDto.getNowPage();
		
		replyPagingDto = new ReplyPagingDto(bno, nowPage, totalCount);
		
		System.out.println("in dto: " + replyPagingDto);
		List<UserReplyVo> list = userReplyDao.getTenReplies(replyPagingDto);
		replyPagingDto.setNowPage(replyPagingDto.getNowPage() + 1);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("replyPagingDto", replyPagingDto);
		
		System.out.println("out dto: " + replyPagingDto);
//		System.out.println("out list: " + list);
		
		return map;
	}
	
	public int getTotalCount(int bno) {
		return userReplyDao.getTotalCount(bno);
	}
}
