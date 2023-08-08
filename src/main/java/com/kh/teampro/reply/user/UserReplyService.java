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
	
	public int getReplycnt(int bno) {
		return userReplyDao.getReplycnt(bno);
	}
}
