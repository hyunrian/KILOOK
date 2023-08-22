package com.kh.teampro.reply.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teampro.paging.ReplyPagingDto;

@Repository
public class UserReplyDao {

	private static final String NAMESPACE = "com.kh.teampro.UserReplyMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<UserReplyVo> getUserReply(int bno) {
		if (getReplycnt(bno) != 0)
			return sqlSession.selectList(NAMESPACE + "getUserReply", bno);
		else return null;
	}
	
	public void insertUserNewReply(UserReplyVo userReplyVo) {
		sqlSession.insert(NAMESPACE + "insertUserNewReply", userReplyVo);
	}
	
	public void insertUserReReply(UserReplyVo userReplyVo) {
		sqlSession.insert(NAMESPACE + "insertUserReReply", userReplyVo);
	}
	
	public int getMaxRseq(int bno, int rgroup) {
		Map<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("rgroup", rgroup);
		return sqlSession.selectOne(NAMESPACE + "getMaxRseq", map);
	}
	
	public int getReplycnt(int bno) {
		return sqlSession.selectOne(NAMESPACE + "getReplycnt", bno);
	}
	
	public int getRgroup(int rno) {
		return sqlSession.selectOne(NAMESPACE + "getRgroup", rno);
	}
	
	public void deleteReply(int rno) {
		sqlSession.update(NAMESPACE + "deleteReply", rno);
	}
	
	public boolean hasChildReply(int rno) {
		int childCnt = sqlSession.selectOne(NAMESPACE + "hasChildReply", rno);
		if (childCnt > 0) return true;
		else return false;
	}
	
	public void updateUserReply(UserReplyVo userReplyVo) {
		sqlSession.update(NAMESPACE + "updateUserReply", userReplyVo);
	}
	
	public List<UserReplyVo> getTenReplies(ReplyPagingDto replyPagingDto) {
		System.out.println("dao, dto: " + replyPagingDto);
		return sqlSession.selectList(NAMESPACE + "getTenReplies", replyPagingDto);
	}
	
	public int getTotalCount(int bno) {
		return sqlSession.selectOne(NAMESPACE + "getTotalCount", bno);
	}
	
	public String getUserid(int rno) {
		return sqlSession.selectOne(NAMESPACE + "getUserid", rno);
	}
}
