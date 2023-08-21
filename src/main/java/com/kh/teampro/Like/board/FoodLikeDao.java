package com.kh.teampro.Like.board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FoodLikeDao {

	private final String NAMESPACE = "com.kh.teampro.FoodLikeMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	// 좋아요 추가
	public boolean addRestLike(FoodLikeVo foodLikeVo) {
		int count = sqlSession.insert(NAMESPACE + "addRestLike", foodLikeVo);
		if (count > 0) {
			sqlSession.update(NAMESPACE + "updateFoodLikeCnt");
			return true;
		}
		return false;
	}
	
	// 좋아요 목록
	public boolean restLikeList(FoodLikeVo foodLikeVo) {
		int count = sqlSession.selectOne(NAMESPACE + "restLikeList", foodLikeVo);
		if (count > 0) {
			sqlSession.update(NAMESPACE + "updateFoodLikeCnt");
			return true;
		}
		return false;
	}
	
	// 좋아요 취소
	public boolean deleteRestLike(FoodLikeVo foodLikeVo) {
		int count = sqlSession.delete(NAMESPACE + "deleteRestLike", foodLikeVo);
		if (count > 0) {
			sqlSession.update(NAMESPACE + "updateFoodLikeCnt");
			return true;
		}
		return false;
	}
	
	// 좋아요 개수 확인
	public int getRestLikeCount(int bno) {
		int count = sqlSession.selectOne(NAMESPACE + "getRestLikeCount", bno);
		return count;
	}
}
