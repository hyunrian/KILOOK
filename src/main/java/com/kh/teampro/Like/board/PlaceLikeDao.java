package com.kh.teampro.Like.board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlaceLikeDao {

	private final String NAMESPACE = "com.kh.teampro.PlaceLikeMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	// 좋아요 추가
	public boolean addPlaceLike(PlaceLikeVo placeLikeVo) {
		int count = sqlSession.insert(NAMESPACE + "addPlaceLike", placeLikeVo);
		if (count > 0) {
			sqlSession.update(NAMESPACE + "updatePlaceLikeCnt");
			return true;
		}
		return false;
	}
	
	// 좋아요 목록
	public boolean placeLikeList(PlaceLikeVo placeLikeVo) {
		int count = sqlSession.selectOne(NAMESPACE + "placeLikeList", placeLikeVo);
		if (count > 0) {
			sqlSession.update(NAMESPACE + "updatePlaceLikeCnt");
			return true;
		}
		return false;
	}
	
	// 좋아요 취소
	public boolean deletePlaceLike(PlaceLikeVo placeLikeVo) {
		int count = sqlSession.delete(NAMESPACE + "deletePlaceLike", placeLikeVo);
		if (count > 0) {
			sqlSession.update(NAMESPACE + "updatePlaceLikeCnt");
			return true;
		}
		return false;
	}
	
	// 좋아요 개수 확인
	public int getPlaceLikeCount(int bno) {
		int count = sqlSession.selectOne(NAMESPACE + "getPlaceLikeCount", bno);
		return count;
	}
}
