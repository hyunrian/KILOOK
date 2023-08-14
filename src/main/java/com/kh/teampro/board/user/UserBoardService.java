package com.kh.teampro.board.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserBoardService {

	@Autowired
	private UserBoardDao userBoardDao;
	
	public List<UserBoardVo> getUserArticleList() {
		return userBoardDao.getUserArticleList();
	}
	
	public UserBoardVo getUserArticleDetail(int bno) {
		return userBoardDao.getUserArticleDetail(bno);
	}
	
	public void addViewcnt(int bno) {
		userBoardDao.addViewcnt(bno);
	}
	
	@Transactional
	public void createArticle(UserBoardVo userBoardVo) {
		int bno = userBoardDao.getNextSeq();
		userBoardVo.setBno(bno);
		userBoardDao.createArticle(userBoardVo);
	}
	
	
}
