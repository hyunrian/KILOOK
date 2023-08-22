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
	public void deleteReply(UserReplyVo userReplyVo, String userid) {
		int rno = userReplyVo.getRno();
		String replyUserId =  getUserid(rno);
		
		if (replyUserId.equals(userid)) { // 댓글작성자와 로그인한 사용자가 동일할 때만 삭제 처리
			userReplyDao.deleteReply(rno);
			setUserBoardReplycnt(userReplyVo.getBno());
		}
	}
	
	public boolean hasChildReply(int rno) {
		return userReplyDao.hasChildReply(rno);
	}
	
	public void updateUserReply(UserReplyVo userReplyVo, String userid) {
		String replyer =  userReplyVo.getReplyer();
		if (replyer.equals(userid)) // 댓글작성자와 로그인한 사용자가 동일할 때만 수정 처리
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
		
		List<UserReplyVo> list = userReplyDao.getTenReplies(replyPagingDto);
		replyPagingDto.setNowPage(replyPagingDto.getNowPage() + 1);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("replyPagingDto", replyPagingDto);
		
		return map;
	}
	
	public int getTotalCount(int bno) {
		return userReplyDao.getTotalCount(bno);
	}
	
	public String getUserid(int rno) {
		return userReplyDao.getUserid(rno);
	}
}
