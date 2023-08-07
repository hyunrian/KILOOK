package com.kh.teampro.board.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserBoardService {

	@Autowired
	private UserBoardDao userBoardDao;
	
	public List<UserBoardVo> getUserArticleList() {
		return userBoardDao.getUserArticleList();
	}
	
}
