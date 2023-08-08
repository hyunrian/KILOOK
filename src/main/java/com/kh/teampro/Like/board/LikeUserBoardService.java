package com.kh.teampro.Like.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeUserBoardService {

	@Autowired
	private LikeUserBoardDao likeUserBoardDao;
	
	public void addLike(LikeUserBoardVo likeUserBoardVo) {
		likeUserBoardDao.addLike(likeUserBoardVo);
	}
	
	public void cancelLike(LikeUserBoardVo likeUserBoardVo) {
		likeUserBoardDao.cancelLike(likeUserBoardVo);
	}
	
	public boolean userLiked(LikeUserBoardVo likeUserBoardVo) {
		return likeUserBoardDao.userLiked(likeUserBoardVo);
	}
	
	public int countLikes(int bno) {
		return likeUserBoardDao.countLikes(bno);
	}
}
