package com.kh.teampro.user.info;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teampro.board.user.UserBoardVo;
import com.kh.teampro.reply.user.UserReplyVo;

@Service
public class UserInfoService {

	@Autowired
	private UserInfoDao userInfoDao;
	
	// 유저 한명 정보 읽기
	public UserVo readOneUserInfo(String userid) {
		UserVo userVo = userInfoDao.readOneUserInfo(userid);
		return userVo;
	}
	
	// 유저 정보 수정
	public void updateUserInfo(UserVo userVo) {
		userInfoDao.updateUserInfo(userVo);
	}
	
	// 유저 작성 글 정보 읽기
	public List<UserBoardVo> readUserBoard(String writer) {
		List<UserBoardVo> boardList = userInfoDao.readUserBoard(writer);
		return boardList;
	}
		
	// 유저 작성 댓글 정보 읽기
	public List<UserReplyVo> readUserReply(String replyer) {
		List<UserReplyVo> replyList = userInfoDao.readUserReply(replyer);
		return replyList;
	}
	
}
