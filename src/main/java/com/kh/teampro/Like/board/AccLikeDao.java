package com.kh.teampro.Like.board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccLikeDao {

	private final String NAMESPACE = "com.kh.teampro.AccomLikeMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	// 좋아요 추가
	public boolean addAccomLike(AccLikeVo accLikeVo) {
		int count = sqlSession.insert(NAMESPACE + "addAccomLike", accLikeVo);
		if (count > 0) {
			sqlSession.update(NAMESPACE + "updateAccomLikeCnt");
			return true;
		}
		return false;
	}
	
	// 좋아요 목록
	public boolean accomLikeList(AccLikeVo accLikeVo) {
		int count = sqlSession.selectOne(NAMESPACE + "accomLikeList", accLikeVo);
		if (count > 0) {
			sqlSession.update(NAMESPACE + "updateAccomLikeCnt");
			return true;
		}
		return false;
	}
	
	// 좋아요 취소
	public boolean deleteAccomLike(AccLikeVo accLikeVo) {
		int count = sqlSession.delete(NAMESPACE + "deleteAccomLike", accLikeVo);
		if (count > 0) {
			sqlSession.update(NAMESPACE + "updateAccomLikeCnt");
			return true;
		}
		return false;
	}
	
	// 좋아요 개수 확인
	public int getAccomLikeCount(int bno) {
		int count = sqlSession.selectOne(NAMESPACE + "getAccomLikeCount", bno);
		return count;
	}
}
