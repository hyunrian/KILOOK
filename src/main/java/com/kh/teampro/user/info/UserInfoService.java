package com.kh.teampro.user.info;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 유저 닉네임 읽기
	public String readUnickname(String userid) {
		return userInfoDao.readUnickname(userid);
	}
	
	// 유저 정보 수정
	public void updateUserInfo(UserVo userVo) {
		userInfoDao.updateUserInfo(userVo);
	}
	
	// 유저 작성 글 정보 읽기
	public List<UserBoardDto> readUserBoard(String userid) {
		List<UserBoardDto> boardList = userInfoDao.readUserBoard(userid);
		return boardList;
	}
	// 유저 작성 글 정보 페이지에서 요청하는 만큼 읽기
	public List<UserBoardDto> readUserBoardInPage(String userid, UserInfoPagingDto infoPagingDto) {
		List<UserBoardDto> boardList = userInfoDao.readUserBoardInPage(userid, infoPagingDto);
		return boardList;
	}
	// 유저 작성 글 갯수
	public int readUserBoardCount(String userid) {
		int boardCount = userInfoDao.readUserBoardCount(userid);
		return boardCount;
	}
		
	// 유저 작성 댓글 정보 읽기
	public List<UserReplyDto> readUserReply(String userid) {
		List<UserReplyDto> replyList = userInfoDao.readUserReply(userid);
		return replyList;
	}
	// 유저 작성 댓글 정보 페이지에서 요청하는 만큼 읽기
	public List<UserReplyDto> readUserReplyInPage(String userid, UserInfoPagingDto infoPagingDto) {
		List<UserReplyDto> replyList = userInfoDao.readUserReplyInPage(userid, infoPagingDto);
		return replyList;
	}
	// 유저 작성 댓글 갯수
	public int readUserReplyCount(String userid) {
		int replyCount = userInfoDao.readUserReplyCount(userid);
		return replyCount;
	}
	
	// 유저 메일등록 및 본인확인
	public void updateVerified(String uemail, String userid) {
		userInfoDao.updateVerified(uemail, userid);
	}
	
	// 중복 닉네임 확인 (return = "success" or "fail")
	public String  dubCheckID(String unickname) {
		return userInfoDao.dubCheckID(unickname);
	}
	
}
