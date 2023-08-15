package com.kh.teampro.board.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.teampro.attach.AttachService;
import com.kh.teampro.attach.AttachVo;

@Service
public class UserBoardService {

	@Autowired
	private UserBoardDao userBoardDao;
	
	@Autowired
	private AttachService attachService;
	
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
	public void createArticle(UserBoardVo userBoardVo, String thumbnail) {
		int bno = userBoardDao.getNextSeq();
		userBoardVo.setBno(bno);
		userBoardDao.createArticle(userBoardVo);
		
		if (thumbnail != null && !(thumbnail == "")) {
			attachService.insertFileData(new AttachVo(thumbnail, bno));
		}
	}
	
	public int getNextSeq() {
		return userBoardDao.getNextSeq(); 
	}
	
	public void deleteArticle(int bno) {
		userBoardDao.deleteArticle(bno);
	}
	
}
