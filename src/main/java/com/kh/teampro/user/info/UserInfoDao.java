package com.kh.teampro.user.info;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teampro.board.user.UserBoardVo;
import com.kh.teampro.reply.user.UserReplyVo;

@Repository
public class UserInfoDao {
	
	private final String NAMESPACE = "com.kh.teampro.UserInfoMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	// 유저 한명 정보 읽기
	public UserVo readOneUserInfo(String userid) {
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "readOneUserInfo", userid);
		return userVo;
	}
	
	// 유저 닉네임 읽기
	public String readUnickname(String userid) {
		return sqlSession.selectOne(NAMESPACE + "readUnickname", userid);
	}
	
	// 유저 정보 수정 
	public void updateUserInfo(UserVo userVo) {
		sqlSession.update(NAMESPACE + "updateUserInfo", userVo);
	}
	
	// 유저 작성 글 정보 읽기
	public List<UserBoardDto> readUserBoard(String userid) {
		List<UserBoardDto> boardList = sqlSession.selectList(NAMESPACE + "readUserBoard", userid);
		return boardList;
	}
	// 유저 작성 글 갯수
	public int readUserBoardCount(String userid) {
		int boardCount = sqlSession.selectOne(NAMESPACE + "readUserBoardCount", userid);
		return boardCount;
	}
	
	
	// 유저 작성 댓글 정보 읽기
	public List<UserReplyDto> readUserReply(String userid) {
		List<UserReplyDto> replyList = sqlSession.selectList(NAMESPACE + "readUserReply", userid);
		return replyList;
	}
	// 유저 작성 댓글 갯수
	public int readUserReplyCount(String userid) {
		int replyCount = sqlSession.selectOne(NAMESPACE + "readUserReplyCount", userid);
		return replyCount;
	}
	
}
