package com.kh.teampro.Like.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FoodLikeService {

	@Autowired
	private FoodLikeDao foodLikeDao;
	
	// 좋아요 추가
	public boolean addRestLike(FoodLikeVo foodLikeVo) {
		boolean result = foodLikeDao.addRestLike(foodLikeVo);
		return result;
	}
	
	// 좋아요 목록
	public boolean restLikeList(FoodLikeVo foodLikeVo) {
		boolean result = foodLikeDao.restLikeList(foodLikeVo);
		return result;
	}
	
	// 좋아요 취소
	public boolean deleteRestLike(FoodLikeVo foodLikeVo) {
		boolean result = foodLikeDao.deleteRestLike(foodLikeVo);
		return result;
	}
	
	// 좋아요 개수 확인
	public int getRestLikeCount(int bno) {
		int count = foodLikeDao.getRestLikeCount(bno);
		return count;
	}
}
