package com.kh.teampro.Like.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccLikeService {

	@Autowired
	private AccLikeDao accLikeDao;
	
	// 좋아요 추가
	public boolean addAccomLike(AccLikeVo accLikeVo) {
		boolean result = accLikeDao.addAccomLike(accLikeVo);
		return result;
	}
	
	// 좋아요 목록
	public boolean accomLikeList(AccLikeVo accLikeVo) {
		boolean result = accLikeDao.accomLikeList(accLikeVo);
		return result;
	}
	
	// 좋아요 취소
	public boolean deleteAccomLike(AccLikeVo accLikeVo) {
		boolean result = accLikeDao.deleteAccomLike(accLikeVo);
		return result;
	}
	
	// 좋아요 개수 확인
	public int getAccomLikeCount(int bno) {
		int count = accLikeDao.getAccomLikeCount(bno);
		return count;
	}
}
