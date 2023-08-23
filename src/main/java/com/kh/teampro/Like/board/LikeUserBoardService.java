package com.kh.teampro.Like.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.teampro.board.user.UserBoardDao;
import com.kh.teampro.board.user.UserBoardVo;

@Service
public class LikeUserBoardService {

	@Autowired
	private LikeUserBoardDao likeUserBoardDao;

	@Autowired
	private UserBoardDao userBoardDao;
	
	@Transactional
	public void addLike(LikeUserBoardVo likeUserBoardVo) {
		
		likeUserBoardDao.addLike(likeUserBoardVo);
		setUserBoardLikecnt(likeUserBoardVo.getBno());
	}
	
	@Transactional
	public void cancelLike(LikeUserBoardVo likeUserBoardVo) {
		likeUserBoardDao.cancelLike(likeUserBoardVo);
		setUserBoardLikecnt(likeUserBoardVo.getBno());
	}
	
	public boolean userLiked(LikeUserBoardVo likeUserBoardVo) {
		return likeUserBoardDao.userLiked(likeUserBoardVo);
	}
	
	public int countLikes(int bno) {
		return likeUserBoardDao.countLikes(bno);
	}
	
	public void setUserBoardLikecnt(int bno) {
		int likecnt = countLikes(bno);
		UserBoardVo userBoardVo = new UserBoardVo();
		userBoardVo.setBno(bno);
		userBoardVo.setLikecnt(likecnt);
		userBoardDao.updateLikecnt(userBoardVo);
		System.out.println("bno: " + bno + ", likecnt:" + likecnt);
	}
}
