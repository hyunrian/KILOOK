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
	
	// 유저 정보 수정 
	public void updateUserInfo(UserVo userVo) {
		sqlSession.update(NAMESPACE + "updateUserInfo", userVo);
	}
	
	// 유저 작성 글 정보 읽기
	public List<UserBoardVo> readUserBoard(String writer) {
		List<UserBoardVo> boardList = sqlSession.selectList(NAMESPACE + "readUserBoard", writer);
		return boardList;
	}
	
	// 유저 작성 댓글 정보 읽기
	public List<UserReplyVo> readUserReply(String replyer) {
		List<UserReplyVo> replyList = sqlSession.selectList(NAMESPACE + "readUserReply", replyer);
		return replyList;
	}
}
