package com.kh.teampro.reply.user;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserReplyDao {

	private static final String NAMESPACE = "com.kh.teampro.UserReplyMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<UserReplyVo> getUserReply(int bno) {
		return sqlSession.selectList(NAMESPACE + "getUserReply");
	}
	
	public void insertUserReply(UserReplyVo userReplyVo) {
		sqlSession.insert(NAMESPACE + "insertUserReply", userReplyVo);
	}
	
	public int getReplycnt(int bno) {
		return sqlSession.selectOne(NAMESPACE + "getReplycnt", bno);
	}
}
