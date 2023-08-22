package com.kh.teampro.user.info;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	// 유저 작성 글 정보 페이지에서 요청하는 만큼 읽기
	public List<UserBoardDto> readUserBoardInPage(String userid, UserInfoPagingDto infoPagingDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		int startRow = infoPagingDto.getStartRow();
		int endRow = infoPagingDto.getEndRow();
		map.put("userid", userid);
		map.put("startRow", startRow);
		map.put("endRow", endRow);		
		List<UserBoardDto> boardList = sqlSession.selectList(NAMESPACE + "readUserBoardInPage", map);
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
	// 유저 작성 댓글 정보 페이지에서 요청하는 만큼 읽기
	public List<UserReplyDto> readUserReplyInPage(String userid, UserInfoPagingDto infoPagingDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		int startRow = infoPagingDto.getStartRow();
		int endRow = infoPagingDto.getEndRow();
		map.put("userid", userid);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<UserReplyDto> replyList = sqlSession.selectList(NAMESPACE + "readUserReplyInPage", map);
		return replyList;
	}
	// 유저 작성 댓글 갯수
	public int readUserReplyCount(String userid) {
		int replyCount = sqlSession.selectOne(NAMESPACE + "readUserReplyCount", userid);
		return replyCount;
	}
	
	// 유저 메일등록 및 본인확인
	public void updateVerified(String uemail, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uemail", uemail);
		map.put("userid", userid);
		sqlSession.update(NAMESPACE + "updateVerified", map);
	}
	
}
