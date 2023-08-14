package com.kh.teampro.reply.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserReplyService {

	@Autowired
	private UserReplyDao userReplyDao;
	
	public List<UserReplyVo> getUserReply(int bno) {
		return userReplyDao.getUserReply(bno);
	}
	
	public void insertUserNewReply(UserReplyVo userReplyVo) {
		userReplyDao.insertUserNewReply(userReplyVo);
	}
	
	public void insertUserReReply(UserReplyVo userReplyVo) {
		userReplyDao.insertUserReReply(userReplyVo);
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
	
	public void deleteReply(int rno) {
		userReplyDao.deleteReply(rno);
	}
	
	public boolean hasChildReply(int rno) {
		return userReplyDao.hasChildReply(rno);
	}
	
	public void updateUserReply(UserReplyVo userReplyVo) {
		userReplyDao.updateUserReply(userReplyVo);
	}
	
}
