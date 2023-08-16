package com.kh.teampro.Like.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlaceLikeService {

	@Autowired
	private PlaceLikeDao placeLikeDao;
	
	// 좋아요 추가
	public boolean addPlaceLike(PlaceLikeVo placeLikeVo) {
		boolean result = placeLikeDao.addPlaceLike(placeLikeVo);
		return result;
	}
	
	// 좋아요 목록
	public boolean placeLikeList(PlaceLikeVo placeLikeVo) {
		boolean result = placeLikeDao.placeLikeList(placeLikeVo);
		return result;
	}
	
	// 좋아요 취소
	public boolean deletePlaceLike(PlaceLikeVo placeLikeVo) {
		boolean result = placeLikeDao.deletePlaceLike(placeLikeVo);
		return result;
	}
	
	// 좋아요 개수 확인
	public int getPlaceLikeCount(int bno) {
		int count = placeLikeDao.getPlaceLikeCount(bno);
		return count;
	}
}
