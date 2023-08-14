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
	
	public UserBoardVo getUserArticleDetail(int bno) {
		return userBoardDao.getUserArticleDetail(bno);
	}
	
	public void addViewcnt(int bno) {
		userBoardDao.addViewcnt(bno);
	}
	
	// 첨부파일 테이블 데이터 삭제
	public void deleteFileData(String filename) {
		userBoardDao.deleteFileData(filename);
	}
	
}
